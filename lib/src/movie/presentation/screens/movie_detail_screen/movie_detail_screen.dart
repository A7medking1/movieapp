import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/api_constance.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entity/genres.dart';

import '../../controller/movie_detail_bloc/movie_detail_bloc.dart';
import '../../widget/cached_image_widget.dart';
import '../../widget/custom_icon.dart';
import '../../widget/custom_text.dart';
import '../../widget/loading_spankit.dart';
import 'component/credits_component.dart';
import 'component/similar_movie_component.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;
  final UniqueKey hero ;

  const MovieDetailScreen({Key? key, required this.id, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('id movie = $id');
    return BlocProvider(
      create: (context) => sl<MovieDetailBloc>()
        ..add(GetMovieDetailEvent(id)),
      child:  Scaffold(
        body: MovieDetailContent(hero: hero,),
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {

  final UniqueKey hero ;
  const MovieDetailContent({
    Key? key,
    required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        switch (state.movieDetailRequestState) {
          case RequestState.loading:
            return const Center(
              child: customLoading,
            );
          case RequestState.loaded:
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: Hero(
                          tag: hero,
                          child: CachedImages(
                            imageUrl: ApiConstance.imageUrl(
                                state.movieDetail!.posterPath),
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: state.movieDetail!.title,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: CustomText(
                                  text: state.movieDetail!.releaseDate
                                      .split('-')[0],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const CustomIcon(
                                    icon: Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  CustomText(
                                    text: (state.movieDetail!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                              CustomText(
                                text: _showDuration(state.movieDetail!.runtime),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          CustomText(
                            text: state.movieDetail!.overview,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                          const SizedBox(height: 8.0),
                          CustomText(
                            text:
                                'Genres: ${_showGenres(state.movieDetail!.genres)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: CustomText(
                        text: 'credits'.toUpperCase(),
                        letterSpacing: 1.2,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const CreditsComponent(),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: CustomText(
                        text: 'More like this'.toUpperCase(),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                const SimilarMovie(),
              ],
            );
          case RequestState.error:
            return Center(child: Text(state.movieDetailMessage));
        }
      },
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }
    if (result.isEmpty) {
      return result;
    }
    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
