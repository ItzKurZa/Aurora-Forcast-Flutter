import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_layer_model.freezed.dart';

/// Represents different types of weather map layers
enum MapLayerType { normal, temperature, clouds }

/// Model for map layer information
@freezed
abstract class MapLayerModel with _$MapLayerModel {
  const factory MapLayerModel({
    @Default(MapLayerType.normal) MapLayerType type,
    @Default('') String name,
    @Default('') String description,
    @Default('') String layerCode,
    @Default(true) bool isEnabled,
  }) = _MapLayerModel;

  factory MapLayerModel.normal() => const MapLayerModel(
    type: MapLayerType.normal,
    name: 'Normal',
    description: 'Standard weather map view',
    layerCode: '',
    isEnabled: true,
  );

  factory MapLayerModel.temperature() => const MapLayerModel(
    type: MapLayerType.temperature,
    name: 'Temperature',
    description: 'Temperature overlay map',
    layerCode: 'temp_new',
    isEnabled: true,
  );

  factory MapLayerModel.clouds() => const MapLayerModel(
    type: MapLayerType.clouds,
    name: 'Clouds',
    description: 'Cloud coverage overlay map',
    layerCode: 'clouds_new',
    isEnabled: true,
  );
}
