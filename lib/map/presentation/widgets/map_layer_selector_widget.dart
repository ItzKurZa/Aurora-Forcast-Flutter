import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import '../../application/map_cubit.dart';
import '../../application/map_state.dart';
import '../../domain/map_layer_model.dart';

class MapLayerSelectorWidget extends StatelessWidget {
  const MapLayerSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state.availableLayers.isEmpty) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: EdgeInsets.all(KSizes.margin2x),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(KSizes.radiusDefault),
            border: Border.all(
              color: Colors.deepPurple.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: state.availableLayers.map((layer) {
              final isSelected = state.selectedLayerType == layer.type;

              return Padding(
                padding: EdgeInsets.only(right: KSizes.margin1x),
                child: _buildLayerButton(context, layer, isSelected),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildLayerButton(
    BuildContext context,
    MapLayerModel layer,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () => context.read<MapCubit>().selectLayer(layer.type),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: KSizes.margin2x,
          vertical: KSizes.margin1x,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.deepPurple.withValues(alpha: 0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(KSizes.radiusDefault / 2),
          border: Border.all(
            color: isSelected
                ? Colors.deepPurple
                : Colors.grey.withValues(alpha: 0.3),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getLayerIcon(layer.type),
              color: isSelected ? Colors.deepPurple : Colors.grey,
              size: KSizes.iconS,
            ),
            SizedBox(width: KSizes.margin1x),
            Text(
              layer.name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: KSizes.fontSizeS,
                fontWeight: isSelected
                    ? KSizes.fontWeightBold
                    : KSizes.fontWeightNormal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getLayerIcon(MapLayerType type) {
    switch (type) {
      case MapLayerType.normal:
        return Icons.map_outlined;
      case MapLayerType.temperature:
        return Icons.thermostat_outlined;
      case MapLayerType.clouds:
        return Icons.cloud_outlined;
    }
  }
}
