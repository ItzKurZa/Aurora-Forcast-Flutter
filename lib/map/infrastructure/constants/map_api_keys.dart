/// API constants for OpenWeather Map integration
abstract class MapApiKeys {
  static const String baseUrl = 'https://tile.openweathermap.org';
  static const String apiUrl = 'https://api.openweathermap.org/data/2.5';

  // Default API key - users should replace this with their own
  static const String defaultApiKey = '85e04ce3529da7a42886b10254dfee24';

  // Map layer endpoints
  static const String temperatureLayer = 'temp_new';
  static const String cloudsLayer = 'clouds_new';

  // Tile URL template
  /// Generates tile URL for OpenWeather maps
  /// Format: https://tile.openweathermap.org/map/{layer}/{z}/{x}/{y}.png?appid={API_key}
  static String getTileUrl({
    required String layer,
    required int zoom,
    required int x,
    required int y,
    required String apiKey,
  }) {
    return '$baseUrl/map/$layer/$zoom/$x/$y.png?appid=$apiKey';
  }

  /// Base tile URL for normal map (no weather overlay)
  static String getNormalTileUrl({
    required int zoom,
    required int x,
    required int y,
  }) {
    // Using OpenStreetMap tiles for normal view
    return 'https://tile.openstreetmap.org/$zoom/$x/$y.png';
  }

  /// Weather API endpoint for validation
  static String getWeatherApiUrl() => '$apiUrl/weather';
}
