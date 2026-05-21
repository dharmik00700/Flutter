import 'dart:async';
import 'package:flutter/material.dart';
import 'zepto_login_screen.dart';

class ZeptosplashScreen extends StatefulWidget {
  const ZeptosplashScreen({super.key});

  @override
  State<ZeptosplashScreen> createState() => _ZeptosplashScreenState();
}

class _ZeptosplashScreenState extends State<ZeptosplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the Login screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ZeptoLoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF320E47), // Deep purple background
      body: Center(
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFFFF3D6E), // Pink
              Color(0xFFFF9E5E), // Orange
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
          child: const Text(
            'zepto',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.0,
            ),
          ),
        ),
      ),
    );
  }
}
