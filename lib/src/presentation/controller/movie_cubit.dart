import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/domain/usecases/get_popular_movies.dart';

import '../../domain/entity/movie.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.popularMoviesUseCase) : super(MovieInitial());


  final GetPopularMoviesUseCase popularMoviesUseCase;

  int page = 1;

  void loadMovies() {
    if (state is MovieLoading) return;

    final currentState = state;

    var oldMovie = <Movie>[];

    if (currentState is MovieLoaded) {
      oldMovie = currentState.movie;
    }

    emit(MovieLoading(oldMovie, isFirstFetch: page == 1));

    popularMoviesUseCase(PopularMovieParameters(page)).then((newMovie)  {
      page++;
      final movie = (state as MovieLoading).oldMovie;
      newMovie.fold((l) => null, (r) =>  movie.addAll(r));
      emit(MovieLoaded(movie));
    });
  }





}
