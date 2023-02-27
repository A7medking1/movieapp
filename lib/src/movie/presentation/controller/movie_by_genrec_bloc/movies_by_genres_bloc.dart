import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';

import '../../../domain/entity/movie.dart';
import '../../../domain/usecases/get_movie_by_genres.dart';



part 'movies_by_genres_event.dart';

part 'movies_by_genres_state.dart';

class MoviesByGenresBloc
    extends Bloc<MoviesByGenresEvent, MoviesByGenresState> {
  int page = 1;
  bool isLoading = false;

  MoviesByGenresBloc(this.genresUseCase) : super(const MoviesByGenresState()) {
    on<GetMoviesByGenresEvent>(_getMoviesByGenres);
  }

  final GetMoviesByGenresUseCase genresUseCase;

  FutureOr<void> _getMoviesByGenres(
      GetMoviesByGenresEvent event, Emitter<MoviesByGenresState> emit) async {
    List<Movie> movie = [];

    final result = await genresUseCase(
        MovieByGenresParameters(genresId: event.genresId, page: page));

    result.fold(
        (l) => emit(
              state.copyWith(
                message: l.message,
                requestState: RequestState.error,
              ),
            ), (r) {
      movie = r;
    });
    emit(state.copyWith(movie: state.movie + movie,requestState: RequestState.loaded));
    isLoading = false;

  }
}
