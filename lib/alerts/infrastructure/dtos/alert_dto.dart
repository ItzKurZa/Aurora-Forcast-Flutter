import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/alert_model.dart';

part 'alert_dto.freezed.dart';
part 'alert_dto.g.dart';

@freezed
abstract class AlertDto with _$AlertDto {
  const factory AlertDto({
    @Default('') String id,
    @Default('') String title,
    @Default('') String message,
    @Default(false) bool isEnabled,
    @Default('aurora') String type,
    @Default('') String nasaUrl,
    String? timestamp,
    @Default('unread') String status,
  }) = _AlertDto;

  factory AlertDto.fromJson(Map<String, dynamic> json) =>
      _$AlertDtoFromJson(json);

  factory AlertDto.fromDomain(AlertModel model) => AlertDto(
    id: model.id,
    title: model.title,
    message: model.message,
    isEnabled: model.isEnabled,
    type: model.type.toString().split('.').last,
    nasaUrl: model.nasaUrl,
    timestamp: model.timestamp?.toIso8601String(),
    status: model.status.toString().split('.').last,
  );
}

extension AlertDtoX on AlertDto {
  AlertModel toDomain() => AlertModel(
    id: id,
    title: title,
    message: message,
    isEnabled: isEnabled,
    type: _parseAlertType(type),
    nasaUrl: nasaUrl,
    timestamp: timestamp != null ? DateTime.tryParse(timestamp!) : null,
    status: _parseNotificationStatus(status),
  );

  AlertType _parseAlertType(String type) {
    switch (type) {
      case 'aurora':
        return AlertType.aurora;
      case 'solar':
        return AlertType.solar;
      case 'geomagnetic':
        return AlertType.geomagnetic;
      default:
        return AlertType.aurora;
    }
  }

  NotificationStatus _parseNotificationStatus(String status) {
    switch (status) {
      case 'read':
        return NotificationStatus.read;
      case 'unread':
        return NotificationStatus.unread;
      default:
        return NotificationStatus.unread;
    }
  }
}
