part of 'tv_detail_bloc.dart';

class TvDetailState extends Equatable {
  final TvDetail? tvDetail;

  final RequestState requestState;

  final String message;


  final List<Episodes> episodes;

  final RequestState episodeRequestState;

  final String episodeMessage;

  TvDetailState({
    this.tvDetail,
    this.requestState = RequestState.loading,
    this.message = '',

    this.episodes = const [],
    this.episodeMessage = '',
    this.episodeRequestState = RequestState.loading,
  });


  TvDetailState copyWith({
    TvDetail? tvDetail,

    RequestState? requestState,

    String? message,
    List<Episodes>? episodes,

    RequestState? episodeRequestState,

    String? episodeMessage,

  }) {
    return TvDetailState(
      tvDetail: tvDetail ?? this.tvDetail,
      requestState: requestState ?? this.requestState,
      message: message ?? this.message,


      episodeMessage: episodeMessage ?? this.episodeMessage,
      episodeRequestState: episodeRequestState ?? this.episodeRequestState,
      episodes: episodes ?? this.episodes,
    );
  }


  @override
  List<Object?> get props =>
      [
        tvDetail,
        requestState,
        message,
        episodes,
        episodeRequestState,
        episodeMessage,
      ];

}
