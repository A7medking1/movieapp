import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';

import '../../../domain/entity/movie_detail.dart';
import '../../../domain/usecases/get_movie_detail.dart';



part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(
    this.getMovieDetailUseCase,

  ) : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetailEvent);

  }

  final GetMovieDetailUseCase getMovieDetailUseCase;

  FutureOr<void> _getMovieDetailEvent(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final result = await getMovieDetailUseCase(MovieDetailParameter(event.id));

    result.fold(
      (l) => emit(
        state.copWith(
          movieDetailRequestState: RequestState.error,
          movieDetailMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copWith(
          movieDetailRequestState: RequestState.loaded,
          movieDetail: r,
        ),
      ),
    );
  }
}
