import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/map_layer_model.dart';

part 'map_layer_dto.freezed.dart';
part 'map_layer_dto.g.dart';

/// DTO for map layer data from API
@freezed
abstract class MapLayerDto with _$MapLayerDto {
  const factory MapLayerDto({
    @Default('') String name,
    @Default('') String description,
    @Default('') String layerCode,
    @Default(true) bool isEnabled,
  }) = _MapLayerDto;

  factory MapLayerDto.fromJson(Map<String, dynamic> json) =>
      _$MapLayerDtoFromJson(json);
}

extension MapLayerDtoX on MapLayerDto {
  /// Converts DTO to domain model
  MapLayerModel toDomain(MapLayerType type) {
    return MapLayerModel(
      type: type,
      name: name,
      description: description,
      layerCode: layerCode,
      isEnabled: isEnabled,
    );
  }
}
