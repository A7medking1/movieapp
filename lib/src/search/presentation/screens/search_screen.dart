import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/services/services_locator.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/search/presentation/controller/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<SearchBloc>()
        ..add(GetSearchEvent(query: 'flash', searchType: SearchType.movie)),
      child: Scaffold(
        body: SearchScreenContent(),
      ),
    );
  }
}


class SearchScreenContent extends StatelessWidget {
  const SearchScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}
