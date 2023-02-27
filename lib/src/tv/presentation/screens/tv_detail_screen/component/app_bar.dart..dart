import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/api_constance.dart';
import '../../../../../movie/presentation/widget/cached_image_widget.dart';

class CustomAppBar extends StatelessWidget {
  final String imagePath;
  final UniqueKey hero;

  const CustomAppBar({
    Key? key,
    required this.imagePath,
    required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5, 1.0, 1.0],
              ).createShader(
                Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Hero(
              tag: hero,
              child: CachedImages(
                imageUrl: ApiConstance.imageUrl(imagePath),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
