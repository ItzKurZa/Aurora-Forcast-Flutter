import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/sun_model.dart';

part 'sun_state.freezed.dart';

@freezed
abstract class SunState with _$SunState {
  const SunState._();

  const factory SunState({
    @Default([]) List<SunModel> images,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
  }) = _SunState;

  factory SunState.initial() => const SunState();
}
