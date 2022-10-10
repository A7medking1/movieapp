
import 'package:dartz/dartz.dart';
import 'package:movieapp/src/domain/entity/credits.dart';
import 'package:movieapp/src/domain/entity/genres.dart';
import 'package:movieapp/src/domain/entity/movie_detail.dart';
import 'package:movieapp/src/domain/entity/recommendations.dart';
import 'package:movieapp/src/domain/entity/videos.dart';
import 'package:movieapp/src/domain/usecases/credits_movie.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations.dart';

import '../../core/error/failure.dart';
import '../entity/movie.dart';
import '../usecases/get_credits.dart';
import '../usecases/get_movie_by_genres.dart';
import '../usecases/get_popular_movies.dart';
import '../usecases/get_top_rated_movies.dart';
import '../usecases/get_videos.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies(PopularMovieParameters parameters);

  Future<Either<Failure,List<Movie>>>  getTopRatedMovies(TopRatedParameters parameters);

  Future<Either<Failure,MovieDetail>>  getMovieDetails(MovieDetailParameter parameter);

  Future<Either<Failure, List<Recommendation>>>  getRecommendations(RecommendationsParameters parameters);

  Future<Either<Failure,List<Credits>>> getCredits(CreditsParameters parameters);

  Future<Either<Failure,List<Videos>>> getVideos(VideoParameters parameters);

  Future<Either<Failure,List<Movie>>> getCreditsMovie(CreditsMovieParameters parameters);

  Future<Either<Failure , List<Genres>>> getGenres();

  Future<Either<Failure,List<Movie>>> getMoviesByGenres(MovieByGenresParameters parameters);


}