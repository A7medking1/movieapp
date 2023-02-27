import 'package:dio/dio.dart';
import 'package:movieapp/src/tv/data/models/episodes_model.dart';
import 'package:movieapp/src/tv/data/models/tv_detail_model.dart';
import 'package:movieapp/src/tv/data/models/tv_model.dart';
import 'package:movieapp/src/tv/domin/usecases/animation_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/war_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/top_rated_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/trending_tv_show_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_detail_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_episode_detail_usecase.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/api_constance.dart';
import '../../domin/usecases/popular_tv_usecase.dart';

abstract class BaseRemoteTvDataSource {
  Future<List<TvModel>> getPopularTvShow(PopularTvShowParameters parameters);

  Future<List<TvModel>> getTopRatedTvShow(TopRatedTvShowParameters parameters);

  Future<List<TvModel>> getWarTvShow(OnTheAirTvShowParameters parameters);

  Future<List<TvModel>> getAnimationTvShow(
      AiringTodayTvShowParameters parameters);

  Future<List<TvModel>> getTrendingTvShow(TrendingTvShowParameters parameters);

  Future<TvDetailModel> getTvDetails(TvDetailParameters parameters);

  Future<List<EpisodesModel>> getTvSeasonDetails(
      TvSeasonDetailParameters parameters);
}

class TvRemoteDataSource extends BaseRemoteTvDataSource {
  @override
  Future<List<TvModel>> getPopularTvShow(
      PopularTvShowParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.popularTvPath(parameters.page));
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvShow(
      TopRatedTvShowParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.topRatedTvPath(parameters.page));
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getAnimationTvShow(
      AiringTodayTvShowParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.animationTvPath(parameters.page));
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getWarTvShow(
      OnTheAirTvShowParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.WarTvPath(parameters.page));
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTrendingTvShow(
      TrendingTvShowParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.trendingTvPath(parameters.page));
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data["results"] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TvDetailModel> getTvDetails(TvDetailParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.tvDetailPath(parameters.id));

    //print(response.data);

    if (response.statusCode == 200) {
      return TvDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<EpisodesModel>> getTvSeasonDetails(
      TvSeasonDetailParameters parameters) async {
    final response = await sl<Dio>().get(ApiConstance.tvSeasonDetailPath(
        parameters.tvId, parameters.seasonNumber));
    if (response.statusCode == 200) {
      return List<EpisodesModel>.from((response.data["episodes"] as List).map(
        (e) => EpisodesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
