import 'package:flutter/foundation.dart';

/// CORS proxy service for handling cross-origin requests in web environments
class CorsProxyService {
  const CorsProxyService._();

  static const CorsProxyService _instance = CorsProxyService._();
  static CorsProxyService get instance => _instance;

  /// Available CORS proxy services (ordered by reliability)
  static const List<CorsProxy> _availableProxies = [
    CorsProxy(
      name: 'CodeTabs',
      baseUrl: 'https://api.codetabs.com/v1/proxy?quest=',
      description: 'Fast and reliable proxy service',
    ),
    CorsProxy(
      name: 'AllOrigins',
      baseUrl: 'https://api.allorigins.win/raw?url=',
      description: 'Good for JSON and text content',
    ),
    CorsProxy(
      name: 'CorsProxy.io',
      baseUrl: 'https://corsproxy.io/?',
      description: 'Alternative CORS proxy service',
    ),
  ];

  /// Get proxied URL for web platform, direct URL for mobile/desktop
  String getProxiedUrl(String originalUrl, {int proxyIndex = 0}) {
    if (!kIsWeb) {
      // No CORS restrictions on mobile/desktop
      return originalUrl;
    }

    if (proxyIndex >= _availableProxies.length) {
      // Return direct URL with cache busting if all proxies exhausted
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      return '$originalUrl?t=$timestamp';
    }

    final proxy = _availableProxies[proxyIndex];
    final proxiedUrl = '${proxy.baseUrl}$originalUrl';

    if (kDebugMode) {
      print('CorsProxyService: Using ${proxy.name} proxy for: $originalUrl');
      print('CorsProxyService: Proxied URL: $proxiedUrl');
    }

    return proxiedUrl;
  }

  /// Get next proxy URL for retry scenarios
  String getNextProxyUrl(String originalUrl, int currentRetryCount) {
    final proxyIndex = currentRetryCount - 1;
    return getProxiedUrl(originalUrl, proxyIndex: proxyIndex);
  }

  /// Extract original URL from a proxied URL
  String extractOriginalUrl(String proxiedUrl) {
    for (final proxy in _availableProxies) {
      if (proxiedUrl.startsWith(proxy.baseUrl)) {
        return proxiedUrl.substring(proxy.baseUrl.length);
      }
    }

    // Remove any cache busting parameters
    final uri = Uri.parse(proxiedUrl);
    final cleanUri = uri.replace(
      queryParameters: {
        ...uri.queryParameters
          ..removeWhere((key, value) => key == 't' || key == 'retry'),
      },
    );

    return cleanUri.toString();
  }

  /// Get proxy name for display purposes
  String getProxyName(int proxyIndex) {
    if (proxyIndex >= _availableProxies.length) {
      return 'Direct';
    }
    return _availableProxies[proxyIndex].name;
  }

  /// Get total number of available proxies
  int get totalProxies => _availableProxies.length;

  /// Check if we should use proxy for current platform
  bool get shouldUseProxy => kIsWeb;

  /// Get proxy information for debugging
  List<CorsProxy> get availableProxies => List.unmodifiable(_availableProxies);

  /// Add cache busting to URL
  String addCacheBusting(String url, {int? retryCount}) {
    final uri = Uri.parse(url);
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    final newQuery = {
      ...uri.queryParameters,
      't': timestamp.toString(),
      if (retryCount != null) 'retry': retryCount.toString(),
    };

    return uri.replace(queryParameters: newQuery).toString();
  }

  /// Generate retry strategy for image loading
  RetryStrategy generateRetryStrategy(String originalUrl) {
    return RetryStrategy(
      originalUrl: originalUrl,
      totalAttempts: kIsWeb ? _availableProxies.length + 3 : 3,
      proxyService: this,
    );
  }
}

/// Information about a CORS proxy service
class CorsProxy {
  final String name;
  final String baseUrl;
  final String description;

  const CorsProxy({
    required this.name,
    required this.baseUrl,
    required this.description,
  });

  @override
  String toString() => '$name ($baseUrl)';
}

/// Retry strategy for handling failed requests
class RetryStrategy {
  final String originalUrl;
  final int totalAttempts;
  final CorsProxyService proxyService;

  int _currentAttempt = 0;

  RetryStrategy({
    required this.originalUrl,
    required this.totalAttempts,
    required this.proxyService,
  });

  /// Get URL for current retry attempt
  String getCurrentUrl() {
    if (_currentAttempt == 0) {
      // First attempt - use default proxy
      return proxyService.getProxiedUrl(originalUrl);
    }

    if (kIsWeb && _currentAttempt <= proxyService.totalProxies) {
      // Try different proxies
      return proxyService.getProxiedUrl(
        originalUrl,
        proxyIndex: _currentAttempt - 1,
      );
    } else {
      // Cache-busted direct URL
      return proxyService.addCacheBusting(
        originalUrl,
        retryCount: _currentAttempt,
      );
    }
  }

  /// Move to next retry attempt
  String getNextUrl() {
    _currentAttempt++;
    return getCurrentUrl();
  }

  /// Check if more retries are available
  bool get hasMoreRetries => _currentAttempt < totalAttempts;

  /// Get user-friendly description of current attempt
  String getAttemptDescription() {
    if (_currentAttempt == 0) {
      return kIsWeb ? 'Loading with proxy...' : 'Loading...';
    }

    if (kIsWeb && _currentAttempt <= proxyService.totalProxies) {
      final proxyName = proxyService.getProxyName(_currentAttempt - 1);
      return 'Trying $proxyName proxy...';
    } else {
      return 'Retrying direct connection...';
    }
  }

  /// Get retry button text
  String getRetryButtonText() {
    if (kIsWeb && _currentAttempt < proxyService.totalProxies) {
      final proxyName = proxyService.getProxyName(_currentAttempt);
      return 'Try $proxyName';
    } else {
      return 'Retry';
    }
  }

  /// Reset retry strategy
  void reset() {
    _currentAttempt = 0;
  }

  /// Get current attempt number (0-based)
  int get currentAttempt => _currentAttempt;
}
