import 'package:get_it/get_it.dart';
import 'package:movieapp/src/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/src/data/repository/movie_repository.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';
import 'package:movieapp/src/domain/usecases/get_movie_detail_use_case.dart';
import 'package:movieapp/src/domain/usecases/get_movie_recommendations_use_case.dart';
import 'package:movieapp/src/domain/usecases/get_now_playing_movies.dart';
import 'package:movieapp/src/domain/usecases/get_popular_movies.dart';
import 'package:movieapp/src/domain/usecases/get_top_rated_movies.dart';
import 'package:movieapp/src/presentation/controller/movies_bloc.dart';

import '../../presentation/controller/movie_detail_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {

    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailBloc(sl() , sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    /// data source
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => MovieRemoteDataSource());
  }
}
