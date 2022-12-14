import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/src/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/src/data/repository/movie_repository.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';
import 'package:movieapp/src/domain/usecases/credits_movie.dart';
import 'package:movieapp/src/domain/usecases/get_genres.dart';
import 'package:movieapp/src/domain/usecases/get_movie_by_genres.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations.dart';
import 'package:movieapp/src/domain/usecases/get_now_playing_movies.dart';
import 'package:movieapp/src/domain/usecases/get_popular_movies.dart';
import 'package:movieapp/src/domain/usecases/get_top_rated_movies.dart';
import 'package:movieapp/src/domain/usecases/search_movies.dart';
import 'package:movieapp/src/presentation/controller/genres_bloc/genres_bloc.dart';
import 'package:movieapp/src/presentation/controller/movie_bloc/movies_bloc.dart';
import 'package:movieapp/src/presentation/controller/movie_by_genrec_bloc/movies_by_genres_bloc.dart';
import 'package:movieapp/src/presentation/controller/popular_pagination_bloc/popular_pagination_bloc.dart';
import 'package:movieapp/src/presentation/controller/search_bloc/search_bloc.dart';
import 'package:movieapp/src/presentation/controller/top_rated_pagination_bloc/top_rated_pagination_bloc.dart';

import '../../domain/usecases/get_credits.dart';
import '../../domain/usecases/get_videos.dart';
import '../../presentation/controller/credit_movies_bloc/credits_movies_bloc.dart';
import '../../presentation/controller/movie_detail_bloc/movie_detail_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    /// Dio
    sl.registerLazySingleton<Dio>(() => Dio());

    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailBloc(sl() , sl() , sl() , sl() ,));
    sl.registerFactory(() => GenresBloc(sl()));
    sl.registerFactory(() => MoviesByGenresBloc(sl()));
    sl.registerFactory(() => CreditsMoviesBloc(sl()));
    sl.registerFactory(() => PopularPaginationBloc(sl()));
    sl.registerFactory(() => TopRatedPaginationBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationsUseCase(sl()));
    sl.registerLazySingleton(() => GetCreditsUseCase(sl()));
    sl.registerLazySingleton(() => GetVideosUseCase(sl()));
    sl.registerLazySingleton(() => GetCreditsMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetGenresUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesByGenresUseCase(sl()));
    sl.registerLazySingleton(() => SearchMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    /// data source
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => MovieRemoteDataSource());
  }
}
