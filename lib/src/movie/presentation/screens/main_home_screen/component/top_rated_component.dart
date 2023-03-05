import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/movie/presentation/controller/movie_bloc/movies_event.dart';

import '../../../../../core/utils/api_constance.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../tv/presentation/screens/Tv_shows/Tv_shows.dart';
import '../../../../domain/entity/movie.dart';
import '../../../controller/movie_bloc/movies_bloc.dart';
import '../../../controller/movie_bloc/movies_state.dart';
import '../../../widget/cached_image_widget.dart';
import '../../../widget/loading_spankit.dart';
import '../../movie_detail_screen/movie_detail_screen.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: customLoading,
              ),
            );
          case RequestState.loaded:
            return MoviesCardListView(
              movie: state.topRatedMovies,
            );
          case RequestState.error:
           return CustomErrorWidget(
              message: state.topRatedMessage,
              onPressed: () => context.read<MoviesBloc>().add(GetTopRatedMoviesEvent()),
            );
        }
      },
    );
  }
}

class MoviesCardListView extends StatelessWidget {

  final List<Movie> movie ;


  const MoviesCardListView({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: movie.length,
          itemBuilder: (context, index) {
            //final movie = state.topRatedMovies[index];
            UniqueKey _key = UniqueKey() ;
            return Container(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () => navigateTo(
                  context: context,
                  page: MovieDetailScreen(
                    id: movie[index].id,
                      hero: _key
                  ),
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)),
                  child: Hero(
                    tag: _key,
                    child: CachedImages(
                      imageUrl:
                          ApiConstance.imageUrl(movie[index].backdropPath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
