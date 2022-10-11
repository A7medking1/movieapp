part of 'credits_movies_bloc.dart';

class CreditsMoviesState extends Equatable {
  final List<Movie> creditMovies;
  final RequestState creditMoviesState;
  final String creditMoviesMessage;

  const CreditsMoviesState({
    this.creditMovies = const [],
    this.creditMoviesState = RequestState.loading,
    this.creditMoviesMessage = '',
  });

  CreditsMoviesState copWith({
    List<Movie>? creditMovies,
    RequestState? creditMoviesState,
    String? creditMoviesMessage,
  }) {
    return CreditsMoviesState(
      creditMovies: creditMovies ?? this.creditMovies,
      creditMoviesState: creditMoviesState ?? this.creditMoviesState,
      creditMoviesMessage: creditMoviesMessage ?? this.creditMoviesMessage,
    );
  }

  @override
  List<Object> get props => [
        creditMovies,
        creditMoviesState,
        creditMoviesMessage,
      ];
}
