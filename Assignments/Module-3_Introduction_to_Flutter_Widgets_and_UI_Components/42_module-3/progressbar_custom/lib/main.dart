import 'package:flutter/material.dart';
import 'package:progressbar_custom/progressdemo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Progress Bar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProgressDemoScreen(),
    );
  }
}
