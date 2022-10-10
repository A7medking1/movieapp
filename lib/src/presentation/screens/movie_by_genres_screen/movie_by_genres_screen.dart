import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/presentation/controller/movie_by_genrec_bloc/movies_by_genres_bloc.dart';

import '../../../core/functions/navigator.dart';
import '../../../core/services/services_locator.dart';
import '../../widget/movie_data_card.dart';
import '../movie_detail_screen/movie_detail_screen.dart';

class MovieByGenresScreen extends StatelessWidget {
  final int genresId;
  final String genresName;

  const MovieByGenresScreen({Key? key, required this.genresId,required this.genresName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<MoviesByGenresBloc>()
        ..add(GetMoviesByGenresEvent(genresId)),
      child: BlocBuilder<MoviesByGenresBloc, MoviesByGenresState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(genresName),
            ),
            body: ListView.separated(
              itemBuilder: (context, index) {
                final movie = state.movie[index];

                return InkWell(
                  onTap: () =>
                      navigateTo(
                          context: context,
                          page: MovieDetailScreen(id: movie.id)),
                  child: MovieDataCard(movie: movie),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey.shade900,
                );
              },
              itemCount: state.movie.length,
            ),
          );
        },
      ),
    );
  }
}