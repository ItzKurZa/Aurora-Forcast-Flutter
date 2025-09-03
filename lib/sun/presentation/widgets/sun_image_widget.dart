import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import 'package:aurora_forecast/core/services/cors_proxy_service.dart';

class SunImageWidget extends StatefulWidget {
  final String imageUrl;
  final String label;

  const SunImageWidget({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  State<SunImageWidget> createState() => _SunImageWidgetState();
}

class _SunImageWidgetState extends State<SunImageWidget> {
  late RetryStrategy _retryStrategy;
  String? _currentUrl;
  bool _hasError = false;
  final CorsProxyService _corsProxy = CorsProxyService.instance;

  @override
  void initState() {
    super.initState();
    final originalUrl = _corsProxy.extractOriginalUrl(widget.imageUrl);
    _retryStrategy = _corsProxy.generateRetryStrategy(originalUrl);
    _currentUrl = widget.imageUrl;
  }

  void _onImageError() {
    if (mounted && _retryStrategy.hasMoreRetries) {
      setState(() {
        _hasError = false;
        _currentUrl = _retryStrategy.getNextUrl();
      });
    } else {
      setState(() {
        _hasError = true;
      });
    }
  }

  String _getRetryButtonText() {
    return _retryStrategy.getRetryButtonText();
  }

  String _getWebErrorMessage() {
    return _retryStrategy.getAttemptDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(KSizes.radiusDefault),
            child: _hasError ? _buildErrorWidget() : _buildImageWidget(),
          ),
        ),
        const SizedBox(height: KSizes.margin2x),
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: KSizes.fontSizeM,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildImageWidget() {
    return Image.network(
      _currentUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      headers: kIsWeb
          ? {
              'Accept': 'image/*',
              'User-Agent': 'Mozilla/5.0 (compatible; Flutter Aurora Forecast)',
            }
          : null,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded /
                          (progress.expectedTotalBytes ?? 1)
                    : null,
                color: Colors.orange,
              ),
              const SizedBox(height: KSizes.margin2x),
              Text(
                'Loading ${widget.label}...',
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: KSizes.fontSizeS,
                ),
              ),
            ],
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _onImageError();
        });
        return _buildErrorWidget();
      },
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: double.infinity,
      color: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            color: Colors.orange,
            size: KSizes.iconL,
          ),
          const SizedBox(height: KSizes.margin2x),
          Text(
            'Image Unavailable',
            style: const TextStyle(
              color: Colors.white,
              fontSize: KSizes.fontSizeM,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: KSizes.margin1x),
          Text(
            kIsWeb ? _getWebErrorMessage() : 'Network connection issue',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: KSizes.fontSizeS,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: KSizes.margin2x),
          if (_retryStrategy.hasMoreRetries)
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _hasError = false;
                  _currentUrl = _retryStrategy.getNextUrl();
                });
              },
              icon: const Icon(Icons.refresh, size: KSizes.iconS),
              label: Text(_getRetryButtonText()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
