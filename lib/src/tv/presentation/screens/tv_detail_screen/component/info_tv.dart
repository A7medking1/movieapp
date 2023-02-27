import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../movie/presentation/widget/custom_icon.dart';
import '../../../../../movie/presentation/widget/custom_text.dart';
import '../../../controller/tv_detail_bloc/tv_detail_bloc.dart';
import '../../../widget/desc_text_widget.dart';

class InformationAboutTv extends StatelessWidget {
  final TvDetailState state;

  const InformationAboutTv({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInUp(
        from: 20,
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: state.tvDetail!.name,
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                        text: '${state.tvDetail!.number_of_seasons} Seasons'),
                    CustomText(
                        text: '${state.tvDetail!.number_of_episodes} Episode'),
                    Row(
                      children: [
                        const CustomIcon(
                          icon: Icons.star,
                          color: Colors.amber,
                          size: 20.0,
                        ),
                        const SizedBox(width: 4.0),
                        CustomText(
                          text: (state.tvDetail!.voteAverage / 2)
                              .toStringAsFixed(1),
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              DescriptionTextWidget(text: state.tvDetail!.overview),
              /* CustomText(
                text: state.tvDetail!.overview,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2,
              ),*/
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
