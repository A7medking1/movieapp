import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/app_constance.dart';

import '../../../../../core/utils/api_constance.dart';
import '../../../../domain/entity/movie.dart';
import '../../../controller/movie_detail_bloc/movie_detail_bloc.dart';
import '../../../widget/cached_image_widget.dart';
import '../movie_detail_screen.dart';

class SimilarMovie extends StatelessWidget {
  const SimilarMovie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return MovieCardGridView(movie: state.movieDetail!.similar);
      },
    );
  }
}

class MovieCardGridView extends StatelessWidget {
  final List<Movie> movie;

  const MovieCardGridView({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return InkWell(
              onTap: () => navigateTo(
                  context: context,
                  page: MovieDetailScreen(
                      id: movie[index].id, hero: UniqueKey())),
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      CachedImages(
                        imageUrl: movie[index].backdropPath != null
                            ? ApiConstance.imageUrl(movie[index].backdropPath!)
                            : AppConstance.errorImage,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsetsDirectional.all(2),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(20))),
                        child: Center(
                          child: Text(
                            (movie[index].voteAverage / 2).toStringAsFixed(1),
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: movie.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
