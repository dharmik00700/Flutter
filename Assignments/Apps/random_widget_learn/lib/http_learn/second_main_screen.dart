import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_widget_learn/http_learn/homescreen.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Package Learn'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Homescreen(),
    );
  }
}
