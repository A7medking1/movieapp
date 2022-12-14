part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailRequestState;
  final String movieDetailMessage;

  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  final List<Credits> credits;
  final RequestState creditsState;
  final String creditsMessage;

  final List<Videos> videos;
  final RequestState videoState;
  final String videoMessage;


  const MovieDetailState({
    this.movieDetail,
    this.movieDetailRequestState = RequestState.loading,
    this.movieDetailMessage = "",
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = "",
    this.credits = const [],
    this.creditsState = RequestState.loading,
    this.creditsMessage = "",
    this.videos = const [],
    this.videoState = RequestState.loading,
    this.videoMessage = "",
  });

  MovieDetailState copWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailRequestState,
    String? movieDetailMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
    List<Credits>? credits,
    RequestState? creditsState,
    String? creditsMessage,
    List<Videos>? videos,
    RequestState? videoState,
    String? videoMessage,


  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailRequestState:
      movieDetailRequestState ?? this.movieDetailRequestState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
      recommendationMessage ?? this.recommendationMessage,
      credits: credits ?? this.credits,
      creditsState: creditsState ?? this.creditsState,
      creditsMessage: creditsMessage ?? this.creditsMessage,

      videos: videos ?? this.videos,
      videoState: videoState ?? this.videoState,
      videoMessage: videoMessage ?? this.videoMessage,



    );
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
        credits,
        creditsState,
        creditsMessage,
        videos,
        videoState,
        videoMessage,
      ];
}
