import 'package:result_type/result_type.dart';
import 'map_layer_model.dart';

/// Error types for map operations
enum MapError implements Exception {
  networkError,
  invalidApiKey,
  layerNotFound,
  unknown,
}

/// Interface for map-related operations
abstract class IMapService {
  /// Gets available map layers
  Future<Result<List<MapLayerModel>, MapError>> getAvailableLayers();

  /// Generates tile URL for the specified layer and coordinates
  String getTileUrl({
    required MapLayerType layerType,
    required int zoom,
    required int x,
    required int y,
    String? apiKey,
  });

  /// Validates if the API key is valid for OpenWeather maps
  Future<Result<bool, MapError>> validateApiKey(String apiKey);
}
