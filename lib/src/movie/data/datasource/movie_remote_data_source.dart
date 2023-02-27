import 'package:dio/dio.dart';


import '../../../core/error/exception.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/api_constance.dart';
import '../../domain/usecases/credits_movie.dart';
import '../../domain/usecases/get_credits.dart';
import '../../domain/usecases/get_movie_by_genres.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_movie_recommendations.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/get_videos.dart';
import '../../domain/usecases/search_movies.dart';
import '../models/credits_model.dart';
import '../models/genres_model.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';
import '../models/videos_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie(PopularMovieParameters parameters);

  Future<List<MovieModel>> getTopRatedMovie(TopRatedParameters parameters);

  Future<MovieDetailModel> getMovieDetails(MovieDetailParameter parameter);

  Future<List<RecommendationModel>> getRecommendations(
      RecommendationsParameters parameter);

  Future<List<CreditsModel>> getCredits(CreditsParameters parameters);

  Future<List<VideoModel>> getVideos(VideoParameters parameters);

  Future<List<MovieModel>> getCreditsMovie(CreditsMovieParameters parameters);

  Future<List<GenresModel>> getGenres();

  Future<List<MovieModel>> getMoviesByGenres(MovieByGenresParameters parameter);

  Future<List<MovieModel>> searchMovies(SearchMoviesParameters parameters);
}

class MovieRemoteDataSource extends BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await sl<Dio>().get(ApiConstance.nowPlayingMoviePath);

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
  Future<List<MovieModel>> getPopularMovie(
      PopularMovieParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.popularMoviePath(parameters.page));

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
  Future<List<MovieModel>> getTopRatedMovie(
      TopRatedParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.topRatedPath(parameters.page));

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
  Future<MovieDetailModel> getMovieDetails(MovieDetailParameter parameter) async {
    final response =
        await sl<Dio>().get(ApiConstance.movieDetailPath(parameter.id));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(
      RecommendationsParameters parameter) async {
    final response =
        await sl<Dio>().get(ApiConstance.recommendationsPath(parameter.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map(
        (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CreditsModel>> getCredits(CreditsParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.creditsPath(parameters.id));

    if (response.statusCode == 200) {
      return List<CreditsModel>.from((response.data["cast"] as List).map(
        (e) => CreditsModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<VideoModel>> getVideos(VideoParameters parameters) async {
    final response = await sl<Dio>().get(ApiConstance.videoPath(parameters.id));

    if (response.statusCode == 200) {
      return List<VideoModel>.from((response.data["results"] as List).map(
        (e) => VideoModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getCreditsMovie(
      CreditsMovieParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.creditMoviesPath(parameters.personId));

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["cast"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<GenresModel>> getGenres() async {
    final response = await sl<Dio>().get(ApiConstance.genresPath);

    if (response.statusCode == 200) {
      return List<GenresModel>.from((response.data["genres"] as List).map(
        (e) => GenresModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getMoviesByGenres(
      MovieByGenresParameters parameter) async {
    final response = await sl<Dio>()
        .get(ApiConstance.movieByGenres(parameter.genresId, parameter.page));
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
  Future<List<MovieModel>> searchMovies(
      SearchMoviesParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.searchMoviesPath(parameters.query));
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
}
