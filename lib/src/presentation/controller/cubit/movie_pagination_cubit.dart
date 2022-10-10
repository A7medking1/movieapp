import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/domain/usecases/get_popular_movies.dart';
import 'package:movieapp/src/domain/usecases/get_top_rated_movies.dart';

import '../../../domain/entity/movie.dart';

part 'movie_pagination_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.popularMoviesUseCase, this.topRatedMoviesUseCase)
      : super(MovieInitial());

  final GetPopularMoviesUseCase popularMoviesUseCase;
  final GetTopRatedMoviesUseCase topRatedMoviesUseCase;

  int popularPage = 1;
  int topRatedPage = 1;

  void loadPopularMovies() {
    if (state is PopularMovieLoading) return;

    final currentState = state;

    var oldMovie = <Movie>[];

    if (currentState is PopularMovieLoaded) {
      oldMovie = currentState.movie;
    }

    emit(PopularMovieLoading(oldMovie, isFirstFetch: popularPage == 1));

    popularMoviesUseCase(PopularMovieParameters(popularPage)).then((newMovie) {
      popularPage++;
      final movie = (state as PopularMovieLoading).oldMovie;
      newMovie.fold((l) => null, (r) => movie.addAll(r));
      emit(PopularMovieLoaded(movie));
    });
  }

  void loadTopRatedMovies() {
    if (state is TopRatedMovieLoading) return;

    final currentState = state;

    var oldMovie = <Movie>[];

    if (currentState is TopRatedMovieLoaded) {
      oldMovie = currentState.movie;
    }

    emit(TopRatedMovieLoading(oldMovie, isFirstFetch: topRatedPage == 1));

    topRatedMoviesUseCase(TopRatedParameters(topRatedPage)).then((newMovie) {
      topRatedPage++;
      final movie = (state as TopRatedMovieLoading).oldMovie;
      newMovie.fold((l) => null, (r) => movie.addAll(r));
      emit(TopRatedMovieLoaded(movie));
    });
  }
}
