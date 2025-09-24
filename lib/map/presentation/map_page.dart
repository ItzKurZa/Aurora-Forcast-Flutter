import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import '../application/map_cubit.dart';
import '../application/map_state.dart';
import 'widgets/map_widget.dart';
import 'widgets/map_layer_selector_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit()..initialize(),
      child: const MapView(),
    );
  }
}

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 0, right: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: KSizes.margin4x * 1.5),
                const Text(
                  'Weather Map',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: KSizes.fontWeightBold,
                    fontSize: KSizes.fontSizeXXL,
                  ),
                ),
                const Spacer(),
                SizedBox(width: KSizes.margin2x),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepPurple),
            );
          }

          if (state.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red.shade400,
                    size: KSizes.iconXXL,
                  ),
                  SizedBox(height: KSizes.margin4x),
                  Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: KSizes.fontSizeM,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: KSizes.margin4x),
                  ElevatedButton(
                    onPressed: () => context.read<MapCubit>().retry(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      minimumSize: Size(0, KSizes.buttonHeight),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return Stack(
            children: [
              const MapWidget(),
              Positioned(
                top: KSizes.margin4x,
                left: KSizes.margin4x,
                right: KSizes.margin4x,
                child: const MapLayerSelectorWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}
