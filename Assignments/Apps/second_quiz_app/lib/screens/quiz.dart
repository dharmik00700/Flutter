import 'package:flutter/material.dart';
import 'package:second_quiz_app/screens/quesions_screen.dart';
import 'package:second_quiz_app/screens/start_screen.dart';

class quiz_screen extends StatefulWidget {
  const quiz_screen({super.key,});


  @override
  State<quiz_screen> createState() => _quiz_screenState();
}

class _quiz_screenState extends State<quiz_screen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 113, 37, 246),
                Color.fromARGB(255, 20, 243, 225),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: StartScreen(),
        ),
      ),
    );
  }
}
