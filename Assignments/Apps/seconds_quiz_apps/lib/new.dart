import 'package:flutter/material.dart';
import 'package:seconds_quiz_apps/quesions_screen.dart';

class newscreen extends StatefulWidget {
  const newscreen({super.key});

  @override
  State<newscreen> createState() => _newscreenState();
}

class _newscreenState extends State<newscreen> {
  List<String> selectedAnswers = [];
  void startquiz() {
    setState(() {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => quesions_screen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                'Learn Flutter the Fun Way',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () {
                  startquiz();
                },
                label: Text(
                  'Start Quiz App',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
