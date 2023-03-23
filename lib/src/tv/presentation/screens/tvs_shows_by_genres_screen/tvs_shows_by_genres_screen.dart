import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/tv/presentation/controller/tv_shows_by_genres_bloc/tv_shows_by_genres_bloc.dart';

import '../../../../core/functions/navigator.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/api_constance.dart';
import '../../../../movie/presentation/widget/cached_image_widget.dart';
import '../../../../movie/presentation/widget/loading_spankit.dart';
import '../../../domin/entitiy/tv.dart';
import '../tv_detail_screen/tv_detail_screen.dart';

class TvShowsByGenresScreen extends StatelessWidget {
  final int genresId;

  const TvShowsByGenresScreen({Key? key, required this.genresId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TvShowsByGenresBloc>()..add(GetTvShowsByGenresEvent(genresId)),
      child: Scaffold(
        body: TvShowsByGenresContent(
          genresId: genresId,
        ),
      ),
    );
  }
}

class TvShowsByGenresContent extends StatefulWidget {
  final int genresId;

  const TvShowsByGenresContent({Key? key, required this.genresId})
      : super(key: key);

  @override
  State<TvShowsByGenresContent> createState() => _TvShowsByGenresContentState();
}

class _TvShowsByGenresContentState extends State<TvShowsByGenresContent> {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowsByGenresBloc, TvShowsByGenresState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar(
              floating: true,
              //snap: true,
              //  pinned: true,
            ),
            TvSliverGridViewDataPagination(
              list: state.tv,
            ),
          ],
        );
      },
    );
  }

  void _onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;

    if (maxScroll == currentScroll) {
      context.read<TvShowsByGenresBloc>().page++;
      context
          .read<TvShowsByGenresBloc>()
          .add(GetTvShowsByGenresEvent(widget.genresId));
    }
  }
}

class TvSliverGridViewDataPagination extends StatelessWidget {
  final List<Tv> list;

  const TvSliverGridViewDataPagination({Key? key, required this.list})
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
                    page: DetailTvScreen(
                      tvId: list[index].id,
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
                            list[index].poster_path!,
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
