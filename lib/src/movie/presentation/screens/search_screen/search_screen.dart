import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/functions/navigator.dart';

import '../../../../core/services/services_locator.dart';
import '../../controller/search_bloc/search_bloc.dart';
import '../../widget/custom_icon.dart';
import '../../widget/custom_text.dart';
import '../../widget/movie_data_card.dart';
import '../movie_detail_screen/movie_detail_screen.dart';

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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
  }

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
                    context.read<SearchBloc>().add(GetSearchMovieEvent(text));
                  },
                  /*onFieldSubmitted: (text) {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<SearchBloc>()
                          .add(GetSearchMovieEvent(textEditingController.text));
                    }
                  },*/
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
              /*  if (textEditingController.text == '')
                  Container(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/search.png'),
                  ),*/
                if (state is SearchLoading) const LinearProgressIndicator(),
                if (state is SearchLoaded)
                  if (state.movie.isEmpty)
                    const Center(
                        child: CustomText(
                      text: "Empty",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                if (state is SearchLoaded)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => navigateTo(
                            context: context,
                            page: MovieDetailScreen(id: state.movie[index].id, hero: UniqueKey(),),),
                        child: MovieDataCard(
                          movie: state.movie[index],
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: state.movie.length,
                    ),
                  ),
                if (state is SearchError)
                  Center(
                      child: CustomText(
                    text: state.message.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  )),
              ],
            ),
          ),
        );
      },
    );
  }
}
