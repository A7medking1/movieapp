import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';

import '../../../core/services/services_locator.dart';
import '../controller/popular_pagination_bloc/popular_pagination_bloc.dart';
import '../widget/loading_spankit.dart';
import '../widget/movie_data_card.dart';
import 'movie_detail_screen/movie_detail_screen.dart';


class PopularMoviesPaginationScreen extends StatelessWidget {
  const PopularMoviesPaginationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PopularPaginationBloc>()..add(GetPopularPaginationMoviesEvent()),
      child: Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
      ),
      body: const PopularMoviesPagination(),
    ),
);
  }
}



class PopularMoviesPagination extends StatefulWidget {
  const PopularMoviesPagination({Key? key}) : super(key: key);

  @override
  State<PopularMoviesPagination> createState() =>
      _PopularMoviesPagination();
}

class _PopularMoviesPagination
    extends State<PopularMoviesPagination> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularPaginationBloc, PopularPaginationState>(
      builder: (context, state) {
        print(context.read<PopularPaginationBloc>().page);
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
      context.read<PopularPaginationBloc>().isLoading = true;
      context.read<PopularPaginationBloc>().page++;
      context
          .read<PopularPaginationBloc>()
          .add(GetPopularPaginationMoviesEvent());
    }
  }
}

