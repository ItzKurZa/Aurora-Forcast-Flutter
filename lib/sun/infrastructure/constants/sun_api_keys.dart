/// API keys and endpoints for Sun feature
abstract class SunApiKeys {
  static const baseUrl = 'https://sdo.gsfc.nasa.gov/assets/img/latest';
  static String imageUrl(int wavelength) =>
      '$baseUrl/latest_1024_${wavelength.toString().padLeft(4, '0')}.jpg';
  static const List<int> wavelengths = [
    94,
    131,
    171,
    193,
    211,
    304,
    335,
    1600,
    1700,
    4500,
  ];
}
