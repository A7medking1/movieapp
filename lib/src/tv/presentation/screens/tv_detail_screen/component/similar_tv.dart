import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/navigator.dart';
import '../../../../../core/utils/api_constance.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../movie/presentation/widget/cached_image_widget.dart';
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
        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final similar = state.tvDetail!.similar[index];
                UniqueKey _key = UniqueKey();
                return InkWell(
                  onTap: () {
                    navigateTo(
                        context: context,
                        page: DetailTvScreen(
                          tvId: similar.id,
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
                              imageUrl: similar.poster_path != null
                                  ? ApiConstance.imageUrl(similar.poster_path!)
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
                                (state.tvDetail!.similar[index].voteAverage / 2)
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
              childCount: state.tvDetail!.similar.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          ),
        );
      },
    );
  }
}
