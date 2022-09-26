import 'package:dartz/dartz.dart';
import 'package:movieapp/src/core/error/exception.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/src/domain/entity/movie.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations_use_case.dart';

class MovieRepository extends BaseMovieRepository
{
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
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await movieRemoteDataSource.getPopularMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await movieRemoteDataSource.getTopRatedMovie();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailParameter parameter)async {
    final result = await movieRemoteDataSource.getMovieDetails(parameter);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(RecommendationsParameters parameters) async{
    final result = await movieRemoteDataSource.getRecommendations((parameters));
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}