import 'package:flutter/material.dart';

class FireMainScreen extends StatefulWidget {
  const FireMainScreen({super.key});

  @override
  State<FireMainScreen> createState() => _FireMainScreenState();
}

class _FireMainScreenState extends State<FireMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Learn'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
    );
  }
}
