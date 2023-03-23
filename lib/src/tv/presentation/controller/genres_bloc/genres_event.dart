part of 'genres_bloc.dart';

abstract class TvGenresEvent extends Equatable {
  const TvGenresEvent();

  @override
  List<Object> get props => [];
}


class GetTvGenresEvent extends TvGenresEvent {}

