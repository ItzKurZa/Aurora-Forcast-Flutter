import 'package:flutter/material.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';
import '../../domain/sun_model.dart';

class SunImageViewerWidget extends StatefulWidget {
  final List<SunModel> images;
  final int initialIndex;

  const SunImageViewerWidget({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<SunImageViewerWidget> createState() => _SunImageViewerWidgetState();
}

class _SunImageViewerWidgetState extends State<SunImageViewerWidget> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 10),
          PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.white,
                size: KSizes.iconL,
              ),
              title: const Text(
                'Sun',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: KSizes.fontSizeXL,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.images.length,
                    onPageChanged: (index) =>
                        setState(() => _currentIndex = index),
                    itemBuilder: (context, index) {
                      final image = widget.images[index];
                      return InteractiveViewer(
                        minScale: 1,
                        maxScale: 5,
                        child: Center(
                          child: Image.network(
                            image.imageUrl,
                            fit: BoxFit.contain,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.broken_image,
                                  color: Colors.white24,
                                  size: KSizes.iconXXL,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.images[_currentIndex].label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: KSizes.fontSizeL,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildDots(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.images.length, (index) {
        final isActive = index == _currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 12 : 8,
          height: isActive ? 12 : 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white38,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
