
import 'package:dartz/dartz.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations_use_case.dart';

import '../../core/error/failure.dart';
import '../entity/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>>  getTopRatedMovies();


  Future<Either<Failure,MovieDetail>>  getMovieDetails(MovieDetailParameter parameter);


  Future<Either<Failure, List<Recommendation>>>  getRecommendations(RecommendationsParameters parameters);
}