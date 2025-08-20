import 'package:flutter/material.dart';
import 'package:second_quiz_app/screens/quesions_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void startquiz() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QuesionsScreen()),
      );
      print('new screen');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          icon: Icon(Icons.arrow_forward, color: Colors.white),
          onPressed:startquiz,
          label: Text(
            'Start Quiz App',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ],
    );
  }
}
