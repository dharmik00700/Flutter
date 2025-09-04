import 'package:flutter/material.dart';
import 'package:screen_change/second_screen.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'First Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 51, 2, 77),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SecondScreen()));
            });
          },
          child: Text(
            'Next Screen...',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 51, 2, 77),
          ),
        ),
      ),
    );
  }
}
