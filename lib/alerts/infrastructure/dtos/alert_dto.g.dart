// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertDto _$AlertDtoFromJson(Map<String, dynamic> json) => _AlertDto(
  id: json['id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  message: json['message'] as String? ?? '',
  isEnabled: json['isEnabled'] as bool? ?? false,
  type: json['type'] as String? ?? 'aurora',
  nasaUrl: json['nasaUrl'] as String? ?? '',
  timestamp: json['timestamp'] as String?,
  status: json['status'] as String? ?? 'unread',
);

Map<String, dynamic> _$AlertDtoToJson(_AlertDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'message': instance.message,
  'isEnabled': instance.isEnabled,
  'type': instance.type,
  'nasaUrl': instance.nasaUrl,
  'timestamp': instance.timestamp,
  'status': instance.status,
};
