import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/src/core/services/services_locator.dart';
import 'package:movieapp/src/presentation/controller/movie_cubit.dart';
import 'package:movieapp/test.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: const TestScreen(),
      ),
    );
  }
}