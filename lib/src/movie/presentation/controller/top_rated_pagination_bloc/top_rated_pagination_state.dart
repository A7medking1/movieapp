part of 'top_rated_pagination_bloc.dart';

class TopRatedPaginationState extends Equatable {

  final List<Movie> movie;
  final RequestState requestState;
  final String message;

  const TopRatedPaginationState({
    this.movie = const [],
    this.message = '',
    this.requestState = RequestState.loading,
  });

  TopRatedPaginationState copyWith({
    List<Movie>? movie,
    RequestState? requestState,
    String? message,
  }) {
    return TopRatedPaginationState(
      movie: movie ?? this.movie,
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object> get props => [movie, requestState, message];


}
