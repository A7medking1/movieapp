import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/presentation/controller/movie_bloc/movies_bloc.dart';
import 'package:movieapp/src/presentation/screens/search_screen/search_screen.dart';
import 'package:movieapp/src/presentation/screens/top_rated_movie_see_more.dart';
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
    print("xxxxxx");
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movie App",style: GoogleFonts.lobster(
            fontSize: 25
          )),
         actions: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: IconButton(
               onPressed: () {
                navigateTo(context: context, page: const SearchScreen());
               },
               icon: const Icon(
                 Icons.search,
               ),
             ),
           ),
         ],
        ),
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NowPlayingComponent(),
              SeeMoreWidget(
                title: "Popular",
                page: PopularMoviesPaginationScreen(),
              ),
              PopularComponent(),
              SeeMoreWidget(
                title: "Top Rated",
                page: TopRatedPaginationScreen(),
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
