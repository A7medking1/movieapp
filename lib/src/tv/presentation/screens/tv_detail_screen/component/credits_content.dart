import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/navigator.dart';
import '../../../../../core/utils/api_constance.dart';
import '../../../../../core/utils/app_constance.dart';
import '../../../../../movie/presentation/screens/credit_movies_screen/credit_movies_screen.dart';
import '../../../../../movie/presentation/widget/cached_image_widget.dart';
import '../../../controller/tv_detail_bloc/tv_detail_bloc.dart';

class CreditsContent extends StatelessWidget {
  const CreditsContent({
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
                final credits = state.tvDetail!.credits[index];
                return InkWell(
                  onTap: () {
                    navigateTo(
                        context: context,
                        page: CreditInfoScreen(personId: credits.id));
                  },
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4.0)),
                      child: CachedImages(
                        imageUrl: credits.profilePath != null
                            ? ApiConstance.imageUrl(credits.profilePath!)
                            : AppConstance.errorImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              childCount: state.tvDetail!.credits.length,
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


