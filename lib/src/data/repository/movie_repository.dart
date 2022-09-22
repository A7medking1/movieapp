import 'package:dartz/dartz.dart';
import 'package:movieapp/src/core/error/exception.dart';
import 'package:movieapp/src/core/error/failure.dart';
import 'package:movieapp/src/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/src/domain/entity/movie.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

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
}
