import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_model.freezed.dart';

@freezed
abstract class AlertModel with _$AlertModel {
  const factory AlertModel({
    @Default('') String id,
    @Default('') String title,
    @Default('') String message,
    @Default(false) bool isEnabled,
    @Default(AlertType.aurora) AlertType type,
    @Default('') String nasaUrl,
    DateTime? timestamp,
    @Default(NotificationStatus.unread) NotificationStatus status,
  }) = _AlertModel;
}

enum AlertType { aurora, solar, geomagnetic }

enum NotificationStatus { unread, read }
