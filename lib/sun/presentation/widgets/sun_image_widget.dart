import 'package:flutter/material.dart';
import 'package:aurora_forecast/core/constants/k_sizes.dart';

class SunImageWidget extends StatelessWidget {
  final String imageUrl;
  final String label;

  const SunImageWidget({
    super.key,
    required this.imageUrl,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(KSizes.radiusDefault),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value:
                        progress.expectedTotalBytes != null
                            ? progress.cumulativeBytesLoaded /
                                (progress.expectedTotalBytes ?? 1)
                            : null,
                  ),
                );
              },
              errorBuilder:
                  (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.white24,
                      size: KSizes.iconL,
                    ),
                  ),
            ),
          ),
        ),
        const SizedBox(height: KSizes.margin2x),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: KSizes.fontWeightBold,
            fontSize: KSizes.fontSizeM,
          ),
        ),
      ],
    );
  }
}
