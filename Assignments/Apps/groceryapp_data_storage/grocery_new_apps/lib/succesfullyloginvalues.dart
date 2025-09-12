import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_new_apps/grocery_list.dart';
import 'package:lottie/lottie.dart';

class Loginsuceesfully extends StatefulWidget {
  const Loginsuceesfully({super.key});

  @override
  State<Loginsuceesfully> createState() => _LoginsuceesfullyState();
}

class _LoginsuceesfullyState extends State<Loginsuceesfully> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GroceryList()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/animation/success.json',
                animate: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.asset(
                'assets/animation/Celebration.json',
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
