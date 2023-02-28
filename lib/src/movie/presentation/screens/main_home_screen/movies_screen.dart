import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/presentation/screens/movie_shows_pagination_screen.dart';

import '../../widget/see_more_widget.dart';
import '../search_screen/search_screen.dart';
import 'component/now_playing_component.dart';
import 'component/popular_component.dart';
import 'component/top_rated_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SeeMore seeMore = SeeMore.popular;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App", style: GoogleFonts.lobster(fontSize: 25)),
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
          children:  [
            NowPlayingComponent(),
            SeeMoreWidget(
              title: "Popular",
              onPressed: (){
                seeMore = SeeMore.popular ;
                navigateTo(context: context, page: MovieShowsScreen(seeMore: seeMore)) ;
              },
            ),
            PopularComponent(),
            SeeMoreWidget(
              title: "Top Rated",
              onPressed: (){
                seeMore = SeeMore.topRated ;
                navigateTo(context: context, page: MovieShowsScreen(seeMore: seeMore)) ;
              },
            ),
            TopRatedComponent(),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
