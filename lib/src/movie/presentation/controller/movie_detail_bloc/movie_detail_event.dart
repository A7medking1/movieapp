part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int id;

  const GetMovieDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
