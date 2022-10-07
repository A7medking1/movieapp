import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/presentation/controller/movie_bloc/movies_bloc.dart';
import 'package:movieapp/src/presentation/widget/see_more_widget.dart';

import '../../../core/services/services_locator.dart';
import '../../controller/movie_bloc/movies_event.dart';
import '../popular_movie_see_more.dart';
import 'component/now_playing_component.dart';
import 'component/popular_component.dart';
import 'component/top_rated_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NowPlayingComponent(),
              SeeMoreWidget(
                title: "Popular",
                page: PopularMovieSeeMore(),
              ),
              PopularComponent(),
              SeeMoreWidget(
                title: "Top Rated",
                page: PopularMovieSeeMore(),
              ),
              TopRatedComponent(),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
