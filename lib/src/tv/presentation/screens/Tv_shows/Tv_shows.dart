import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/presentation/widget/custom_icon.dart';
import 'package:movieapp/src/movie/presentation/widget/custom_text.dart';
import 'package:movieapp/src/movie/presentation/widget/see_more_widget.dart';
import 'package:movieapp/src/tv/presentation/controller/tv_bloc/tv_bloc.dart';

import '../../../../core/utils/api_constance.dart';
import '../../../../movie/presentation/widget/cached_image_widget.dart';
import '../../../../movie/presentation/widget/loading_spankit.dart';
import '../../../domin/entitiy/tv.dart';
import '../tv_detail_screen/tv_detail_screen.dart';
import '../tv_shows_pagination_screen.dart';

class TvShows extends StatelessWidget {
  TvShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SeeMore seeMore = SeeMore.trending;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomText(
          text: 'TV SHOWS',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SeeMoreWidget(
              title: 'Trending',
              onPressed: () {
                seeMore = SeeMore.trending;
                navigateTo(
                    context: context, page: TvShowsScreen(seeMore: seeMore));
              },
            ),
            BlocBuilder<TvBloc, TvState>(
              buildWhen: (previous, current) =>
                  current.trendingTvState != previous.trendingTvState,
              builder: (context, state) {
                print(state.trendingTvState);
                switch (state.trendingTvState) {
                  case RequestState.loading:
                    return const SizedBox(
                      height: 170.0,
                      child: Center(
                        child: customLoading,
                      ),
                    );
                  case RequestState.loaded:
                    return TvCardHorizontal(
                      tvList: state.trendingTv,
                      //tagHeroWidget: state.trendingTv,
                    );
                  case RequestState.error:
                    return CustomErrorWidget(
                      message: state.trendingTvMessage,
                      onPressed: () => context.read<TvBloc>().add(GetTrendingTvEvent()),
                    );
                }
              },
            ),
            SeeMoreWidget(
              title: 'Popular',
              onPressed: () {
                seeMore = SeeMore.popular;
                navigateTo(
                    context: context, page: TvShowsScreen(seeMore: seeMore));
              },
            ),
            BlocBuilder<TvBloc, TvState>(
              buildWhen: (previous, current) =>
                  current.popularTvState != previous.popularTvState,
              builder: (context, state) {
                switch (state.popularTvState) {
                  case RequestState.loading:
                    return const SizedBox(
                      height: 170.0,
                      child: Center(
                        child: customLoading,
                      ),
                    );
                  case RequestState.loaded:
                    return TvCardHorizontal(
                      tvList: state.popularTv,
                    );
                  case RequestState.error:
                    return CustomErrorWidget(
                      message: state.popularTvMessage,
                      onPressed: () => context.read<TvBloc>().add(GetPopularTvEvent()),
                    );
                }
              },
            ),
            SeeMoreWidget(
              title: 'Top Rated',
              onPressed: () {
                seeMore = SeeMore.topRated;
                navigateTo(
                    context: context, page: TvShowsScreen(seeMore: seeMore));
              },
            ),
            BlocBuilder<TvBloc, TvState>(
              buildWhen: (previous, current) =>
                  current.topRatedTvState != previous.topRatedTvState,
              builder: (context, state) {
                switch (state.topRatedTvState) {
                  case RequestState.loading:
                    return const SizedBox(
                      height: 170.0,
                      child: Center(
                        child: customLoading,
                      ),
                    );
                  case RequestState.loaded:
                    return TvCardHorizontal(
                      tvList: state.topRatedTv,
                    );
                  case RequestState.error:
                    return CustomErrorWidget(
                        message: state.topRatedTvMessage,
                        onPressed: () => context.read<TvBloc>().add(GetTopRatedTvEvent()),
                );
                }
              },
            ),
            SeeMoreWidget(
              title: 'War', // on the air,
              onPressed: () {
                seeMore = SeeMore.war;
                navigateTo(
                    context: context, page: TvShowsScreen(seeMore: seeMore));
              },
            ),
            BlocBuilder<TvBloc, TvState>(
              buildWhen: (previous, current) =>
                  current.warState != previous.warState,
              builder: (context, state) {
                switch (state.warState) {
                  case RequestState.loading:
                    return const SizedBox(
                      height: 170.0,
                      child: Center(
                        child: customLoading,
                      ),
                    );
                  case RequestState.loaded:
                    return TvCardHorizontal(
                      tvList: state.warTv,
                    );
                  case RequestState.error:
                    return CustomErrorWidget(
                      message: state.warMessage,
                      onPressed: () => context.read<TvBloc>().add(GetWarTvEvent()),
                    );
                }
              },
            ),
            SeeMoreWidget(
              title: 'Animation', //'Airing Today Tvs',
              onPressed: () {
                seeMore = SeeMore.animation;
                navigateTo(
                    context: context, page: TvShowsScreen(seeMore: seeMore));
              },
            ),
            BlocBuilder<TvBloc, TvState>(
              buildWhen: (previous, current) =>
                  current.animationTvState != previous.animationTvState,
              builder: (context, state) {
                switch (state.animationTvState) {
                  case RequestState.loading:
                    return const SizedBox(
                      height: 170.0,
                      child: Center(
                        child: customLoading,
                      ),
                    );
                  case RequestState.loaded:
                    return TvCardHorizontal(
                      tvList: state.animationTv,
                    );
                  case RequestState.error:
                   return CustomErrorWidget(
                      message: state.animationTvMessage,
                      onPressed: () => context.read<TvBloc>().add(GetAnimationTvEvent()),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String message;

  final void Function()? onPressed;

  const CustomErrorWidget({
    Key? key,
    required this.onPressed,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(
              onPressed: onPressed,
              icon: CustomIcon(
                icon: Icons.refresh_outlined,
                size: 40,
              ))
        ],
      ),
    );
  }
}

class TvCardHorizontal extends StatelessWidget {
  final List<Tv> tvList;

  const TvCardHorizontal({
    Key? key,
    required this.tvList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          current.popularTvState != previous.popularTvState,
      builder: (context, state) {
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: tvList.length,
              itemBuilder: (context, index) {
                UniqueKey _key = UniqueKey();
                return Hero(
                  tag: _key,
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        navigateTo(
                            context: context,
                            page: DetailTvScreen(
                              tvId: tvList[index].id,
                              hero: _key,
                            ));
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedImages(
                          imageUrl:
                              ApiConstance.imageUrl(tvList[index].poster_path!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, state) => SizedBox(
                width: 5,
              ),
            ),
          ),
        );
      },
    );
  }
}
