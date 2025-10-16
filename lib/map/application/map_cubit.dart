import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/i_map_service.dart';
import '../domain/map_layer_model.dart';
import '../infrastructure/map_service.dart';
import 'map_state.dart';

/// Cubit for managing map feature state
class MapCubit extends Cubit<MapState> {
  final IMapService _service;

  MapCubit({IMapService? service})
    : _service = service ?? MapService(),
      super(MapState.initial());

  /// Initialize the map feature
  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      final result = await _service.getAvailableLayers();
      if (result.isSuccess) {
        final layers = result.success;
        emit(state.copyWith(availableLayers: layers, isLoading: false));
      } else {
        final error = result.failure;
        emit(
          state.copyWith(
            isLoading: false,
            hasError: true,
            errorMessage: 'Failed to load map layers: ${error.toString()}',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: 'Unexpected error: ${e.toString()}',
        ),
      );
    }
  }

  /// Change the selected map layer
  void selectLayer(MapLayerType layerType) {
    emit(state.copyWith(selectedLayerType: layerType));
  }

  /// Set API key and validate it
  Future<void> setApiKey(String apiKey) async {
    if (apiKey.isEmpty) {
      emit(state.copyWith(apiKey: '', isApiKeyValid: false));
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      final result = await _service.validateApiKey(apiKey);
      if (result.isSuccess) {
        final isValid = result.success;
        emit(
          state.copyWith(
            apiKey: apiKey,
            isApiKeyValid: isValid,
            isLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            apiKey: apiKey,
            isApiKeyValid: false,
            isLoading: false,
            hasError: true,
            errorMessage: 'Invalid API key',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          apiKey: apiKey,
          isApiKeyValid: false,
          isLoading: false,
          hasError: true,
          errorMessage: 'Failed to validate API key',
        ),
      );
    }
  }

  /// Get tile URL for the current layer
  String getTileUrl({required int zoom, required int x, required int y}) {
    return _service.getTileUrl(
      layerType: state.selectedLayerType,
      zoom: zoom,
      x: x,
      y: y,
      apiKey: state.apiKey.isNotEmpty ? state.apiKey : null,
    );
  }

  /// Retry loading layers
  Future<void> retry() async {
    await initialize();
  }
}
