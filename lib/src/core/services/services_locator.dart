import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/src/tv/data/datasource/tv_remote_data_source.dart';
import 'package:movieapp/src/tv/domin/repository/base_tv_repository.dart';
import 'package:movieapp/src/tv/domin/usecases/animation_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/war_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/popular_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/top_rated_tv_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/trending_tv_show_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_detail_usecase.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_episode_detail_usecase.dart';
import 'package:movieapp/src/tv/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movieapp/src/tv/presentation/controller/tv_detail_bloc/tv_detail_bloc.dart';
import 'package:movieapp/src/tv/presentation/controller/tv_pagination_bloc/tv_bloc.dart';

import '../../movie/data/datasource/movie_remote_data_source.dart';
import '../../movie/data/repository/movie_repository.dart';
import '../../movie/domain/repository/base_movie_repository.dart';
import '../../movie/domain/usecases/credits_movie.dart';
import '../../movie/domain/usecases/get_credits.dart';
import '../../movie/domain/usecases/get_genres.dart';
import '../../movie/domain/usecases/get_movie_by_genres.dart';
import '../../movie/domain/usecases/get_movie_detail.dart';
import '../../movie/domain/usecases/get_movie_recommendations.dart';
import '../../movie/domain/usecases/get_now_playing_movies.dart';
import '../../movie/domain/usecases/get_popular_movies.dart';
import '../../movie/domain/usecases/get_top_rated_movies.dart';
import '../../movie/domain/usecases/get_videos.dart';
import '../../movie/domain/usecases/search_movies.dart';
import '../../movie/presentation/controller/credit_movies_bloc/credits_movies_bloc.dart';
import '../../movie/presentation/controller/genres_bloc/genres_bloc.dart';
import '../../movie/presentation/controller/movie_bloc/movies_bloc.dart';
import '../../movie/presentation/controller/movie_by_genrec_bloc/movies_by_genres_bloc.dart';
import '../../movie/presentation/controller/movie_detail_bloc/movie_detail_bloc.dart';
import '../../movie/presentation/controller/popular_pagination_bloc/popular_pagination_bloc.dart';
import '../../movie/presentation/controller/search_bloc/search_bloc.dart';
import '../../movie/presentation/controller/top_rated_pagination_bloc/top_rated_pagination_bloc.dart';
import '../../tv/data/repository/tv_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Dio
    sl.registerLazySingleton<Dio>(() => Dio());

    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(
          sl(),
          sl(),
          sl(),
          sl(),
        ));
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

    /// *******************************************************************

    /// tv  Bloc

    sl.registerFactory(() => TvDetailBloc(sl(),sl()));

    sl.registerFactory(() => TvBloc(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));

    sl.registerFactory(() => TvPaginationBloc(sl(), sl(), sl(), sl(), sl()));

    /// tv Use Cases
    sl.registerLazySingleton(() => GetPopularTvShowUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCae(sl()));
    sl.registerLazySingleton(() => GetWarTvShowUseCase(sl()));
    sl.registerLazySingleton(() => GetAnimationTvShowUseCase(sl()));
    sl.registerLazySingleton(() => GetTrendingTvShowUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetTvSeasonDetailUseCase(sl()));

    /// tv Repository
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    /// tv data source
    sl.registerLazySingleton<BaseRemoteTvDataSource>(
        () => TvRemoteDataSource());
  }
}
