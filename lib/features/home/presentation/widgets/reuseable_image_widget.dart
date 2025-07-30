import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class ReusableImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BorderRadius? borderRadius;

  const ReusableImageWidget({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
          placeholder: (ctx, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(color: Colors.grey),
          ),
          errorWidget: (ctx, url, error) => Container(
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
