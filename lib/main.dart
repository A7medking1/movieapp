import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc_observer.dart';
import 'package:movieapp/src/core/services/services_locator.dart';
import 'package:movieapp/src/movie/presentation/controller/genres_bloc/genres_bloc.dart';
import 'package:movieapp/src/movie/presentation/controller/movie_bloc/movies_bloc.dart';
import 'package:movieapp/src/movie/presentation/controller/movie_bloc/movies_event.dart';
import 'package:movieapp/src/movie/presentation/screens/app_layout_screen.dart';
import 'package:movieapp/src/tv/presentation/controller/menu_cubit/menu_cubit.dart';
import 'package:movieapp/src/tv/presentation/controller/tv_bloc/tv_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

       // BlocProvider(create: (context) => MenuCubit()),
        //BlocProvider(create: (context) => sl<TvPaginationBloc>()),
        BlocProvider(
          create: (context) => sl<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider(
          create: (context) => sl<GenresBloc>()..add(GetGenresEvent()),
        ),
        BlocProvider(
          create: (context) => sl<TvBloc>()
            ..add(GetPopularTvEvent())
            ..add(GetTopRatedTvEvent())
            ..add(GetWarTvEvent())
            ..add(GetTrendingTvEvent())
            ..add(GetAnimationTvEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: const AppLayOutScreen(),
      ),
    );
  }
}
