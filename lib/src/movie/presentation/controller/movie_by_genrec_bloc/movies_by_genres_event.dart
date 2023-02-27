part of 'movies_by_genres_bloc.dart';

abstract class MoviesByGenresEvent extends Equatable {
  const MoviesByGenresEvent();

  @override
  List<Object> get props => [];
}


class GetMoviesByGenresEvent extends MoviesByGenresEvent{

  final int genresId ;

  const GetMoviesByGenresEvent(this.genresId);
}
