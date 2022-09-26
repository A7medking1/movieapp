import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations_use_case.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(
      this.getMovieDetailUseCase, this.getMovieRecommendationsUseCase)
      : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetailEvent);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

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


  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async{
    final result = await getMovieRecommendationsUseCase(
        RecommendationsParameters(event.id));

    result.fold(
          (l) => emit(
        state.copWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copWith(
          recommendationState: RequestState.loaded,
          recommendation: r,
        ),
      ),
    );
  }
}
