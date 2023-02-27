part of 'genres_bloc.dart';

class GenresState extends Equatable {
  final List<Genres> genres;

  final RequestState requestState;

  final String message;

  const GenresState({
    this.genres = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  GenresState copyWith({
    List<Genres>? genres,
    RequestState? requestState,
    String? message,
  }) {
    return GenresState(
      genres: genres ?? this.genres,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [genres, requestState, message];
}
