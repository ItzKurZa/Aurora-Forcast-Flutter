import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/alert_model.dart';

part 'alert_state.freezed.dart';

@freezed
abstract class AlertState with _$AlertState {
  const AlertState._();

  const factory AlertState({
    @Default([]) List<AlertModel> alerts,
    @Default(false) bool isAlertsLoading,
    @Default(false) bool hasAlertsError,
    @Default(false) bool globalAlertsEnabled,
    @Default(false) bool isGlobalAlertsLoading,
    @Default(false) bool hasGlobalAlertsError,
  }) = _AlertState;

  factory AlertState.initial() => const AlertState();

  // Convenience getters
  bool get hasAnyError => hasAlertsError || hasGlobalAlertsError;
  bool get isAnyLoading => isAlertsLoading || isGlobalAlertsLoading;
}
