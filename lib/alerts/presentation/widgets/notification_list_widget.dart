import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import '../../application/alert_cubit.dart';
import '../../application/alert_state.dart';
import '../../domain/alert_model.dart';

class NotificationListWidget extends StatelessWidget {
  const NotificationListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertCubit, AlertState>(
      builder: (context, state) {
        if (state.isAlertsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        if (state.hasAlertsError) {
          return Center(
            child: Text(
              'Failed to load notifications',
              style: TextStyle(color: Colors.red, fontSize: KSizes.fontSizeM),
            ),
          );
        }

        if (state.alerts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.white54,
                  size: KSizes.iconXL,
                ),
                const SizedBox(height: KSizes.margin2x),
                Text(
                  'No notifications yet',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: KSizes.fontSizeM,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: KSizes.margin1x),
                Text(
                  'Aurora and solar notifications will appear here',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: KSizes.fontSizeS,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return Container(
          height: 400, // Fixed height for scroll area
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(KSizes.radiusDefault),
            border: Border.all(color: Colors.grey[700]!, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(KSizes.margin4x),
                child: Text(
                  'NOTIFICATIONS',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: KSizes.fontSizeM,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: KSizes.margin4x,
                  ),
                  itemCount: state.alerts.length,
                  itemBuilder: (context, index) {
                    final notification = state.alerts[index];
                    return NotificationTile(
                      notification: notification,
                      onTap: () {
                        // Mark as read when tapped
                        context.read<AlertCubit>().markNotificationAsRead(
                          notification.id,
                        );
                        // Launch NASA URL
                        _launchNasaUrl(notification.nasaUrl);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _launchNasaUrl(String url) async {
    if (url.isNotEmpty) {
      try {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      } catch (e) {
        // Handle launch error silently - in a real app you might show a snackbar
        debugPrint('Failed to launch URL: $e');
      }
    }
  }
}

class NotificationTile extends StatelessWidget {
  final AlertModel notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: KSizes.margin2x),
      decoration: BoxDecoration(
        color: notification.status == NotificationStatus.unread
            ? Colors.grey[800]
            : Colors.grey[850],
        borderRadius: BorderRadius.circular(KSizes.radiusDefault),
        border: notification.status == NotificationStatus.unread
            ? Border.all(color: _getTypeColor(notification.type), width: 2)
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(KSizes.radiusDefault),
        child: Padding(
          padding: const EdgeInsets.all(KSizes.margin4x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: KSizes.margin2x,
                      vertical: KSizes.margin1x,
                    ),
                    decoration: BoxDecoration(
                      color: _getTypeColor(notification.type),
                      borderRadius: BorderRadius.circular(
                        KSizes.radiusDefault / 2,
                      ),
                    ),
                    child: Text(
                      _getTypeText(notification.type),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: KSizes.fontSizeS,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (notification.status == NotificationStatus.unread)
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  const SizedBox(width: KSizes.margin2x),
                  Text(
                    _formatTimestamp(notification.timestamp),
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: KSizes.fontSizeS,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: KSizes.margin2x),
              Text(
                notification.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: KSizes.fontSizeM,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: KSizes.margin1x),
              Text(
                notification.message,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: KSizes.fontSizeS,
                ),
              ),
              if (notification.nasaUrl.isNotEmpty) ...[
                const SizedBox(height: KSizes.margin2x),
                Row(
                  children: [
                    Icon(Icons.link, color: Colors.blue, size: KSizes.iconS),
                    const SizedBox(width: KSizes.margin1x),
                    Text(
                      'View NASA Report',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: KSizes.fontSizeS,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(AlertType type) {
    switch (type) {
      case AlertType.aurora:
        return Colors.green;
      case AlertType.solar:
        return Colors.orange;
      case AlertType.geomagnetic:
        return Colors.purple;
    }
  }

  String _getTypeText(AlertType type) {
    switch (type) {
      case AlertType.aurora:
        return 'AURORA';
      case AlertType.solar:
        return 'SOLAR';
      case AlertType.geomagnetic:
        return 'GEOMAGNETIC';
    }
  }

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) return '';

    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
