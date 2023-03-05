import 'package:dartz/dartz.dart';
import 'package:movieapp/src/movie/domain/entity/person.dart';
import 'package:movieapp/src/movie/domain/entity/search.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/entity/genres.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_detail.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../../domain/usecases/credits_info.dart';
import '../../domain/usecases/get_movie_by_genres.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_search.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource movieRemoteDataSource;

  MovieRepository(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await movieRemoteDataSource.getNowPlayingMovie();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies(
      PopularMovieParameters parameters) async {
    try {
      final result = await movieRemoteDataSource.getPopularMovie(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(
      TopRatedParameters parameters) async {
    try {
      final result = await movieRemoteDataSource.getTopRatedMovie(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameter parameter) async {
    try {
      final result = await movieRemoteDataSource.getMovieDetails(parameter);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Person>> getCreditInfo(
      CreditInfoParameters parameters) async {
    try {
      final result = await movieRemoteDataSource.getCreditInfo(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Genres>>> getGenres() async {
    try {
      final result = await movieRemoteDataSource.getGenres();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesByGenres(
      MovieByGenresParameters parameters) async {
    try {
      final result = await movieRemoteDataSource.getMoviesByGenres(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Search>>> getSearch(
      SearchParameters parameters) async {
    try {
      final result = await movieRemoteDataSource.getSearch(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
