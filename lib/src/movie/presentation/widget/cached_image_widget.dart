import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'custom_icon.dart';

class CachedImages extends StatelessWidget {
  final double? width;
  final BoxFit? fit;
  final String imageUrl;
  final double? height;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Widget Function(BuildContext, String)? placeholder;

  const CachedImages({
    Key? key,
    this.width,
    this.placeholder,
    this.fit,
    this.height,
    this.imageBuilder,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 125.0,
      height: height,
      fit: fit,
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      placeholder: placeholder ?? (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: 170.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const CustomIcon(icon: Icons.error),
    );
  }
}
