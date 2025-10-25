import 'package:flutter/material.dart';

void main() => runApp(AnimatedButtonApp());

class AnimatedButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedButtonScreen(),
    );
  }
}

class AnimatedButtonScreen extends StatefulWidget {
  @override
  _AnimatedButtonScreenState createState() => _AnimatedButtonScreenState();
}

class _AnimatedButtonScreenState extends State<AnimatedButtonScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Button')),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: isPressed ? 200 : 100,
          height: isPressed ? 60 : 40,
          decoration: BoxDecoration(
            color: isPressed ? Colors.orange : Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            child: Text(
              'Press Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}