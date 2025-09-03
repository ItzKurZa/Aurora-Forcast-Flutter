import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'cors_proxy_service.dart';

/// Base HTTP client service with CORS handling
class BaseHttpService {
  late final Dio _dio;

  BaseHttpService({String? baseUrl}) {
    _dio = _createDio(baseUrl: baseUrl);
  }

  Dio get dio => _dio;

  static Dio _createDio({String? baseUrl}) {
    final dio = Dio();

    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }

    // Set timeouts
    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
    dio.options.sendTimeout = const Duration(seconds: 15);

    // Set headers for better CORS compatibility
    dio.options.headers.addAll({
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Accept-Language': 'en-US,en;q=0.9',
      'Cache-Control': 'no-cache',
      'Pragma': 'no-cache',
    });

    if (kIsWeb) {
      // Additional headers for web CORS
      dio.options.headers.addAll({
        'User-Agent': 'Mozilla/5.0 (compatible; Flutter Aurora Forecast)',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'cross-site',
      });
    }

    // Add interceptors for logging and error handling
    dio.interceptors.add(
      LogInterceptor(
        requestBody: false,
        responseBody: false,
        requestHeader: kDebugMode,
        responseHeader: kDebugMode,
      ),
    );

    // Add retry interceptor for network issues
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) async {
          if (_shouldRetry(error)) {
            try {
              final response = await dio.fetch(error.requestOptions);
              handler.resolve(response);
              return;
            } catch (e) {
              // If retry fails, continue with original error
            }
          }
          handler.next(error);
        },
      ),
    );

    return dio;
  }

  static bool _shouldRetry(DioException error) {
    // Retry on network errors and specific HTTP errors
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError ||
        (error.response?.statusCode == 408) || // Request Timeout
        (error.response?.statusCode == 429) || // Too Many Requests
        (error.response?.statusCode == 502) || // Bad Gateway
        (error.response?.statusCode == 503) || // Service Unavailable
        (error.response?.statusCode == 504); // Gateway Timeout
  }

  /// Get with CORS fallback strategies
  Future<Response> getWithCorsHandling(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    List<String>? corsProxies,
  }) async {
    final finalOptions = options ?? Options();

    // Try direct request first
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        options: finalOptions,
      );
    } on DioException {
      // If CORS error on web, try with proxies
      if (kIsWeb && corsProxies != null && corsProxies.isNotEmpty) {
        for (final proxy in corsProxies) {
          try {
            final proxiedUrl = '$proxy$path';
            return await _dio.get(
              proxiedUrl,
              queryParameters: queryParameters,
              options: finalOptions,
            );
          } catch (_) {
            // Continue to next proxy
          }
        }
      }
      rethrow;
    }
  }

  /// Common CORS proxy services (use with caution in production)
  static const List<String> defaultCorsProxies = [
    'https://corsproxy.io/?',
    'https://cors.bridged.cc/',
    'https://api.allorigins.win/raw?url=',
  ];

  /// Get with automatic CORS proxy handling using CorsProxyService
  Future<Response> getWithSmartProxy(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final corsProxy = CorsProxyService.instance;
    final proxiedUrl = corsProxy.getProxiedUrl(url);

    try {
      return await _dio.get(
        proxiedUrl,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException {
      // If using web and first proxy fails, try fallbacks
      if (corsProxy.shouldUseProxy) {
        final retryStrategy = corsProxy.generateRetryStrategy(url);
        while (retryStrategy.hasMoreRetries) {
          try {
            final nextUrl = retryStrategy.getNextUrl();
            return await _dio.get(
              nextUrl,
              queryParameters: queryParameters,
              options: options,
            );
          } catch (_) {
            // Continue to next retry
          }
        }
      }
      rethrow;
    }
  }

  void dispose() {
    _dio.close();
  }
}
