part of 'tv_detail_bloc.dart';

abstract class TvDetailEvent {}

class GetTvDetailEvent extends TvDetailEvent {
  final int id;

  GetTvDetailEvent(this.id);
}

class GetTvSeasonDetailEvent extends TvDetailEvent {
  final int tvId;

  final int seasonNumber;

  GetTvSeasonDetailEvent({
    required this.tvId,
    required this.seasonNumber,
  });
}
