import 'package:animate_do/animate_do.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/utils/enums.dart';
import 'package:movieapp/src/movie/domain/entity/search.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/api_constance.dart';
import '../../../../core/utils/app_constance.dart';
import '../../controller/search_bloc/search_bloc.dart';
import '../../widget/cached_image_widget.dart';
import '../../widget/custom_icon.dart';

class MenuModel extends Equatable {
  final SearchType searchType;

  final String title;

  const MenuModel({required this.searchType, required this.title});

  @override
  List<Object> get props => [searchType, title];
}

List<MenuModel> items = [
  MenuModel(
    searchType: SearchType.tv,
    title: 'tv',
  ),
  MenuModel(
    searchType: SearchType.movie,
    title: 'movie',
  ),
  MenuModel(
    searchType: SearchType.person,
    title: 'person',
  ),
  MenuModel(
    searchType: SearchType.multi,
    title: 'multi',
  ),
];

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>(),
      child: Scaffold(
        body: SearchWidget(),
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late final TextEditingController textEditingController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    menuModel = MenuModel(searchType: SearchType.movie, title: 'movie');
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  MenuModel? menuModel;

  List<MenuModel> items = [
    MenuModel(
      searchType: SearchType.tv,
      title: 'tv',
    ),
    MenuModel(
      searchType: SearchType.movie,
      title: 'movie',
    ),
    MenuModel(
      searchType: SearchType.person,
      title: 'person',
    ),
    MenuModel(
      searchType: SearchType.multi,
      title: 'multi',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        print('xx');
        // SearchType searchType = SearchType.person;
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(),
              SliverPadding(
                padding: EdgeInsetsDirectional.only(
                  top: 20,
                  start: 10,
                  end: 10,
                ),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textEditingController,
                          onChanged: (String query) {
                            print(menuModel!.searchType.name);
                            context.read<SearchBloc>().add(GetSearchMovieEvent(
                                query: query,
                                searchType: menuModel!.searchType));
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            labelText: "Search",
                            prefixIcon: const CustomIcon(
                              icon: Icons.search,
                              color: Colors.white,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => textEditingController.text = "",
                              icon: const Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: CustomIcon(
                                  icon: Icons.delete,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                          value: menuModel,
                          items: items
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.title)))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              menuModel = newValue;
                              //   searchType = newValue.
                            });
                          })
                    ],
                  ),
                ),
              ),
              if (state is SearchLoading)
                SliverPadding(
                  padding: EdgeInsetsDirectional.only(
                      start: 15, end: 15, top: 15, bottom: 15),
                  sliver: SliverToBoxAdapter(
                    child: LinearProgressIndicator(),
                  ),
                ),
              if (state is SearchLoaded)
                SearchCardGridView(search: state.search),
            ],
          ),
        );
      },
    );
  }
}

/*Form(
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
                    suffixIcon: IconButton(
                      onPressed: () => textEditingController.text = "",
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: CustomIcon(
                          icon: Icons.delete,
                        ),
                      ),
                    ),
                    prefixIcon: const CustomIcon(
                      icon: Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (text) {
                    //print(text);
                    context.read<SearchBloc>().add(GetSearchMovieEvent(
                        query: text, searchType: searchType));
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
                if (state is SearchLoaded) ...[
                  if (state.search.isEmpty)
                    const Center(
                        child: CustomText(
                      text: "Empty",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                ]
              ],
            ),
          ),
        );*/

class SearchCardGridView extends StatelessWidget {
  final List<Search> search;

  const SearchCardGridView({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 24.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return InkWell(
              onTap: () {},
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
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
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(20))),
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
          childCount: search.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.7,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}
