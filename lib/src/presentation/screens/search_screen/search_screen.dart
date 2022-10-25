import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/presentation/controller/search_bloc/search_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../widget/movie_data_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: SearchWidget(),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              children: [
                TextFormField(
                  controller: textEditingController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: "Search",
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  onFieldSubmitted: (text) {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<SearchBloc>()
                          .add(GetSearchMovieEvent(textEditingController.text));
                    }
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                if (state is SearchLoading) const LinearProgressIndicator(),
                if(state is SearchLoaded)
                  if(state.movie.isEmpty)
                    const Center(child: Text("Empty",style: TextStyle(color: Colors.white,fontSize: 25),)),
                if (state is SearchLoaded)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context,index) => MovieDataCard(movie: state.movie[index]),
                      separatorBuilder: (context,index) => const SizedBox(height: 10,),
                      itemCount: state.movie.length,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

