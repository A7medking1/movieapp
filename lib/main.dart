import 'package:flutter/material.dart';
import 'package:movieapp/src/core/services/services_locator.dart';
import 'package:movieapp/src/presentation/screens/movie_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();


  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieScreen(),
    );
  }
}