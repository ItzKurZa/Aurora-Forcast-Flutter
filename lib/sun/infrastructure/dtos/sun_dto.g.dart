// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SunDto _$SunDtoFromJson(Map<String, dynamic> json) => _SunDto(
  label: json['label'] as String,
  imageUrl: json['imageUrl'] as String,
  wavelength: (json['wavelength'] as num).toInt(),
);

Map<String, dynamic> _$SunDtoToJson(_SunDto instance) => <String, dynamic>{
  'label': instance.label,
  'imageUrl': instance.imageUrl,
  'wavelength': instance.wavelength,
};
