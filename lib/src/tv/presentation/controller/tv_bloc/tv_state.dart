part of 'tv_bloc.dart';

class TvState extends Equatable {
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

  final List<Tv> warTv;
  final RequestState warState;
  final String warMessage;

  /// airing today

  final List<Tv> animationTv;
  final RequestState animationTvState;
  final String animationTvMessage;

  /// trending

  final List<Tv> trendingTv;
  final RequestState trendingTvState;
  final String trendingTvMessage;

  TvState({
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
    this.warTv = const [],
    this.warState = RequestState.loading,
    this.warMessage = '',

    /// airing today

    this.animationTv = const [],
    this.animationTvState = RequestState.loading,
    this.animationTvMessage = '',

    /// trending

    this.trendingTv = const [],
    this.trendingTvState = RequestState.loading,
    this.trendingTvMessage = '',
  });

  TvState copyWith({
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
  }) {
    return TvState(
        popularTv: popularTv ?? this.popularTv,
        popularTvMessage: popularTvMessage ?? this.popularTvMessage,
        popularTvState: popularTvState ?? this.popularTvState,
        topRatedTv: topRatedTv ?? this.topRatedTv,
        topRatedTvMessage: topRatedTvMessage ?? this.topRatedTvMessage,
        topRatedTvState: topRatedTvState ?? this.topRatedTvState,
        latestTv: latestTv ?? this.latestTv,
        latestTvState: latestTvState ?? this.latestTvState,
        latestTvMessage: latestTvMessage ?? this.latestTvMessage,
        warTv: onAirTv ?? this.warTv,
        warMessage: onAirTvMessage ?? this.warMessage,
        warState: onAirTvState ?? this.warState,
        animationTv: airingTodayTv ?? this.animationTv,
        animationTvState: airingTodayTvState ?? this.animationTvState,
        animationTvMessage: airingTodayTvMessage ?? this.animationTvMessage,
        trendingTv: trendingTv ?? this.trendingTv,
        trendingTvMessage: trendingTvMessage ?? this.trendingTvMessage,
        trendingTvState: trendingTvState ?? this.trendingTvState);
  }

  @override
  List<Object> get props => [
        popularTv,
        popularTvState,
        popularTvMessage,
        topRatedTv,
        topRatedTvState,
        topRatedTvMessage,
        latestTv,
        latestTvState,
        latestTvMessage,
        warTv,
        warState,
        warMessage,
        animationTv,
        animationTvState,
        animationTvMessage,
        trendingTv,
        trendingTvState,
        trendingTvMessage,
      ];
}
