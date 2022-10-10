part of 'movie_pagination_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class PopularMovieLoaded extends MovieState {
  final List<Movie> movie;
  const PopularMovieLoaded(this.movie);
}

class PopularMovieLoading extends MovieState {
  final List<Movie> oldMovie;
  final bool isFirstFetch;
  const PopularMovieLoading(this.oldMovie, {this.isFirstFetch=false});
}


  ///  /// // /// / // / / // / / //
class TopRatedMovieLoaded extends MovieState {
  final List<Movie> movie;
  const TopRatedMovieLoaded(this.movie);
}

class TopRatedMovieLoading extends MovieState {
  final List<Movie> oldMovie;
  final bool isFirstFetch;
  const TopRatedMovieLoading(this.oldMovie, {this.isFirstFetch=false});
}
