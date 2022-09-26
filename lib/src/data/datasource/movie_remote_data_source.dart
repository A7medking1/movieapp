import 'package:dio/dio.dart';
import 'package:movieapp/src/data/models/movie_detail_model.dart';
import 'package:movieapp/src/data/models/movie_model.dart';
import 'package:movieapp/src/data/models/recommendation_model.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations_use_case.dart';

import '../../core/error/exception.dart';
import '../../core/network/error_message_model.dart';
import '../../core/utils/api_constance.dart';

abstract class BaseRemoteMovieDataSource
{
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<MovieDetail> getMovieDetails(MovieDetailParameter parameter);


  Future<List<Recommendation>> getRecommendations(RecommendationsParameters parameter);
}

class MovieRemoteDataSource extends BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovie() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    final response = await Dio().get(ApiConstance.topRatedPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetail> getMovieDetails(MovieDetailParameter parameter)async {
    final response = await Dio().get(ApiConstance.movieDetailPath(parameter.id));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Recommendation>> getRecommendations(RecommendationsParameters parameter) async{
    final response = await Dio().get(ApiConstance.recommendationsPath(parameter.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List).map(
            (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
