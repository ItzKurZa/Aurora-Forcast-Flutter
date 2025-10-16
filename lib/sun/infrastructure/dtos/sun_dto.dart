import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/sun_model.dart';

part 'sun_dto.freezed.dart';
part 'sun_dto.g.dart';

@freezed
abstract class SunDto with _$SunDto {
  const factory SunDto({
    required String label,
    required String imageUrl,
    required int wavelength,
  }) = _SunDto;

  factory SunDto.fromJson(Map<String, dynamic> json) => _$SunDtoFromJson(json);

  factory SunDto.fromDomain(SunModel model) => SunDto(
    label: model.label,
    imageUrl: model.imageUrl,
    wavelength: model.wavelength,
  );
}

extension SunDtoX on SunDto {
  SunModel toDomain() =>
      SunModel(label: label, imageUrl: imageUrl, wavelength: wavelength);
}
