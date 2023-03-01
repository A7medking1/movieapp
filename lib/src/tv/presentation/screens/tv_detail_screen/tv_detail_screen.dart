import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/tv/presentation/controller/menu_cubit/menu_cubit.dart';
import 'package:movieapp/src/tv/presentation/controller/tv_detail_bloc/tv_detail_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/api_constance.dart';
import '../../../../core/utils/app_constance.dart';
import '../../../../core/utils/enums.dart';
import '../../../../movie/presentation/widget/cached_image_widget.dart';
import '../../../../movie/presentation/widget/custom_icon.dart';
import '../../../../movie/presentation/widget/custom_text.dart';
import '../../../../movie/presentation/widget/loading_spankit.dart';
import 'component/app_bar.dart..dart';
import 'component/credits_content.dart';
import 'component/icon.dart';
import 'component/info_tv.dart';
import 'component/similar_tv.dart';
import 'component/tab_bar.dart';

class DetailTvScreen extends StatelessWidget {
  final int tvId;
  final UniqueKey hero;

  const DetailTvScreen({Key? key, required this.tvId, required this.hero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MenuCubit()),
        BlocProvider(
            create: (context) => sl<TvDetailBloc>()
              ..add(GetTvDetailEvent(tvId))
              ..add(GetTvSeasonDetailEvent(tvId: tvId, seasonNumber: 1))),
      ],
      child: Scaffold(
        body: TvDetailContent(hero: hero),
      ),
    );
  }
}

class TvDetailContent extends StatefulWidget {
  final UniqueKey hero;

  const TvDetailContent({Key? key, required this.hero}) : super(key: key);

  @override
  State<TvDetailContent> createState() => _TvDetailContentState();
}

class _TvDetailContentState extends State<TvDetailContent> {
  @override
  void initState() {
    super.initState();
    context.read<MenuCubit>().currentMenu = MenuType.episodes;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailBloc, TvDetailState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const Center(
              child: customLoading,
            );
          case RequestState.loaded:
            return CustomScrollView(
              slivers: [
                CustomAppBar(
                  imagePath: state.tvDetail!.posterPath,
                  hero: widget.hero,
                ),
                InformationAboutTv(
                  state: state,
                ),
                BuildTvDetailIcons(),
                BuildCupertinoActionSheet(),
                MenuButton(),
                BlocBuilder<MenuCubit, MenuState>(
                  builder: (context, state) {
                    switch (MenuCubit.get(context).currentMenu) {
                      case MenuType.episodes:
                        return EpisodeSliverData();
                      case MenuType.moreLikeThis:
                        return SimilarTvsContent();
                      case MenuType.credits:
                        return CreditsContent();
                    }
                  },
                ),
              ],
            );

          case RequestState.error:
            return Center(child: Text(state.message));
        }
      },
    );
  }
}

class EpisodeSliverData extends StatelessWidget {
  const EpisodeSliverData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailBloc, TvDetailState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: state.episodes.length,
            (BuildContext context, int index) {
              final e = state.episodes[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Card(
                  elevation: 100,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.grey.shade900,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                        child: CachedImages(
                          imageUrl: e.stillPath != null
                              ? ApiConstance.imageUrl(e.stillPath!)
                              : AppConstance.errorImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      text: e.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomText(
                                text: '${e.airDate}',
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text:
                                    'S${e.season_number}   E${e.episodeNumber}',
                                color: Colors.grey[300],
                                fontSize: 17,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                  text: e.overview,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey[500]))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class BuildCupertinoActionSheet extends StatefulWidget {
  const BuildCupertinoActionSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<BuildCupertinoActionSheet> createState() =>
      _BuildCupertinoActionSheetState();
}

class _BuildCupertinoActionSheetState extends State<BuildCupertinoActionSheet> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<TvDetailBloc, TvDetailState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _buildShowCupertino(context, state);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, left: 10),
                  child: Row(
                    children: [
                      Text(
                        'Season ${context.read<TvDetailBloc>().currentSeason}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomIcon(
                        icon: Icons.keyboard_arrow_down_sharp,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<String?> _buildShowCupertino(
      BuildContext context, TvDetailState state) {
    return showCupertinoModalPopup<String>(
      context: context,
      builder: (_) {
        return CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          actions: state.tvDetail!.seasons
              .map(
                (e) => CupertinoActionSheetAction(
                  onPressed: () {
                    setState(() {
                      context
                          .read<TvDetailBloc>()
                          .changeSeasonNumber(e.season_number);
                      context.read<TvDetailBloc>()
                        ..add(GetTvSeasonDetailEvent(
                            tvId: state.tvDetail!.id,
                            seasonNumber: e.season_number));
                      Navigator.pop(context);
                      print(context.read<TvDetailBloc>().currentSeason);
                    });
                    print(e.id);
                  },
                  child: Text('Season ${e.season_number}'),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
