import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/navigator.dart';
import '../../../../core/services/services_locator.dart';
import '../../controller/movie_by_genrec_bloc/movies_by_genres_bloc.dart';
import '../../widget/loading_spankit.dart';
import '../../widget/movie_data_card.dart';
import '../movie_detail_screen/movie_detail_screen.dart';

class MovieByGenresScreen extends StatelessWidget {
  final int genresId;
  final String genresName;

  const MovieByGenresScreen(
      {Key? key, required this.genresId, required this.genresName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MoviesByGenresBloc>()..add(GetMoviesByGenresEvent(genresId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(genresName),
        ),
        body: MovieByGenres(
          genresName: genresName,
          genresId: genresId,
        ),
      ),
    );
  }
}

class MovieByGenres extends StatefulWidget {
  final int genresId;
  final String genresName;

  const MovieByGenres(
      {Key? key, required this.genresId, required this.genresName})
      : super(key: key);

  @override
  State<MovieByGenres> createState() => _MovieByGenresState();
}

class _MovieByGenresState extends State<MovieByGenres> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesByGenresBloc, MoviesByGenresState>(
      builder: (context, state) {
        //print(context.read<MoviesByGenresBloc>().page);
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index >= state.movie.length) return customLoading;
            final movie = state.movie[index];
            return InkWell(
              onTap: () => navigateTo(
                  context: context, page: MovieDetailScreen(id: movie.id,hero: UniqueKey())),
              child: MovieDataCard(movie: movie),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey.shade900,
            );
          },
          itemCount: state.movie.length + 1,
        );
      },
    );
  }

  void _onScroll() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (maxScroll == currentScroll) {
      context.read<MoviesByGenresBloc>().isLoading = true;
      context.read<MoviesByGenresBloc>().page++;
      context
          .read<MoviesByGenresBloc>()
          .add(GetMoviesByGenresEvent(widget.genresId));
    }
  }
}
