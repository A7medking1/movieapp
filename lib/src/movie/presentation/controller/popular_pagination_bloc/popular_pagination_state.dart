part of 'popular_pagination_bloc.dart';

class PopularPaginationState extends Equatable {

  final List<Movie> movie;
  final RequestState requestState;
  final String message;

  const PopularPaginationState({
    this.movie = const [],
    this.message = '',
    this.requestState = RequestState.loading,
  });

  PopularPaginationState copyWith({
    List<Movie>? movie,
    RequestState? requestState,
    String? message,
  }) {
    return PopularPaginationState(
      movie: movie ?? this.movie,
      message: message ?? this.message,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object> get props => [movie, requestState, message];
}
