import 'package:dio/dio.dart';
import 'package:movieapp/src/core/api/api_consumer.dart';
import 'package:movieapp/src/movie/data/models/person_model.dart';
import 'package:movieapp/src/movie/data/models/search_model.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/api_constance.dart';
import '../../domain/usecases/credits_info.dart';
import '../../domain/usecases/get_movie_by_genres.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_search.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
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

  Future<List<SearchModel>> getSearch(SearchParameters parameters);
}

class MovieRemoteDataSource extends BaseRemoteMovieDataSource {

  final ApiConsumer apiConsumer ;


  MovieRemoteDataSource(this.apiConsumer);

  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await apiConsumer.get(ApiConstance.nowPlayingMoviePath);

    return List<MovieModel>.from((response.data["results"] as List).map(
      (e) => MovieModel.fromJson(e),
    ));
  }

  @override
  Future<List<MovieModel>> getPopularMovie(
      PopularMovieParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.popularMoviePath(parameters.page));

    return List<MovieModel>.from((response.data["results"] as List).map(
      (e) => MovieModel.fromJson(e),
    ));
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie(
      TopRatedParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.topRatedPath(parameters.page));

    return List<MovieModel>.from((response.data["results"] as List).map(
      (e) => MovieModel.fromJson(e),
    ));
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailParameter parameter) async {
    final response =
        await apiConsumer.get(ApiConstance.movieDetailPath(parameter.id));

    return MovieDetailModel.fromJson(response.data);
  }

  Future<PersonModel> getCreditInfo(CreditInfoParameters parameters) async {
    final response =
        await apiConsumer.get(ApiConstance.creditInfoPath(parameters.personId));

    return PersonModel.fromJson(response.data);
  }

  @override
  Future<List<GenresModel>> getGenres() async {
    final response = await apiConsumer.get(ApiConstance.genresPath);

    return List<GenresModel>.from((response.data["genres"] as List).map(
      (e) => GenresModel.fromJson(e),
    ));
  }

  @override
  Future<List<MovieModel>> getMoviesByGenres(
      MovieByGenresParameters parameter) async {
    final response = await apiConsumer.get(
      ApiConstance.movieByGenres(parameter.genresId, parameter.page),
    );
    return List<MovieModel>.from((response.data["results"] as List).map(
      (e) => MovieModel.fromJson(e),
    ));
  }

  @override
  Future<List<SearchModel>> getSearch(SearchParameters parameters) async {
    final response = await apiConsumer.get(
      ApiConstance.searchMoviesPath(parameters.query, parameters.searchType),
    );
    return List<SearchModel>.from((response.data["results"] as List).map(
      (e) => SearchModel.fromJson(e),
    ));
  }
}
