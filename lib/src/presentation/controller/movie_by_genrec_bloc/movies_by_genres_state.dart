part of 'movies_by_genres_bloc.dart';

class MoviesByGenresState extends Equatable {
  final List<Movie> movie;
  final RequestState requestState;
  final String message;

  const MoviesByGenresState({
    this.movie = const[],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  MoviesByGenresState copyWith({
    List<Movie>? movie,
    RequestState? requestState,
    String? message,
  }) {
    return MoviesByGenresState(
      message: message ?? this.message,
      movie: movie ?? this.movie,
      requestState: requestState ?? this.requestState,
    );
  }


  @override
  List<Object> get props => [movie, requestState, message];


}
