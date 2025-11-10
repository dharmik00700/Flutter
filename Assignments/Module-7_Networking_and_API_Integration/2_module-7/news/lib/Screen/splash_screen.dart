import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_pic.jpg',
              fit: BoxFit.fill,
              height: height * .5,
              width: width * .9,
            ),
            SizedBox(height: height * 0.04),
            Text(
              'HeadLines',
              style: GoogleFonts.anton(
                letterSpacing: 0.6,
                color: Colors.grey.shade700,
                fontSize: 24,
              ),
            ),
            SizedBox(height: height * 0.04),
            SpinKitChasingDots(color: Colors.black, size: 40),
          ],
        ),
      ),
    );
  }
}
