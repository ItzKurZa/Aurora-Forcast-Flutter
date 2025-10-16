import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'map_api_client.g.dart';

/// Retrofit API client for OpenWeather Map services
@RestApi()
abstract class MapApiClient {
  factory MapApiClient(Dio dio, {String baseUrl}) = _MapApiClient;

  /// Validate API key by making a simple weather request
  @GET('/weather')
  Future<dynamic> validateApiKey(
    @Query('q') String city,
    @Query('appid') String apiKey,
  );
}
