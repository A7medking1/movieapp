import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/api_constance.dart';
import 'package:movieapp/src/domain/entity/credits.dart';
import 'package:movieapp/src/presentation/controller/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movieapp/src/presentation/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:movieapp/src/presentation/widget/cached_image_widget.dart';
import 'package:movieapp/src/presentation/widget/custom_text.dart';
import 'package:movieapp/src/presentation/widget/movie_data_card.dart';

import '../../core/services/services_locator.dart';
import '../../core/utils/app_constance.dart';

class CreditMoviesScreen extends StatelessWidget {
  final Credits credits;

  const CreditMoviesScreen({Key? key, required this.credits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailBloc>()..add(GetCreditMovies(credits.id)),
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 270.0,
                  stretch: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: Stack(
                        children: [
                          CachedImages(
                            imageUrl: credits.profilePath != null
                                ? ApiConstance.imageUrl(credits.profilePath!)
                                : AppConstance.errorImage,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 10),
                              child:
                                  Container(color: Colors.black.withOpacity(0)),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    const CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 65,
                                    ),
                                    CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        credits.profilePath != null
                                            ? ApiConstance.imageUrl(
                                                credits.profilePath!)
                                            : AppConstance.errorImage,
                                      ),
                                      radius: 60,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomText(
                                  text: credits.originalName,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: CustomText(
                        text: 'credit Movies'.toUpperCase(),
                        letterSpacing: 1.2,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            navigateTo(context: context, page: MovieDetailScreen(id: state.creditMovies[index].id));
                          },
                          child: MovieDataCard(
                            movie: state.creditMovies[index],
                          ),
                        );
                      },
                      childCount: state.creditMovies.length, // 1000 list items
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
