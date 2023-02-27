
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entity/credits.dart';
import '../entity/genres.dart';
import '../entity/movie.dart';
import '../entity/movie_detail.dart';
import '../entity/recommendations.dart';
import '../entity/videos.dart';
import '../usecases/credits_movie.dart';
import '../usecases/get_credits.dart';
import '../usecases/get_movie_by_genres.dart';
import '../usecases/get_movie_detail.dart';
import '../usecases/get_movie_recommendations.dart';
import '../usecases/get_popular_movies.dart';
import '../usecases/get_top_rated_movies.dart';
import '../usecases/get_videos.dart';
import '../usecases/search_movies.dart';

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

  Future<Either<Failure,List<Movie>>> searchMovies(SearchMoviesParameters parameters);
}