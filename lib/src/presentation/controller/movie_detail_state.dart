part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailRequestState;
  final String movieDetailMessage;

  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailState({
    this.movieDetail,
    this.movieDetailRequestState = RequestState.loading,
    this.movieDetailMessage = "",
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = "",
  });

  MovieDetailState copWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailRequestState,
    String? movieDetailMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailRequestState:
            movieDetailRequestState ?? this.movieDetailRequestState,
        movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage);
  }

  @override
  List<Object?> get props =>
      [
        movieDetail,
        movieDetailRequestState,
        movieDetailMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
