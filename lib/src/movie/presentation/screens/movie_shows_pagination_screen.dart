import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/api_constance.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/domain/entity/movie.dart';
import 'package:movieapp/src/movie/presentation/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:movieapp/src/movie/presentation/widget/cached_image_widget.dart';
import 'package:movieapp/src/movie/presentation/widget/loading_spankit.dart';

import '../../../core/services/services_locator.dart';
import '../../../tv/presentation/controller/pagination_bloc/pagination_bloc.dart';

class MovieShowsScreen extends StatelessWidget {
  final SeeMore seeMore;

  const MovieShowsScreen({Key? key, required this.seeMore}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PaginationBloc>()..add(GetMoviePaginationEvent(seeMore)),
      child: Scaffold(
        body: MovieShowsContent(
          seeMore: seeMore,
        ),
      ),
    );
  }
}

class MovieShowsContent extends StatefulWidget {
  final SeeMore seeMore;

  const MovieShowsContent({Key? key, required this.seeMore}) : super(key: key);

  @override
  State<MovieShowsContent> createState() => _MovieShowsContentState();
}

class _MovieShowsContentState extends State<MovieShowsContent> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => _onScroll());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            title: Text('${widget.seeMore.name} movies'),
            floating: true,
            //snap: true,
            //  pinned: true,
          ),
          BlocBuilder<PaginationBloc, PaginationState>(
            builder: (context, state) {
              return MovieSliverGridViewDataPagination(
                list: state.moviePagination,
              );
            },
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (maxScroll == currentScroll) {
      context.read<PaginationBloc>().page++;
      context
          .read<PaginationBloc>()
          .add(GetMoviePaginationEvent(widget.seeMore));
    }
  }
}

class MovieSliverGridViewDataPagination extends StatelessWidget {
  final List<Movie> list;

  const MovieSliverGridViewDataPagination({Key? key, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsDirectional.only(top: 10, end: 10, start: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            UniqueKey _key = UniqueKey();
            if (index >= list.length) return customLoading;
            return InkWell(
              onTap: () {
                navigateTo(
                    context: context,
                    page: MovieDetailScreen(
                      id: list[index].id,
                      hero: _key,
                    ));
              },
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Hero(
                  tag: _key,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: CachedImages(
                          imageUrl: ApiConstance.imageUrl(
                            list[index].backdropPath!,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsetsDirectional.all(2),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(20))),
                        child: Center(
                          child: Text(
                            (list[index].voteAverage / 2).toStringAsFixed(1),
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: list.length + 1,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
