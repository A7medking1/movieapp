import 'package:dartz/dartz.dart';
import 'package:movieapp/src/core/error/exception.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/movie/domain/entity/person.dart';

import '../../domain/entity/genres.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_detail.dart';
import '../../domain/repository/base_movie_repository.dart';
import '../../domain/usecases/credits_info.dart';
import '../../domain/usecases/get_movie_by_genres.dart';
import '../../domain/usecases/get_movie_detail.dart';
import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/search_movies.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource movieRemoteDataSource;

  MovieRepository(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await movieRemoteDataSource.getNowPlayingMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies(
      PopularMovieParameters parameters) async {
    final result = await movieRemoteDataSource.getPopularMovie(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(
      TopRatedParameters parameters) async {
    final result = await movieRemoteDataSource.getTopRatedMovie(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameter parameter) async {
    final result = await movieRemoteDataSource.getMovieDetails(parameter);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Person>> getCreditInfo(
      CreditInfoParameters parameters) async {
    final result = await movieRemoteDataSource.getCreditInfo(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Genres>>> getGenres() async {
    final result = await movieRemoteDataSource.getGenres();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesByGenres(
      MovieByGenresParameters parameters) async {
    final result = await movieRemoteDataSource.getMoviesByGenres(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(
      SearchMoviesParameters parameters) async {
    final result = await movieRemoteDataSource.searchMovies(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
