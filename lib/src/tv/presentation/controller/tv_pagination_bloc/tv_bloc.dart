import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/usecases/animation_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/war_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/trending_tv_show_usecase.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/enums.dart';
import '../../../domin/usecases/popular_tv_usecase.dart';
import '../../../domin/usecases/top_rated_tv_usecase.dart';

part 'tv_event.dart';

part 'tv_state.dart';

class TvPaginationBloc extends Bloc<TvPaginationEvent, TvPaginationState> {
  final GetPopularTvShowUseCase getPopularTvShowUseCase;
  final GetTopRatedTvUseCae getTopRatedTvShowUseCase;
  final GetWarTvShowUseCase getOnTheAirTvShowUseCase;
  final GetTrendingTvShowUseCase getTrendingTvShowUseCase;

  final GetAnimationTvShowUseCase getAiringTodayTvShowUseCase;

  TvPaginationBloc(
      this.getPopularTvShowUseCase,
      this.getTopRatedTvShowUseCase,
      this.getAiringTodayTvShowUseCase,
      this.getOnTheAirTvShowUseCase,
      this.getTrendingTvShowUseCase)
      : super(TvPaginationState()) {
    on<GetPagination>(_getPagination);
  }

  int page = 1;

  FutureOr<void> _getPagination(
      GetPagination event, Emitter<TvPaginationState> emit) async {
    Either<Failure, List<Tv>> result;

    switch (event.seeMore) {
      case SeeMore.popular:
        result = await getPopularTvShowUseCase(PopularTvShowParameters(page));
        break;
      case SeeMore.topRated:
        result = await getTopRatedTvShowUseCase(TopRatedTvShowParameters(page));
        break;
      case SeeMore.trending:
        result = await getTrendingTvShowUseCase(TrendingTvShowParameters(page));
        break;
      case SeeMore.war:
        result = await getOnTheAirTvShowUseCase(OnTheAirTvShowParameters(page));
        break;
      case SeeMore.animation:
        result = await getAiringTodayTvShowUseCase(
            AiringTodayTvShowParameters(page));
        break;
    }

    print('_getPagination');
    if (page == 1) {
      print("first Page");
      result.fold(
        (l) => null,
        (r) {
          //  print(r);
          print(state.pagination.length);
          emit(
            state.copyWith(
              pagination: r,
            ),
          );
          print(state.pagination.length);
        },
      );
    } else {
      print(page);
      result.fold(
        (l) => null,
        (r) {
          emit(
            state.copyWith(
              pagination: state.pagination + r,
            ),
          );
          print(state.pagination.length);
          // log(r.toString());
        },
      );
    }
  }
}
