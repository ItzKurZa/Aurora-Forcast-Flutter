import 'package:freezed_annotation/freezed_annotation.dart';
import '../domain/map_layer_model.dart';

part 'map_state.freezed.dart';

/// State for map feature
@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default([]) List<MapLayerModel> availableLayers,
    @Default(MapLayerType.normal) MapLayerType selectedLayerType,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default('') String apiKey,
    @Default(false) bool isApiKeyValid,
  }) = _MapState;

  factory MapState.initial() => const MapState();
}
