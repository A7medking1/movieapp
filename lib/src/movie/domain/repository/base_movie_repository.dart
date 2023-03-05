
import 'package:dartz/dartz.dart';
import 'package:movieapp/src/movie/domain/entity/person.dart';
import 'package:movieapp/src/movie/domain/entity/search.dart';

import '../../../core/error/failures.dart';
import '../entity/genres.dart';
import '../entity/movie.dart';
import '../entity/movie_detail.dart';

import '../usecases/credits_info.dart';
import '../usecases/get_movie_by_genres.dart';
import '../usecases/get_movie_detail.dart';
import '../usecases/get_popular_movies.dart';
import '../usecases/get_top_rated_movies.dart';
import '../usecases/get_search.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies(PopularMovieParameters parameters);

  Future<Either<Failure,List<Movie>>>  getTopRatedMovies(TopRatedParameters parameters);

  Future<Either<Failure,MovieDetail>>  getMovieDetails(MovieDetailParameter parameter);


  Future<Either<Failure,Person>> getCreditInfo(CreditInfoParameters parameters);

  Future<Either<Failure , List<Genres>>> getGenres();

  Future<Either<Failure,List<Movie>>> getMoviesByGenres(MovieByGenresParameters parameters);

  Future<Either<Failure,List<Search>>> getSearch(SearchParameters parameters);
}