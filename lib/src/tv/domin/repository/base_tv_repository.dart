import 'package:dartz/dartz.dart';
import 'package:movieapp/src/tv/domin/entitiy/episodes.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv_detail.dart';
import 'package:movieapp/src/tv/domin/usecases/tv_detail_usecase.dart';
import '../../../core/error/failures.dart';
import '../usecases/animation_tv_usecase.dart';
import '../usecases/war_tv_usecase.dart';
import '../usecases/popular_tv_usecase.dart';
import '../usecases/top_rated_tv_usecase.dart';
import '../usecases/trending_tv_show_usecase.dart';
import '../usecases/tv_episode_detail_usecase.dart';

abstract class BaseTvRepository {

  Future<Either<Failure,List<Tv>>> getPopularTvShow(PopularTvShowParameters parameters);

  Future<Either<Failure,List<Tv>>> getTopRatedTvShow(TopRatedTvShowParameters parameters);


  Future<Either<Failure,List<Tv>>> getWarTvShow(OnTheAirTvShowParameters parameters);

  Future<Either<Failure,List<Tv>>> getAnimationTvShow(AiringTodayTvShowParameters parameters);


  Future<Either<Failure,List<Tv>>> getTrendingTvShow(TrendingTvShowParameters parameters);

  Future<Either<Failure,TvDetail>> getTvDetail(TvDetailParameters parameters);

  Future<Either<Failure,List<Episodes>>> getTvEpisodesDetail(TvSeasonDetailParameters parameters);




}