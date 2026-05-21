import 'package:api_call/screen_with_model.dart';
import 'package:api_call/screen_with_multi_values_model.dart';
import 'package:api_call/screen_without_model.dart';
import 'package:api_call/screen_without_multi_value_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenWithoutMultiValueModel(),
    );
  }
}
