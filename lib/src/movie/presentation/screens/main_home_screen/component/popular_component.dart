import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/movie/presentation/controller/movie_bloc/movies_event.dart';
import 'package:movieapp/src/movie/presentation/screens/main_home_screen/component/top_rated_component.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../tv/presentation/screens/Tv_shows/Tv_shows.dart';
import '../../../controller/movie_bloc/movies_bloc.dart';
import '../../../controller/movie_bloc/movies_state.dart';
import '../../../widget/loading_spankit.dart';

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
            return MoviesCardListView(movie: state.popularMovies);
          case RequestState.error:
            return CustomErrorWidget(
              message: state.popularMessage,
              onPressed: () => context.read<MoviesBloc>().add(GetPopularMoviesEvent()),
            );
        }
      },
    );
  }
}
