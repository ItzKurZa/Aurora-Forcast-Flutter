import 'package:result_type/result_type.dart';
import '../domain/i_alert_service.dart';
import '../domain/alert_model.dart';
import 'dtos/alert_dto.dart';

/// Service to provide alert functionality
class AlertService implements IAlertService {
  AlertService();

  @override
  Future<Result<List<AlertModel>, AlertError>> getAlerts() async {
    try {
      // Mock implementation with sample NASA notifications
      // In real app, would use Retrofit API client

      final mockResponse = [
        {
          'id': '1',
          'title': 'High Aurora Activity Expected',
          'message':
              'G2 Geomagnetic Storm Watch issued for Sept 3-4, 2025. Aurora may be visible at mid-latitudes.',
          'is_enabled': true,
          'type': 'aurora',
          'nasa_url':
              'https://www.swpc.noaa.gov/news/g2-moderate-geomagnetic-storm-watch-issued',
          'timestamp': DateTime.now()
              .subtract(const Duration(hours: 2))
              .toIso8601String(),
          'status': 'unread',
        },
        {
          'id': '2',
          'title': 'Solar Flare Detected',
          'message':
              'X1.2 Solar Flare observed. Minor radio communication blackouts expected.',
          'is_enabled': true,
          'type': 'solar',
          'nasa_url': 'https://www.swpc.noaa.gov/news/x12-solar-flare-observed',
          'timestamp': DateTime.now()
              .subtract(const Duration(hours: 6))
              .toIso8601String(),
          'status': 'read',
        },
        {
          'id': '3',
          'title': 'Coronal Mass Ejection',
          'message':
              'CME launched from Sun. Earth impact expected in 2-3 days.',
          'is_enabled': true,
          'type': 'solar',
          'nasa_url':
              'https://www.swpc.noaa.gov/news/coronal-mass-ejection-analysis',
          'timestamp': DateTime.now()
              .subtract(const Duration(days: 1))
              .toIso8601String(),
          'status': 'read',
        },
        {
          'id': '4',
          'title': 'Geomagnetic Storm in Progress',
          'message':
              'G1 Minor Geomagnetic Storm conditions observed. Aurora possible at high latitudes.',
          'is_enabled': true,
          'type': 'geomagnetic',
          'nasa_url':
              'https://www.swpc.noaa.gov/news/g1-minor-geomagnetic-storm-conditions',
          'timestamp': DateTime.now()
              .subtract(const Duration(days: 2))
              .toIso8601String(),
          'status': 'read',
        },
        {
          'id': '5',
          'title': 'Aurora Forecast Update',
          'message':
              'Northern Lights visibility forecast updated for this week.',
          'is_enabled': false,
          'type': 'aurora',
          'nasa_url':
              'https://www.swpc.noaa.gov/products/aurora-30-minute-forecast',
          'timestamp': DateTime.now()
              .subtract(const Duration(days: 3))
              .toIso8601String(),
          'status': 'read',
        },
      ];

      final dtos = mockResponse.map((json) => AlertDto.fromJson(json)).toList();
      final models = dtos.map((dto) => dto.toDomain()).toList();

      return Success(models);
    } catch (_) {
      return Failure(AlertError.unknown);
    }
  }

  @override
  Future<Result<AlertModel, AlertError>> updateAlert(AlertModel alert) async {
    try {
      // Mock implementation since this is a demo
      // In real app, would use Retrofit API client to update alert

      return Success(alert);
    } catch (_) {
      return Failure(AlertError.storage);
    }
  }

  @override
  Future<Result<bool, AlertError>> toggleGlobalAlerts(bool enabled) async {
    try {
      // Mock implementation since this is a demo
      // In real app, would use Retrofit API client

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      return Success(enabled);
    } catch (_) {
      return Failure(AlertError.storage);
    }
  }

  @override
  Future<Result<bool, AlertError>> getGlobalAlertsEnabled() async {
    try {
      // Mock implementation since this is a demo
      // In real app, would use Retrofit API client

      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 300));

      return Success(false);
    } catch (_) {
      return Failure(AlertError.storage);
    }
  }
}
