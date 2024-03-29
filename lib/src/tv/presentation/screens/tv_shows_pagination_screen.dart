import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/api_constance.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/presentation/widget/cached_image_widget.dart';
import 'package:movieapp/src/movie/presentation/widget/loading_spankit.dart';
import 'package:movieapp/src/tv/domin/entitiy/tv.dart';
import 'package:movieapp/src/tv/presentation/screens/tv_detail_screen/tv_detail_screen.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_constance.dart';
import '../controller/pagination_bloc/pagination_bloc.dart';

class TvShowsScreen extends StatelessWidget {
  final SeeMore seeMore;

  const TvShowsScreen({Key? key, required this.seeMore}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaginationBloc>()..add(GetTvPaginationEvent(seeMore)),
      child: Scaffold(
        body: TvsShowsContent(
          seeMore: seeMore,
        ),
      ),
    );
  }
}

class TvsShowsContent extends StatefulWidget {
  final SeeMore seeMore;

  const TvsShowsContent({Key? key, required this.seeMore}) : super(key: key);

  @override
  State<TvsShowsContent> createState() => _TvsShowsContentState();
}

class _TvsShowsContentState extends State<TvsShowsContent> {
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
            title: Text('${widget.seeMore.name} Tvs'),
            floating: true,
            //snap: true,
            //  pinned: true,
          ),
          BlocBuilder<PaginationBloc, PaginationState>(
            builder: (context, state) {
              //  print(sl<TvBloc>().page);
              return TvSliverGridViewDataPagination(
                list: state.tvPagination,
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
      context.read<PaginationBloc>().add(GetTvPaginationEvent(widget.seeMore));
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
                          imageUrl: list[index].poster_path != null
                              ? ApiConstance.imageUrl(list[index].poster_path!)
                              : AppConstance.errorImage,
                          fit: BoxFit.cover,
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
