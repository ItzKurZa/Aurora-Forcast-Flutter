import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import '../application/sun_cubit.dart';
import '../application/sun_state.dart';
import 'widgets/sun_image_widget.dart';
import 'widgets/sun_image_viewer_widget.dart';

class SunPage extends StatelessWidget {
  const SunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SunCubit()..initialize(),
      child: const SunView(),
    );
  }
}

class SunView extends StatelessWidget {
  const SunView({super.key});

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
                const SizedBox(width: 24),
                const Text(
                  'Sun',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.margin4x),
        child: BlocBuilder<SunCubit, SunState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Failed to load sun images.',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: KSizes.margin4x),
                    ElevatedButton(
                      onPressed: () => context.read<SunCubit>().initialize(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: KSizes.margin4x,
                mainAxisSpacing: KSizes.margin4x,
                childAspectRatio: 1,
              ),
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                final image = state.images[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => SunImageViewerWidget(
                              images: state.images,
                              initialIndex: index,
                            ),
                      ),
                    );
                  },
                  child: SunImageWidget(
                    imageUrl: image.imageUrl,
                    label: image.label,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
