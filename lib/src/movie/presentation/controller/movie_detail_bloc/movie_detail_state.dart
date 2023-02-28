part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailRequestState;
  final String movieDetailMessage;




  const MovieDetailState({
    this.movieDetail,
    this.movieDetailRequestState = RequestState.loading,
    this.movieDetailMessage = "",

  });

  MovieDetailState copWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailRequestState,
    String? movieDetailMessage,



  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailRequestState:
      movieDetailRequestState ?? this.movieDetailRequestState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,




    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetail,
        movieDetailRequestState,
        movieDetailMessage,

      ];
}
