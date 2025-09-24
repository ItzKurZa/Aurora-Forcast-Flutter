import 'package:dio/dio.dart';
import 'package:result_type/result_type.dart';
import '../domain/i_map_service.dart';
import '../domain/map_layer_model.dart';
import 'constants/map_api_keys.dart';
import 'api/map_api_client.dart';
import '../../core/services/base_http_service.dart';

/// Implementation of map service using OpenWeather API
class MapService extends BaseHttpService implements IMapService {
  final MapApiClient _apiClient;

  MapService({Dio? dio})
    : _apiClient = MapApiClient(
        dio ?? BaseHttpService(baseUrl: MapApiKeys.apiUrl).dio,
        baseUrl: MapApiKeys.apiUrl,
      ),
      super(baseUrl: MapApiKeys.apiUrl);

  @override
  Future<Result<List<MapLayerModel>, MapError>> getAvailableLayers() async {
    try {
      // Return predefined layers since OpenWeather doesn't have a layers API
      final layers = [
        MapLayerModel.normal(),
        MapLayerModel.temperature(),
        MapLayerModel.clouds(),
      ];
      return Success(layers);
    } catch (e) {
      return Failure(MapError.unknown);
    }
  }

  @override
  String getTileUrl({
    required MapLayerType layerType,
    required int zoom,
    required int x,
    required int y,
    String? apiKey,
  }) {
    final key = apiKey ?? MapApiKeys.defaultApiKey;

    switch (layerType) {
      case MapLayerType.normal:
        return MapApiKeys.getNormalTileUrl(zoom: zoom, x: x, y: y);
      case MapLayerType.temperature:
        return MapApiKeys.getTileUrl(
          layer: MapApiKeys.temperatureLayer,
          zoom: zoom,
          x: x,
          y: y,
          apiKey: key,
        );
      case MapLayerType.clouds:
        return MapApiKeys.getTileUrl(
          layer: MapApiKeys.cloudsLayer,
          zoom: zoom,
          x: x,
          y: y,
          apiKey: key,
        );
    }
  }

  @override
  Future<Result<bool, MapError>> validateApiKey(String apiKey) async {
    try {
      // Test API key with a simple weather request
      await _apiClient.validateApiKey('London', apiKey);
      return Success(true);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return Failure(MapError.invalidApiKey);
      }
      return Failure(MapError.networkError);
    } catch (e) {
      return Failure(MapError.unknown);
    }
  }
}
