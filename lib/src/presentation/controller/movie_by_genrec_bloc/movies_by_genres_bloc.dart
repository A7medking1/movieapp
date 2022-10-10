import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/domain/usecases/get_movie_by_genres.dart';

import '../../../domain/entity/movie.dart';

part 'movies_by_genres_event.dart';

part 'movies_by_genres_state.dart';

class MoviesByGenresBloc
    extends Bloc<MoviesByGenresEvent, MoviesByGenresState> {
  MoviesByGenresBloc(this.genresUseCase) : super(const MoviesByGenresState()) {
    on<GetMoviesByGenresEvent>(_getMoviesByGenres);
  }

  final GetMoviesByGenresUseCase genresUseCase;

  FutureOr<void> _getMoviesByGenres(
      GetMoviesByGenresEvent event, Emitter<MoviesByGenresState> emit) async {
    final result = await genresUseCase(MovieByGenresParameters(event.genresId));

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          requestState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movie: r,
          requestState: RequestState.loaded,
        ),
      ),
    );
  }
}
