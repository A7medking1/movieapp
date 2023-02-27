import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/tv/domin/entitiy/episodes.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv_detail.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_detail_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_episode_detail_usecase.dart';

part 'tv_detail_event.dart';

part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  final GetTvDetailUseCase getTvDetailUseCase;
  final GetTvSeasonDetailUseCase getTvSeasonDetailUseCase;

  TvDetailBloc(this.getTvDetailUseCase, this.getTvSeasonDetailUseCase)
      : super(TvDetailState()) {
    on<GetTvDetailEvent>(_getTvDetail);
    on<GetTvSeasonDetailEvent>(_getTvSeasonDetail);
  }

  FutureOr<void> _getTvDetail(
      GetTvDetailEvent event, Emitter<TvDetailState> emit) async {
    final result = await getTvDetailUseCase(TvDetailParameters(event.id));

    result.fold(
      (l) => emit(state.copyWith(
        requestState: RequestState.error,
        message: l.message,
      )),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          tvDetail: r,
        ),
      ),
    );
  }

  int currentSeason = 1;

  void changeSeasonNumber(int newSeason) {
    currentSeason = newSeason;
  }

  FutureOr<void> _getTvSeasonDetail(
      GetTvSeasonDetailEvent event, Emitter<TvDetailState> emit) async {
    final result = await getTvSeasonDetailUseCase(TvSeasonDetailParameters(
        tvId: event.tvId, seasonNumber: event.seasonNumber));

    result.fold(
      (l) => emit(state.copyWith(
        episodeRequestState: RequestState.error,
        episodeMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          episodeRequestState: RequestState.loaded,
          episodes: r,
        ),
      ),
    );
  }
}
