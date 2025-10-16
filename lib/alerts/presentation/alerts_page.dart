import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import '../application/alert_cubit.dart';
import 'widgets/alerts_toggle_widget.dart';
import 'widgets/notification_list_widget.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlertCubit()..initialize(),
      child: const AlertsView(),
    );
  }
}

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 24),
                const Text(
                  'Alerts',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: KSizes.fontSizeXXL,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: KSizes.iconXL,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSizes.margin4x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: KSizes.margin4x),
            const Text(
              'GLOBAL SETTINGS',
              style: TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: KSizes.fontSizeM,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: KSizes.margin4x),
            const AlertsToggleWidget(),
            const SizedBox(height: KSizes.margin4x * 2),
            const Expanded(child: NotificationListWidget()),
          ],
        ),
      ),
    );
  }
}
