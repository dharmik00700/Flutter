import 'package:flutter/material.dart';
import 'package:todo_app/keys/keys.dart';
import 'package:todo_app/ui_demo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 59, 119),
          title: const Text(
            'Flutter Internals',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 176, 197, 239),
        // body: const UIUpdatesDemo(),
        body: Keys(),
      ),
    );
  }
}
