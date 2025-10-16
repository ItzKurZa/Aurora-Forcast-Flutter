import 'package:aurora_forecast/map/domain/map_layer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../application/map_cubit.dart';
import '../../application/map_state.dart';
import '../../infrastructure/constants/map_api_keys.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final MapController _mapController = MapController();

  // Default to Aurora viewing locations (northern latitudes)
  static const LatLng _initialCenter = LatLng(
    16.0545,
    108.0717,
  ); // Fairbanks, Alaska
  static const double _initialZoom = 4.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _initialCenter,
            initialZoom: _initialZoom,
            minZoom: 2.0,
            maxZoom: 6.0,
            // Set world bounds to prevent scrolling to empty areas
            cameraConstraint: CameraConstraint.contain(
              bounds: LatLngBounds(
                const LatLng(-85.0511, -180.0), // Southwest corner
                const LatLng(85.0511, 180.0), // Northeast corner
              ),
            ),
          ),
          children: [
            // Base map layer (always present for temperature and clouds)
            if (state.selectedLayerType != MapLayerType.normal)
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.aurora_forecast',
                maxZoom: 6,
              ),

            // Weather overlay layer or normal map
            _buildTileLayer(context, state),

            // Aurora viewing locations markers (optional enhancement)
            const MarkerLayer(
              markers: [
                // Add aurora viewing location markers here if needed
              ],
            ),

            // Map controls
            RichAttributionWidget(
              attributions: [
                const TextSourceAttribution('OpenStreetMap contributors'),
                if (state.selectedLayerType != MapLayerType.normal)
                  const TextSourceAttribution('Weather data by OpenWeather'),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildTileLayer(BuildContext context, MapState state) {
    final cubit = context.read<MapCubit>();

    return TileLayer(
      urlTemplate: _getTileUrlTemplate(state, cubit),
      userAgentPackageName: 'com.example.aurora_forecast',
      maxZoom: 6,
    );
  }

  String _getTileUrlTemplate(MapState state, MapCubit cubit) {
    // For normal layer, use OpenStreetMap
    if (state.selectedLayerType == MapLayerType.normal) {
      return 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
    }

    // For weather layers, we need to create a template that flutter_map can use
    // Since flutter_map expects a template URL, we'll construct it based on the layer type
    final layerCode = _getLayerCode(state.selectedLayerType);
    final apiKey = state.apiKey.isNotEmpty
        ? state.apiKey
        : MapApiKeys.defaultApiKey;

    return 'https://tile.openweathermap.org/map/$layerCode/{z}/{x}/{y}.png?appid=$apiKey';
  }

  String _getLayerCode(MapLayerType layerType) {
    switch (layerType) {
      case MapLayerType.temperature:
        return 'temp_new';
      case MapLayerType.clouds:
        return 'clouds_new';
      case MapLayerType.normal:
        return '';
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
