// Example usage of CorsProxyService for other features

import 'package:aurora_forecast/core/services/cors_proxy_service.dart';
import 'package:flutter/material.dart';

/// Example of how to use CorsProxyService in other widgets/services
class ExampleUsage {
  final CorsProxyService _corsProxy = CorsProxyService.instance;

  /// Example 1: Simple URL proxying
  String getProxiedImageUrl(String originalUrl) {
    return _corsProxy.getProxiedUrl(originalUrl);
  }

  /// Example 2: Manual retry with different proxies
  String getRetryUrl(String originalUrl, int attemptNumber) {
    return _corsProxy.getNextProxyUrl(originalUrl, attemptNumber);
  }

  /// Example 3: Using RetryStrategy for automatic fallbacks
  RetryStrategy createRetryStrategy(String originalUrl) {
    return _corsProxy.generateRetryStrategy(originalUrl);
  }

  /// Example 4: Extract original URL from proxied URL
  String getOriginalUrl(String proxiedUrl) {
    return _corsProxy.extractOriginalUrl(proxiedUrl);
  }

  /// Example 5: Check if platform needs proxy
  bool needsProxy() {
    return _corsProxy.shouldUseProxy;
  }

  /// Example 6: Get proxy information for debugging
  void debugProxyInfo() {
    print('Available proxies: ${_corsProxy.availableProxies.length}');
    for (final proxy in _corsProxy.availableProxies) {
      print('  - ${proxy.name}: ${proxy.description}');
    }
  }
}

/// Example widget showing how to use CorsProxyService with Image.network
class ExampleImageWidget extends StatefulWidget {
  final String imageUrl;

  const ExampleImageWidget({super.key, required this.imageUrl});

  @override
  State<ExampleImageWidget> createState() => _ExampleImageWidgetState();
}

class _ExampleImageWidgetState extends State<ExampleImageWidget> {
  late RetryStrategy _retryStrategy;
  String? _currentUrl;
  bool _hasError = false;
  final CorsProxyService _corsProxy = CorsProxyService.instance;

  @override
  void initState() {
    super.initState();
    // Extract original URL if already proxied
    final originalUrl = _corsProxy.extractOriginalUrl(widget.imageUrl);
    _retryStrategy = _corsProxy.generateRetryStrategy(originalUrl);
    _currentUrl = _corsProxy.getProxiedUrl(originalUrl);
  }

  void _onImageError() {
    if (_retryStrategy.hasMoreRetries) {
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

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Column(
        children: [
          const Icon(Icons.error),
          const Text('Failed to load image'),
          if (_retryStrategy.hasMoreRetries)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _hasError = false;
                  _currentUrl = _retryStrategy.getNextUrl();
                });
              },
              child: Text(_retryStrategy.getRetryButtonText()),
            ),
        ],
      );
    }

    return Image.network(
      _currentUrl!,
      errorBuilder: (context, error, stackTrace) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _onImageError();
        });
        return const CircularProgressIndicator();
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
              : null,
        );
      },
    );
  }
}

/// Example HTTP service using CorsProxyService
class ExampleApiService {
  final CorsProxyService _corsProxy = CorsProxyService.instance;

  /// Method to fetch data with automatic CORS handling
  Future<String> fetchData(String apiUrl) async {
    final retryStrategy = _corsProxy.generateRetryStrategy(apiUrl);

    while (retryStrategy.hasMoreRetries) {
      try {
        final url = retryStrategy.getCurrentUrl();
        // Use your preferred HTTP client here (dio, http, etc.)
        // final response = await httpClient.get(url);
        // return response.data;

        // For demo purposes, just return the URL
        return url;
      } catch (e) {
        if (retryStrategy.hasMoreRetries) {
          retryStrategy.getNextUrl(); // Move to next attempt
        } else {
          rethrow;
        }
      }
    }

    throw Exception('All retry attempts failed');
  }
}
