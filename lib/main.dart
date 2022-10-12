import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/services/services_locator.dart';
import 'package:movieapp/src/core/use_case/base_use_case.dart';
import 'package:movieapp/src/data/datasource/movie_remote_data_source.dart';
import 'package:movieapp/src/data/repository/movie_repository.dart';
import 'package:movieapp/src/domain/repository/base_movie_repository.dart';
import 'package:movieapp/src/domain/usecases/get_genres.dart';
import 'package:movieapp/src/presentation/controller/cubit/movie_pagination_cubit.dart';
import 'package:movieapp/src/presentation/controller/popular_pagination_bloc/popular_pagination_bloc.dart';
import 'package:movieapp/src/presentation/screens/app_layout_screen.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<MovieCubit>()),
        //BlocProvider(create: (context) => sl<PopularPaginationBloc>()..add(GetPopularPaginationMoviesEvent()))
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