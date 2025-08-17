import 'package:flutter/material.dart';

class text_screen extends StatefulWidget {
  const text_screen({super.key});

  @override
  State<text_screen> createState() => _text_screenState();
}

class _text_screenState extends State<text_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Title',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 241, 8, 8),
              ),
            ),
            Text(
              'SubTitle',
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 9, 13, 238),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
