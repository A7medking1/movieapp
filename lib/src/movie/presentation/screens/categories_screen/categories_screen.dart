import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import '../../../../core/services/services_locator.dart';
import '../../controller/genres_bloc/genres_bloc.dart';
import '../../widget/custom_text.dart';
import '../../widget/loading_spankit.dart';
import '../movie_by_genres_screen/movie_by_genres_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresBloc, GenresState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const Center(
              child: customLoading,
            );
          case RequestState.loaded:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Categories"),
              ),
              body: GridView.builder(
                itemCount: state.genres.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final genres = state.genres[index];
                  return InkWell(
                    onTap: () {
                      navigateTo(
                          context: context,
                          page: MovieByGenresScreen(
                            genresId: genres.id, genresName: genres.name,));
                    },
                    child: Card(
                      child: Center(
                        child: CustomText(
                          text: genres.name,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 400,
              child: Text(state.message),
            );
        }
      },
    );
  }
}
