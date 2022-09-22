import 'package:flutter/material.dart';
import 'package:movieapp/src/presentation/screens/movie_screen.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      showSemanticsDebugger: false,
      home: MovieScreen(),
    );
  }
}