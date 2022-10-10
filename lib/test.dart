import 'package:flutter/material.dart';
import 'package:movieapp/src/presentation/screens/app_layout_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          child: const Text("navigate"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppLayOutScreen()),
            );
          },
        ),
      ),
    );
  }
}
