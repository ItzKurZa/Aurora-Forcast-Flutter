/// API keys and endpoints for Alerts feature
abstract class AlertApiKeys {
  static const baseUrl = 'https://api.example.com';
  static const alertsEndpoint = '/alerts';
  static const settingsEndpoint = '/settings/alerts';

  // Endpoints
  static String getAlerts() => alertsEndpoint;
  static String updateAlert(String id) => '$alertsEndpoint/$id';
  static String getAlertSettings() => settingsEndpoint;
  static String updateAlertSettings() => settingsEndpoint;
}
