// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertDto _$AlertDtoFromJson(Map<String, dynamic> json) => _AlertDto(
  id: json['id'] as String? ?? '',
  title: json['title'] as String? ?? '',
  message: json['message'] as String? ?? '',
  isEnabled: json['is_enabled'] as bool? ?? false,
  type: json['type'] as String? ?? 'aurora',
  nasaUrl: json['nasa_url'] as String? ?? '',
  timestamp: json['timestamp'] as String?,
  status: json['status'] as String? ?? 'unread',
);

Map<String, dynamic> _$AlertDtoToJson(_AlertDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'message': instance.message,
  'is_enabled': instance.isEnabled,
  'type': instance.type,
  'nasa_url': instance.nasaUrl,
  'timestamp': instance.timestamp,
  'status': instance.status,
};
