import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/usecases/get_credits.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations.dart';

import '../../domain/entity/credits.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(
    this.getMovieDetailUseCase,
    this.getMovieRecommendationsUseCase,
    this.getCreditsUseCase,
  ) : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetailEvent);
    on<GetMovieRecommendationEvent>(_getRecommendation);
    on<GetCreditsEvent>(_getCredits);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;
  final GetCreditsUseCase getCreditsUseCase;

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

  FutureOr<void> _getRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {
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

  FutureOr<void> _getCredits(
      GetCreditsEvent event, Emitter<MovieDetailState> emit) async {
    final result = await getCreditsUseCase(CreditsParameters(event.id));

    result.fold(
      (l) => emit(
        state.copWith(
          creditsState: RequestState.error,
          creditsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copWith(
          creditsState: RequestState.loaded,
          credits: r,
        ),
      ),
    );
  }
}
