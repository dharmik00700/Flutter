import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StackPerform());
}

class StackPerform extends StatelessWidget {
  const StackPerform({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Challenge Video',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 229, 169, 56),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/Gemini_Generated_Image_1j2ugf1j2ugf1j2u.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.black.withAlpha(115),
              ),
              Text(
                '24 HOURS CHALLENGE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
