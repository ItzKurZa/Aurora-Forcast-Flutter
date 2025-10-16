// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_layer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapLayerDto _$MapLayerDtoFromJson(Map<String, dynamic> json) => _MapLayerDto(
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  layerCode: json['layerCode'] as String? ?? '',
  isEnabled: json['isEnabled'] as bool? ?? true,
);

Map<String, dynamic> _$MapLayerDtoToJson(_MapLayerDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'layerCode': instance.layerCode,
      'isEnabled': instance.isEnabled,
    };
