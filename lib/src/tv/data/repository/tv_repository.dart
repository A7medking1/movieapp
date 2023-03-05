import 'package:dartz/dartz.dart';
import 'package:movieapp/src/tv/data/datasource/tv_remote_data_source.dart';
import 'package:movieapp/src/tv/domin/entitiy/episodes.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv_detail.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';
import 'package:movieapp/src/tv/domin/usecases/animation_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/popular_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/top_rated_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/trending_tv_show_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_detail_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_episode_detail_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/war_tv_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';



class TvRepository extends BaseTvRepository {
  BaseRemoteTvDataSource remoteTvDataSource;

  TvRepository(this.remoteTvDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getPopularTvShow(
      PopularTvShowParameters parameters) async {
    try {
      final result = await remoteTvDataSource.getPopularTvShow(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTvShow(
      TopRatedTvShowParameters parameters) async {

    try {
      final result = await remoteTvDataSource.getTopRatedTvShow(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getAnimationTvShow(
      AiringTodayTvShowParameters parameters) async {

    try {
      final result = await remoteTvDataSource.getAnimationTvShow(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getWarTvShow(
      OnTheAirTvShowParameters parameters) async {

    try {
      final result = await remoteTvDataSource.getWarTvShow(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTrendingTvShow(
      TrendingTvShowParameters parameters) async {
    try {
      final result = await remoteTvDataSource.getTrendingTvShow(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetail>> getTvDetail(
      TvDetailParameters parameters) async {

    try {
      final result = await remoteTvDataSource.getTvDetails(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Episodes>>> getTvEpisodesDetail(
      TvSeasonDetailParameters parameters) async {

    try {
      final result = await remoteTvDataSource.getTvSeasonDetails(parameters);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
