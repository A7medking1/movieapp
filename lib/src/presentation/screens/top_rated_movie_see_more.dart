import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/presentation/controller/top_rated_pagination_bloc/top_rated_pagination_bloc.dart';
import 'package:movieapp/src/presentation/widget/custom_text.dart';

import '../../core/services/services_locator.dart';
import '../../domain/entity/movie.dart';
import '../controller/cubit/movie_pagination_cubit.dart';
import '../widget/loading_spankit.dart';
import '../widget/movie_data_card.dart';
import 'movie_detail_screen/movie_detail_screen.dart';

class TopRatedPaginationScreen extends StatelessWidget {
  const TopRatedPaginationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TopRatedPaginationBloc>()..add(GetTopRatedPaginationMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
        ),
        body: const TopRatedMoviesPagination(),
      ),
    );
  }
}
class TopRatedMoviesPagination extends StatefulWidget {
  const TopRatedMoviesPagination({Key? key}) : super(key: key);

  @override
  State<TopRatedMoviesPagination> createState() =>
      _TopRatedMoviesPagination();
}

class _TopRatedMoviesPagination
    extends State<TopRatedMoviesPagination> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedPaginationBloc, TopRatedPaginationState>(
      builder: (context, state) {
        print(context.read<TopRatedPaginationBloc>().page);
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index >= state.movie.length) return  customLoading;
            return InkWell(
              onTap: () => navigateTo(
                context: context,
                page: MovieDetailScreen(id: state.movie[index].id),
              ),
              child: MovieDataCard(
                movie: state.movie[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey.shade900,
            );
          },
          itemCount: state.movie.length + 1,
        );
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (maxScroll == currentScroll) {
      context.read<TopRatedPaginationBloc>().isLoading = true;
      context.read<TopRatedPaginationBloc>().page++;
      context
          .read<TopRatedPaginationBloc>()
          .add(GetTopRatedPaginationMoviesEvent());
    }
  }
}



