import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/i_alert_service.dart';
import '../domain/alert_model.dart';
import '../infrastructure/alert_service.dart';
import 'alert_state.dart';

class AlertCubit extends Cubit<AlertState> {
  final IAlertService _service;

  AlertCubit({IAlertService? service})
    : _service = service ?? AlertService(),
      super(AlertState.initial());

  Future<void> initialize() async {
    await Future.wait([loadAlerts(), loadGlobalAlertsEnabled()]);
  }

  Future<void> loadAlerts() async {
    emit(state.copyWith(isAlertsLoading: true, hasAlertsError: false));
    final result = await _service.getAlerts();
    if (result.isSuccess) {
      emit(state.copyWith(alerts: result.success, isAlertsLoading: false));
    } else {
      emit(state.copyWith(isAlertsLoading: false, hasAlertsError: true));
    }
  }

  Future<void> loadGlobalAlertsEnabled() async {
    emit(
      state.copyWith(isGlobalAlertsLoading: true, hasGlobalAlertsError: false),
    );
    final result = await _service.getGlobalAlertsEnabled();
    if (result.isSuccess) {
      emit(
        state.copyWith(
          globalAlertsEnabled: result.success,
          isGlobalAlertsLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isGlobalAlertsLoading: false,
          hasGlobalAlertsError: true,
        ),
      );
    }
  }

  Future<void> toggleGlobalAlerts(bool enabled) async {
    emit(
      state.copyWith(isGlobalAlertsLoading: true, hasGlobalAlertsError: false),
    );
    final result = await _service.toggleGlobalAlerts(enabled);
    if (result.isSuccess) {
      emit(
        state.copyWith(
          globalAlertsEnabled: result.success,
          isGlobalAlertsLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isGlobalAlertsLoading: false,
          hasGlobalAlertsError: true,
        ),
      );
    }
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    final updatedAlerts = state.alerts.map((alert) {
      if (alert.id == notificationId) {
        return alert.copyWith(status: NotificationStatus.read);
      }
      return alert;
    }).toList();

    emit(state.copyWith(alerts: updatedAlerts));
  }
}
