part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetPopularTvEvent extends TvEvent {}
class GetTopRatedTvEvent extends TvEvent {}

//class GetLatestTvEvent extends TvEvent {}
class GetWarTvEvent extends TvEvent {}
class GetAnimationTvEvent extends TvEvent {}

class GetTrendingTvEvent extends TvEvent {}

