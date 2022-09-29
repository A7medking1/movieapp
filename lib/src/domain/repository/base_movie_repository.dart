
import 'package:dartz/dartz.dart';
import 'package:movieapp/src/domain/entity/credits.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations.dart';

import '../../core/error/failure.dart';
import '../entity/movie.dart';
import '../usecases/get_credits.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>>  getTopRatedMovies();

  Future<Either<Failure,MovieDetail>>  getMovieDetails(MovieDetailParameter parameter);

  Future<Either<Failure, List<Recommendation>>>  getRecommendations(RecommendationsParameters parameters);

  Future<Either<Failure,List<Credits>>> getCredits(CreditsParameters parameters);



}