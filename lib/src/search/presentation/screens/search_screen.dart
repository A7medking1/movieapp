import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/services/services_locator.dart';
import 'package:movieapp/src/core/utils/api_constance.dart';
import 'package:movieapp/src/core/utils/app_constance.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/presentation/widget/cached_image_widget.dart';
import 'package:movieapp/src/movie/presentation/widget/custom_icon.dart';
import 'package:movieapp/src/search/domain/entity/search.dart';
import 'package:movieapp/src/search/presentation/controller/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
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
    return Container(
      //       color: Colors.white,
      child: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 20),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  switch (state.status) {
                    case SearchRequestState.empty:
                      return Container(
                        width: 100,
                        height: 100,
                        child: Text(state.status.name),
                      );
                    case SearchRequestState.loading:
                      return Container(
                        width: 100,
                        height: 100,
                        child: Text(state.status.name),
                      );
                    case SearchRequestState.loaded:
                      return Expanded(
                          child: SearchCardGridView(search: state.search));
                    case SearchRequestState.error:
                      return Container(
                        width: 100,
                        height: 100,
                        child: Text(state.status.name),
                      );
                    case SearchRequestState.noResults:
                      return Container(
                        width: 100,
                        height: 100,
                        child: Text(state.status.name),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final bloc = context.read<SearchBloc>();
        return Column(
          children: [
            TextFormField(
              controller: bloc.textEditingController,
              onChanged: (String query) {
                bloc.add(
                    GetSearchEvent(query: query, searchType: SearchType.movie));
              },
              decoration: InputDecoration(
                focusColor: Colors.red,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )),
                labelText: "Search",
                prefixIcon: const CustomIcon(
                  icon: Icons.search,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  onPressed: () => bloc.textEditingController.text = "",
                  icon: const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: CustomIcon(
                      icon: Icons.delete,
                    ),
                  ),
                ),
              ),
            ),
            if (bloc.state.status == SearchRequestState.loading) ...[
              SizedBox(
                height: 10,
              ),
              LinearProgressIndicator(),
            ],
          ],
        );
      },
    );
  }
}

class SearchCardGridView extends StatelessWidget {
  final List<Search> search;

  const SearchCardGridView({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: search.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

          },
          child: FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  CachedImages(
                    imageUrl: search[index].poster_path != null
                        ? ApiConstance.imageUrl(search[index].poster_path!)
                        : AppConstance.errorImage,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsetsDirectional.all(2),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        (search[index].vote_average / 2).toStringAsFixed(1),
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}
