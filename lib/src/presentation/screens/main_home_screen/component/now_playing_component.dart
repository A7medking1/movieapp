import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/presentation/controller/movie_bloc/movies_bloc.dart';
import 'package:movieapp/src/presentation/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:movieapp/src/presentation/widget/cached_image_widget.dart';
import 'package:movieapp/src/presentation/widget/custom_icon.dart';
import 'package:movieapp/src/presentation/widget/custom_text.dart';

import '../../../../core/functions/navigator.dart';
import '../../../../core/utils/api_constance.dart';
import '../../../../core/utils/enums.dart';
import '../../../controller/movie_bloc/movies_state.dart';
import '../../../widget/loading_spankit.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return const SizedBox(
              height: 400.0,
              child: Center(
                child: customLoading,
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () => navigateTo(
                        context: context,
                        page: MovieDetailScreen(
                          id: item.id,
                        ),
                      ),
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedImages(
                              width: double.infinity,
                              imageUrl:
                                  ApiConstance.imageUrl(item.backdropPath!),
                              fit: BoxFit.cover,
                              height: 560.0,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomIcon(
                                        icon: Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      CustomText(
                                        text: 'Now Playing'.toUpperCase(),
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: CustomText(
                                    text: item.title,
                                    textAlign: TextAlign.center,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Text(state.nowPlayingMessage),
            );
        }
      },
    );
  }
}
