import 'package:flutter/material.dart';

import '../../../core/utils/app_constance.dart';
import '../../domain/entity/movie.dart';
import 'cached_image_widget.dart';
import 'custom_icon.dart';
import 'custom_text.dart';

class MovieDataCard extends StatelessWidget
{
  final Movie movie;
  const MovieDataCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.grey.shade900,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          SizedBox(
            height: 120,
            child: CachedImages(
              imageUrl: movie.backdropPath != null
                  ? "https://image.tmdb.org/t/p/w500${movie.backdropPath}"
                  : AppConstance.errorImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children:
                    [
                      Expanded(
                        child: CustomText(
                          text: movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: CustomText(
                          text: movie.releaseDate!.split('-')[0],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Row(
                        children: [
                          const CustomIcon(
                            icon: Icons.star,
                            color: Colors.amber,
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          CustomText(
                            text: (movie.voteAverage).toStringAsFixed(1),
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      text: movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[500]))
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
