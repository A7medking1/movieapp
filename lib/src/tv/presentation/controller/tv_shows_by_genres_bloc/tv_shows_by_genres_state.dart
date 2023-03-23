part of 'tv_shows_by_genres_bloc.dart';

class TvShowsByGenresState extends Equatable {
  final List<Tv> tv;
  final RequestState requestState;
  final String message;

  const TvShowsByGenresState({
    this.tv = const[],
    this.requestState = RequestState.loading,
    this.message = '',
  });

TvShowsByGenresState copyWith({
    List<Tv>? tv,
    RequestState? requestState,
    String? message,
  }) {
    return TvShowsByGenresState(
      message: message ?? this.message,
      tv: tv ?? this.tv,
      requestState: requestState ?? this.requestState,
    );
  }


  @override
  List<Object> get props => [tv, requestState, message];


}
