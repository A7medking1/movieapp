part of 'tv_shows_by_genres_bloc.dart';

abstract class TvShowsByGenresEvent extends Equatable {
  const TvShowsByGenresEvent();

  @override
  List<Object> get props => [];
}


class GetTvShowsByGenresEvent extends TvShowsByGenresEvent {
  final int genresId;

  GetTvShowsByGenresEvent(this.genresId);
}
