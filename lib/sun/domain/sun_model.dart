import 'package:freezed_annotation/freezed_annotation.dart';

part 'sun_model.freezed.dart';

@freezed
abstract class SunModel with _$SunModel {
  const factory SunModel({
    @Default('') String label,
    @Default('') String imageUrl,
    @Default(0) int wavelength,
  }) = _SunModel;
}
