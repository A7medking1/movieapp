import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/usecases/animation_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/war_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/trending_tv_show_usecase.dart';

import '../../../../core/utils/enums.dart';
import '../../../domin/usecases/popular_tv_usecase.dart';
import '../../../domin/usecases/top_rated_tv_usecase.dart';

part 'tv_event.dart';

part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetPopularTvShowUseCase getPopularTvShowUseCase;
  final GetTopRatedTvUseCae getTopRatedTvShowUseCase;
  final GetWarTvShowUseCase getWarShowUseCase;
  final GetTrendingTvShowUseCase getTrendingTvShowUseCase;

  final GetAnimationTvShowUseCase getAnimationTvShowUseCase;

  TvBloc(
      this.getPopularTvShowUseCase,
      this.getTopRatedTvShowUseCase,
      this.getAnimationTvShowUseCase,
      this.getWarShowUseCase,
      this.getTrendingTvShowUseCase)
      : super(TvState()) {
    on<GetPopularTvEvent>(_getPopularTv);
    on<GetTopRatedTvEvent>(_getTopRatedTv);
    on<GetWarTvEvent>(_getOnAirTv);
    on<GetAnimationTvEvent>(_getAiringTodayTv);
    on<GetTrendingTvEvent>(_getTrendingTv);
  }

  int page = 1;

  //bool isLoading = false;

  FutureOr<void> _getPopularTv(
      GetPopularTvEvent event, Emitter<TvState> emit) async {
    List<Tv> tv = [];
   // isLoading = true;
    final result = await getPopularTvShowUseCase(PopularTvShowParameters(page));

    print('_getPopularTv');
    result.fold(
      (l) => emit(state.copyWith(
        popularTvState: RequestState.error,
        popularTvMessage: l.message,
      )),
      (r) {
        tv = r;
        emit(
          state.copyWith(
            popularTvState: RequestState.loaded,
            popularTv: state.popularTv + tv,
          ),
        );
      },
    );
   // isLoading = false;
  }

  FutureOr<void> _getTopRatedTv(
      GetTopRatedTvEvent event, Emitter<TvState> emit) async {
    List<Tv> tv = [];
    //isLoading = true;

    final result =
        await getTopRatedTvShowUseCase(TopRatedTvShowParameters(page));
    print('_getTopRatedTv');
    result.fold(
      (l) => emit(state.copyWith(
        topRatedTvState: RequestState.error,
        topRatedTvMessage: l.message,
      )),
      (r) {
        tv = r;
        emit(
          state.copyWith(
            topRatedTvState: RequestState.loaded,
            topRatedTv:  state.topRatedTv+tv ,
          ),
        );
      },
    );
   // isLoading = false;
  }

  FutureOr<void> _getOnAirTv(
      GetWarTvEvent event, Emitter<TvState> emit) async {
    List<Tv> tv = [];
  //  isLoading = true;

    final result =
        await getWarShowUseCase(OnTheAirTvShowParameters(page));
    print('_getOnAirTv');
    result.fold(
      (l) => emit(state.copyWith(
        onAirTvState: RequestState.error,
        onAirTvMessage: l.message,
      )),
      (r) {
        tv = r;
        emit(
          state.copyWith(
            onAirTvState: RequestState.loaded,
            onAirTv: state.warTv + tv,
          ),
        );
      },
    );
  //  isLoading = false;
  }

  FutureOr<void> _getAiringTodayTv(
      GetAnimationTvEvent event, Emitter<TvState> emit) async {
    List<Tv> tv = [];
    //isLoading = true;

    print('_getAiringTodayTv');

    final result =
        await getAnimationTvShowUseCase(AiringTodayTvShowParameters(page));

    result.fold(
      (l) => emit(state.copyWith(
        airingTodayTvState: RequestState.error,
        airingTodayTvMessage: l.message,
      )),
      (r) {
        tv = r;
        emit(
          state.copyWith(
            airingTodayTvState: RequestState.loaded,
            airingTodayTv: state.animationTv + tv,
          ),
        );
      },
    );
    //isLoading = false;
  }

  FutureOr<void> _getTrendingTv(
      GetTrendingTvEvent event, Emitter<TvState> emit) async {
    List<Tv> tv = [];
   // isLoading = true;

    final result =
        await getTrendingTvShowUseCase(TrendingTvShowParameters(page));

    print('_getTrendingTv');
    result.fold(
      (l) => emit(state.copyWith(
        trendingTvState: RequestState.error,
        trendingTvMessage: l.message,
      )),
      (r) {
        tv = r;
        emit(
          state.copyWith(
            trendingTvState: RequestState.loaded,
            trendingTv: state.trendingTv + tv,
          ),
        );
      },
    );
   // isLoading = false;
  }
}
