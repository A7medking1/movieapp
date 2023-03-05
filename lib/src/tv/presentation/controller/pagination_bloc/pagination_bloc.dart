import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/src/movie/domain/usecases/get_popular_movies.dart';
import 'package:movieapp/src/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/usecases/animation_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/trending_tv_show_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/war_tv_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/enums.dart';
import '../../../../movie/domain/entity/movie.dart';
import '../../../domin/usecases/popular_tv_usecase.dart';
import '../../../domin/usecases/top_rated_tv_usecase.dart';

part 'pagination_event.dart';

part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc(
    this._getPopularTvShowUseCase,
    this._getTopRatedTvShowUseCase,
    this._getAiringTodayTvShowUseCase,
    this._getOnTheAirTvShowUseCase,
    this._getTrendingTvShowUseCase,
      this._getPopularMoviesUseCase,
      this._getTopRatedMoviesUseCase,
  ) : super(PaginationState()) {
    on<GetTvPaginationEvent>(_getPagination);
    on<GetMoviePaginationEvent>(_getMoviePagination);
  }

  /// tv
  final GetPopularTvShowUseCase _getPopularTvShowUseCase;
  final GetTopRatedTvUseCae _getTopRatedTvShowUseCase;
  final GetWarTvShowUseCase _getOnTheAirTvShowUseCase;
  final GetTrendingTvShowUseCase _getTrendingTvShowUseCase;
  final GetAnimationTvShowUseCase _getAiringTodayTvShowUseCase;

  /// movie
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;

  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  int page = 1;

  FutureOr<void> _getPagination(
      GetTvPaginationEvent event, Emitter<PaginationState> emit) async {
    Either<Failure, List<Tv>> result;

    switch (event.tvSeeMore) {
      case SeeMore.popular:
        result = await _getPopularTvShowUseCase(PopularTvShowParameters(page));
        break;
      case SeeMore.topRated:
        result =
            await _getTopRatedTvShowUseCase(TopRatedTvShowParameters(page));
        break;
      case SeeMore.trending:
        result =
            await _getTrendingTvShowUseCase(TrendingTvShowParameters(page));
        break;
      case SeeMore.war:
        result =
            await _getOnTheAirTvShowUseCase(OnTheAirTvShowParameters(page));
        break;
      case SeeMore.animation:
        result = await _getAiringTodayTvShowUseCase(
            AiringTodayTvShowParameters(page));
        break;
    }

    result.fold(
      (l) => null,
      (r) {
        emit(
          state.copyWith(
            tvPagination: state.tvPagination + r,
          ),
        );
      },
    );
  }

  FutureOr<void> _getMoviePagination(
      GetMoviePaginationEvent event, Emitter<PaginationState> emit)async {
    Either<Failure, List<Movie>> result;

    switch (event.movieSeeMore) {
      case SeeMore.popular:
        result = await _getPopularMoviesUseCase(PopularMovieParameters(page));
        break;
      case SeeMore.topRated:
        result = await _getTopRatedMoviesUseCase(TopRatedParameters(page));
        break;
      case SeeMore.trending:
        result = await _getTopRatedMoviesUseCase(TopRatedParameters(page));
        break;
      case SeeMore.war:
        result = await _getTopRatedMoviesUseCase(TopRatedParameters(page));
        break;
      case SeeMore.animation:
        result = await _getTopRatedMoviesUseCase(TopRatedParameters(page));
        break;
    }

    result.fold(
          (l) => null,
          (r) {
        emit(
          state.copyWith(
            moviePagination: state.moviePagination + r,
          ),
        );
      },
    );


  }
}
