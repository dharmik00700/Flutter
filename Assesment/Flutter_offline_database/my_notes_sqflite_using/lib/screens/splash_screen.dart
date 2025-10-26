// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sticky_note_2, size: 80, color: Colors.white),
            SizedBox(height: 16),
            Text('MyNotes', style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Offline Note Manager', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
