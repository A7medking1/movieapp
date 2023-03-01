import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/navigator.dart';
import '../../../../../core/utils/api_constance.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../movie/presentation/widget/cached_image_widget.dart';
import '../../../../domin/entitiy/tv.dart';
import '../../../controller/tv_detail_bloc/tv_detail_bloc.dart';
import '../tv_detail_screen.dart';

class SimilarTvsContent extends StatelessWidget {
  const SimilarTvsContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailBloc, TvDetailState>(
      builder: (context, state) {
        return TvCardGridView(
          tv: state.tvDetail!.similar,
        );
      },
    );
  }
}

class TvCardGridView extends StatelessWidget {


  final List<Tv> tv  ;
  const TvCardGridView({Key? key,required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            UniqueKey _key = UniqueKey();
            return InkWell(
              onTap: () {
                navigateTo(
                    context: context,
                    page: DetailTvScreen(
                      tvId: tv[index].id,
                      hero: _key,
                    ));
              },
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(4.0)),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Hero(
                        tag: _key,
                        child: CachedImages(
                          imageUrl: tv[index].poster_path != null
                              ? ApiConstance.imageUrl(tv[index].poster_path!)
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
                            (tv[index].voteAverage / 2)
                                .toStringAsFixed(1),
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
          childCount: tv.length,
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
