import 'package:dartz/dartz.dart';
import 'package:movieapp/src/core/error/exception.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/src/domain/entity/credits.dart';
import 'package:movieapp/src/domain/entity/genres.dart';
import 'package:movieapp/src/domain/entity/movie.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/entity/videos.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';
import 'package:movieapp/src/domain/usecases/credits_movie.dart';
import 'package:movieapp/src/domain/usecases/get_credits.dart';
import 'package:movieapp/src/domain/usecases/get_movie_by_genres.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations.dart';

import '../../domain/usecases/get_popular_movies.dart';
import '../../domain/usecases/get_top_rated_movies.dart';
import '../../domain/usecases/get_videos.dart';

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
  Future<Either<Failure, List<Movie>>> getTopRatedMovies(TopRatedParameters parameters) async {
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
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationsParameters parameters) async {
    final result = await movieRemoteDataSource.getRecommendations((parameters));
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Credits>>> getCredits(
      CreditsParameters parameters) async {
    final result = await movieRemoteDataSource.getCredits(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Videos>>> getVideos(
      VideoParameters parameters) async {
    final result = await movieRemoteDataSource.getVideos(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getCreditsMovie(
      CreditsMovieParameters parameters) async {
    final result = await movieRemoteDataSource.getCreditsMovie(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Genres>>> getGenres()async{
    final result = await movieRemoteDataSource.getGenres();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesByGenres(MovieByGenresParameters parameters) async{
    final result = await movieRemoteDataSource.getMoviesByGenres(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
