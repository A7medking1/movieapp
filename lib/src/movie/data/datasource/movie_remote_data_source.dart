import 'package:dio/dio.dart';
import 'package:movieapp/src/movie/data/models/person_model.dart';


import '../../../core/error/exception.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/api_constance.dart';
import '../../domain/usecases/credits_info.dart';
import '../../domain/usecases/get_movie_by_genres.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/search_movies.dart';
import '../models/genres_model.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';


abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie(PopularMovieParameters parameters);

  Future<List<MovieModel>> getTopRatedMovie(TopRatedParameters parameters);

  Future<MovieDetailModel> getMovieDetails(MovieDetailParameter parameter);

  Future<PersonModel> getCreditInfo(CreditInfoParameters parameters);

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


  Future<PersonModel> getCreditInfo(
      CreditInfoParameters parameters) async {
    final response =
        await sl<Dio>().get(ApiConstance.creditInfoPath(parameters.personId));

    if (response.statusCode == 200) {
      return PersonModel.fromJson(response.data);
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
