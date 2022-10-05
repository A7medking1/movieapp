import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/app_constance.dart';
import 'package:movieapp/src/presentation/widget/cached_image_widget.dart';
import 'package:movieapp/src/presentation/widget/custom_icon.dart';
import 'package:movieapp/src/presentation/widget/custom_text.dart';

import '../../domain/entity/movie.dart';
import '../controller/movie_cubit.dart';
import '../widget/loading_spankit.dart';
import 'movie_detail_screen/movie_detail_screen.dart';

class PopularMovieSeeMore extends StatefulWidget {
  const PopularMovieSeeMore({super.key});

  @override
  State<PopularMovieSeeMore> createState() => _PopularMovieSeeMoreState();
}

class _PopularMovieSeeMoreState extends State<PopularMovieSeeMore> {
  final scrollController = ScrollController();
  List<Movie> movie = [];
  bool isLoading = false;

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<MovieCubit>(context).loadMovies();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setupScrollController(context);
    BlocProvider.of<MovieCubit>(context).loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const CustomText(text: "Movie"),
        backgroundColor: Colors.grey.shade900,
      ),
      body: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
        if (state is MovieLoading && state.isFirstFetch) {
          return customLoading;
        }
        if (state is MovieLoading) {
          movie = state.oldMovie;
          isLoading = true;
        } else if (state is MovieLoaded) {
          movie = state.movie;
        }
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < movie.length) {
              return InkWell(
                onTap: () => navigateTo(
                    context: context,
                    page: MovieDetailScreen(id: movie[index].id)),
                child: _movie(movie[index], context),
              );
            } else {
              Timer(const Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              return customLoading;
            }
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey.shade900,
            );
          },
          itemCount: movie.length + (isLoading ? 1 : 0),
        );
      }),
    );
  }

  Widget _movie(Movie movie, BuildContext context) {
    return Card(
      elevation: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.grey.shade900,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: CachedImages(
              imageUrl: movie.backdropPath != null
                  ? "https://image.tmdb.org/t/p/w500${movie.backdropPath}"
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
                          text: movie.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                          text: movie.releaseDate.split('-')[0],
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
                            text: (movie.voteAverage).toStringAsFixed(1),
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      text: movie.overview,
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
    );
  }
}
