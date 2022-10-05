part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movie;
  const MovieLoaded(this.movie);
}

class MovieLoading extends MovieState {
  final List<Movie> oldMovie;
  final bool isFirstFetch;
  const MovieLoading(this.oldMovie, {this.isFirstFetch=false});
}
