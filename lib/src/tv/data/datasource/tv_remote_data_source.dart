import 'package:movieapp/src/core/api/api_consumer.dart';
import 'package:movieapp/src/tv/data/models/episodes_model.dart';
import 'package:movieapp/src/tv/data/models/tv_detail_model.dart';
import 'package:movieapp/src/tv/data/models/tv_model.dart';
import 'package:movieapp/src/tv/domin/usecases/animation_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/top_rated_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/trending_tv_show_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_detail_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_episode_detail_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/war_tv_usecase.dart';

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
  final ApiConsumer apiConsumer;

  TvRemoteDataSource(this.apiConsumer);

  @override
  Future<List<TvModel>> getPopularTvShow(
      PopularTvShowParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.popularTvPath(parameters.page));

    return List<TvModel>.from((response.data["results"] as List).map(
      (e) => TvModel.fromJson(e),
    ));
  }

  @override
  Future<List<TvModel>> getTopRatedTvShow(
      TopRatedTvShowParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.topRatedTvPath(parameters.page));

    return List<TvModel>.from((response.data["results"] as List).map(
      (e) => TvModel.fromJson(e),
    ));
  }

  @override
  Future<List<TvModel>> getAnimationTvShow(
      AiringTodayTvShowParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.animationTvPath(parameters.page));

    return List<TvModel>.from((response.data["results"] as List).map(
      (e) => TvModel.fromJson(e),
    ));
  }

  @override
  Future<List<TvModel>> getWarTvShow(
      OnTheAirTvShowParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.WarTvPath(parameters.page));

    return List<TvModel>.from((response.data["results"] as List).map(
      (e) => TvModel.fromJson(e),
    ));
  }

  @override
  Future<List<TvModel>> getTrendingTvShow(
      TrendingTvShowParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.trendingTvPath(parameters.page));
    return List<TvModel>.from((response.data["results"] as List).map(
      (e) => TvModel.fromJson(e),
    ));
  }

  @override
  Future<TvDetailModel> getTvDetails(TvDetailParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.tvDetailPath(parameters.id));
    return TvDetailModel.fromJson(response.data);
  }

  @override
  Future<List<EpisodesModel>> getTvSeasonDetails(
      TvSeasonDetailParameters parameters) async {
    final response = await apiConsumer.get(ApiConstance.tvSeasonDetailPath(
        parameters.tvId, parameters.seasonNumber));

    return List<EpisodesModel>.from((response.data["episodes"] as List).map(
      (e) => EpisodesModel.fromJson(e),
    ));
  }
}
