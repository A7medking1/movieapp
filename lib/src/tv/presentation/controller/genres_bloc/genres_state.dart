part of 'genres_bloc.dart';

class TvGenresState extends Equatable {
  final List<Genres> genres;

  final RequestState requestState;

  final String message;

  const TvGenresState({
    this.genres = const [],
    this.requestState = RequestState.loading,
    this.message = '',
  });

  TvGenresState copyWith({
    List<Genres>? genres,
    RequestState? requestState,
    String? message,
  }) {
    return TvGenresState(
      genres: genres ?? this.genres,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [genres, requestState, message];
}
