import 'package:result_type/result_type.dart';
import 'alert_model.dart';

/// Error types for AlertService
enum AlertError implements Exception { network, validation, storage, unknown }

/// Contract for AlertService
abstract class IAlertService {
  /// Fetches all alert configurations.
  ///
  /// Returns [Result.failure] with [AlertError.network] if network fails.
  Future<Result<List<AlertModel>, AlertError>> getAlerts();

  /// Updates an alert configuration.
  ///
  /// Returns [Result.failure] with [AlertError.validation] if validation fails.
  Future<Result<AlertModel, AlertError>> updateAlert(AlertModel alert);

  /// Toggles global alerts setting.
  ///
  /// Returns [Result.failure] with [AlertError.storage] if storage fails.
  Future<Result<bool, AlertError>> toggleGlobalAlerts(bool enabled);

  /// Gets current global alerts setting.
  ///
  /// Returns [Result.failure] with [AlertError.storage] if storage fails.
  Future<Result<bool, AlertError>> getGlobalAlertsEnabled();
}
