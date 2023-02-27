import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/app_constance.dart';

import '../../../../../core/utils/api_constance.dart';
import '../../../controller/movie_detail_bloc/movie_detail_bloc.dart';
import '../../../widget/cached_image_widget.dart';
import '../movie_detail_screen.dart';

class RecommendationComponent extends StatelessWidget {
  const RecommendationComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) => previous.recommendation != current.recommendation,
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final recommendation = state.recommendation[index];
                return InkWell(
                  onTap: () => navigateTo(
                      context: context,
                      page: MovieDetailScreen(id: recommendation.id)),
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                      child: CachedImages(
                        imageUrl: recommendation.backdropPath != null
                            ? ApiConstance.imageUrl(
                                recommendation.backdropPath!)
                            : AppConstance.errorImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              childCount: state.recommendation.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          ),
        );
      },
    );
  }
}
