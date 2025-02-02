import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoadingService extends StatelessWidget {
  final String mainImage;
  final double radius;
  final BoxFit fit;
  final Widget? fallbackWidget;

  const ImageLoadingService({
    super.key,
    required this.mainImage,
    this.radius = 0,
    this.fit = BoxFit.fill,
    this.fallbackWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        errorWidget: (context, url, error) =>
            fallbackWidget ??
            const Center(
              child: Icon(Icons.error, size: 40, color: Colors.red),
            ),
        imageUrl: mainImage,
        fit: fit,
      ),
    );
  }
}
