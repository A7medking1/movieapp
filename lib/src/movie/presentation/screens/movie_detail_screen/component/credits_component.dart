import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/app_constance.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/api_constance.dart';
import '../../../controller/movie_detail_bloc/movie_detail_bloc.dart';
import '../../../widget/cached_image_widget.dart';
import '../../../widget/custom_text.dart';
import '../../credit_movies_screen/credit_movies_screen.dart';

class CreditsComponent extends StatelessWidget {
  const CreditsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const VerticalDivider(
                  color: Colors.transparent,
                  width: 5,
                ),
                itemCount: state.movieDetail!.credits.length,
                itemBuilder: (context, index) {
                  final credit = state.movieDetail!.credits[index];
                  return InkWell(
                    onTap: () {
                      navigateTo(
                          context: context,
                          page: CreditInfoScreen(
                            personId: credit.id,
                          ));
                    },
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          elevation: 3,
                          child: FadeInUp(
                            from: 20,
                            duration: const Duration(milliseconds: 500),
                            child: ClipRRect(
                                child: CachedImages(
                              width: 100,
                              imageUrl: credit.profilePath != null
                                  ? ApiConstance.imageUrl(credit.profilePath!)
                                  : AppConstance.errorImage,
                              imageBuilder: (context, imageBuilder) {
                                return Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(80)),
                                    image: DecorationImage(
                                      image: imageBuilder,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                        Center(
                          child: CustomText(
                            text: credit.originalName,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
