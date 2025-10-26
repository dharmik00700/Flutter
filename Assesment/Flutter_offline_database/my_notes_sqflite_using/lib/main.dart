// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyNotesApp());
}

class MyNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyNotes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
