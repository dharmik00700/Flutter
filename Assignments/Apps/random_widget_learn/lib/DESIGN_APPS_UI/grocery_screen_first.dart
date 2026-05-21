import 'package:flutter/material.dart';

class GroceryScreenFirst extends StatefulWidget {
  const GroceryScreenFirst({super.key});

  @override
  State<GroceryScreenFirst> createState() => _GroceryScreenFirstState();
}

class _GroceryScreenFirstState extends State<GroceryScreenFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/fruit-1234657_1280.png',
              height: 300,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
