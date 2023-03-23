import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/movie/presentation/widget/custom_text.dart';
import 'package:movieapp/src/tv/presentation/controller/genres_bloc/genres_bloc.dart';
import 'package:movieapp/src/tv/presentation/screens/tvs_shows_by_genres_screen/tvs_shows_by_genres_screen.dart';

import '../../../../core/utils/enums.dart';
import '../../../../movie/presentation/widget/loading_spankit.dart';
import '../Tv_shows/Tv_shows.dart';

class TvGenresScreen extends StatelessWidget {
  const TvGenresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TvGenresContent(),
    );
  }
}

class TvGenresContent extends StatelessWidget {
  const TvGenresContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvGenresBloc, TvGenresState>(builder: (context, state) {
      switch (state.requestState) {
        case RequestState.loading:
          return const SizedBox(
            height: 170.0,
            child: Center(
              child: customLoading,
            ),
          );
        case RequestState.loaded:
          return ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                navigateTo(context: context, page: TvShowsByGenresScreen(genresId: state.genres[index].id));
              },
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 10, top: 20, end: 10, bottom: 10),
                child: CustomText(
                  text: state.genres[index].name,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              height: 20,
            ),
            itemCount: state.genres.length,
          );
        case RequestState.error:
          return CustomErrorWidget(
            message: state.message,
            onPressed: () =>
                context.read<TvGenresBloc>().add(GetTvGenresEvent()),
          );
      }
    });
  }
}
