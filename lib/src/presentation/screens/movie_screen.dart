import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/presentation/controller/movies_bloc.dart';
import 'package:movieapp/src/presentation/controller/movies_event.dart';
import 'package:movieapp/src/presentation/controller/movies_state.dart';

import '../../core/services/services_locator.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MoviesBloc(sl())
          ..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(),
          );
        },
      ),
    );
  }
}
