import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/navigator.dart';
import '../../../../../core/utils/api_constance.dart';
import '../../../../../core/utils/enums.dart';

import '../../../controller/movie_bloc/movies_bloc.dart';
import '../../../controller/movie_bloc/movies_state.dart';
import '../../../widget/cached_image_widget.dart';
import '../../../widget/loading_spankit.dart';
import '../../movie_detail_screen/movie_detail_screen.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: customLoading,
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () => navigateTo(
                          context: context,
                          page: MovieDetailScreen(
                            id: movie.id,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedImages(
                            imageUrl:
                                ApiConstance.imageUrl(movie.backdropPath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170,
              child: Text(state.nowPlayingMessage),
            );
        }
      },
    );
  }
}
