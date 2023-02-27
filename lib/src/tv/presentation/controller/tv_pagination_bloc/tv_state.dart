part of 'tv_bloc.dart';

class TvPaginationState extends Equatable {

  /// popular
   final List<Tv> popularTv;
  final RequestState popularTvState;
  final String popularTvMessage;

  /// top rated
  final List<Tv> topRatedTv;
  final RequestState topRatedTvState;
  final String topRatedTvMessage;

  /// latest
  final List<Tv> latestTv;
  final RequestState latestTvState;
  final String latestTvMessage;


  /// on air

  final List<Tv> onAirTv;
  final RequestState onAirTvState;
  final String onAirTvMessage;


  /// airing today

  final List<Tv> airingTodayTv;
  final RequestState airingTodayTvState;
  final String airingTodayTvMessage;

  /// trending

  final List<Tv> trendingTv;
  final RequestState trendingTvState;
  final String trendingTvMessage;


   final List<Tv> pagination;


  TvPaginationState({
    /// popular
    this.popularTv = const [],
    this.popularTvState = RequestState.loading,
    this.popularTvMessage = '',

    /// top rated
    this.topRatedTv = const [],
    this.topRatedTvState = RequestState.loading,
    this.topRatedTvMessage = '',

    /// latest

    this.latestTv = const [],
    this.latestTvState = RequestState.loading,
    this.latestTvMessage = '',

    /// on air
    this.onAirTv = const [],
    this.onAirTvState = RequestState.loading,
    this.onAirTvMessage = '',

    /// airing today

    this.airingTodayTv = const [],
    this.airingTodayTvState = RequestState.loading,
    this.airingTodayTvMessage = '',

    /// trending

    this.trendingTv = const [],
    this.trendingTvState = RequestState.loading,
    this.trendingTvMessage = '',

    this.pagination = const [],

  });


  TvPaginationState copyWith({
    List<Tv>? popularTv,
    RequestState? popularTvState,
    String? popularTvMessage,

    List<Tv>? topRatedTv,
    RequestState? topRatedTvState,
    String? topRatedTvMessage,

    List<Tv>? latestTv,
    RequestState? latestTvState,
    String? latestTvMessage,

    List<Tv>? onAirTv,
    RequestState? onAirTvState,
    String? onAirTvMessage,


    List<Tv>? airingTodayTv,
    RequestState? airingTodayTvState,
    String? airingTodayTvMessage,

    List<Tv>? trendingTv,
    RequestState? trendingTvState,
    String? trendingTvMessage,

    List<Tv>? pagination,

  }) {
    return TvPaginationState(

      pagination: pagination ?? this.pagination,

        popularTv: popularTv ?? this.popularTv,
        popularTvMessage: popularTvMessage ?? this.popularTvMessage,
        popularTvState: popularTvState ?? this.popularTvState,
        topRatedTv: topRatedTv ?? this.topRatedTv,
        topRatedTvMessage: topRatedTvMessage ?? this.topRatedTvMessage,
        topRatedTvState: topRatedTvState ?? this.topRatedTvState,

        latestTv: latestTv ?? this.latestTv,
        latestTvState: latestTvState ?? this.latestTvState,
        latestTvMessage: latestTvMessage ?? this.latestTvMessage,

        onAirTv: onAirTv ?? this.onAirTv,
        onAirTvMessage: onAirTvMessage ?? this.onAirTvMessage,
        onAirTvState: onAirTvState ?? this.onAirTvState,

        airingTodayTv: airingTodayTv ?? this.airingTodayTv,
        airingTodayTvState: airingTodayTvState ?? this.airingTodayTvState,
        airingTodayTvMessage: airingTodayTvMessage ?? this.airingTodayTvMessage,

        trendingTv: trendingTv ?? this.trendingTv,
        trendingTvMessage: trendingTvMessage ?? this.trendingTvMessage,
        trendingTvState: trendingTvState ?? this.trendingTvState,


    );
  }

  @override
  List<Object> get props =>
      [
        popularTv,
        popularTvState,
        popularTvMessage,
        topRatedTv,
        topRatedTvState,
        topRatedTvMessage,
        latestTv,
        latestTvState,
        latestTvMessage,
        onAirTv,
        onAirTvState,
        pagination,
        onAirTvMessage,
        airingTodayTv,
        airingTodayTvState,
        airingTodayTvMessage,
        trendingTv,
        trendingTvState,
        trendingTvMessage,
      ];
}
