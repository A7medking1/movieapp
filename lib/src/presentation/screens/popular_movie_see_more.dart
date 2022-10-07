import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/presentation/widget/custom_text.dart';

import '../../domain/entity/movie.dart';
import '../controller/movie_cubit.dart';
import '../widget/loading_spankit.dart';
import '../widget/movie_data_card.dart';
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
                child:  MovieDataCard(movie: movie[index],),
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


}

