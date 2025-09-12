import 'package:flutter/material.dart';

class News_Screen extends StatefulWidget {
  const News_Screen({super.key});

  @override
  State<News_Screen> createState() => _News_ScreenState();
}

class _News_ScreenState extends State<News_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.red,
      body: Center(child: Text('News Screen', style: TextStyle(fontSize: 25))),
    );
  }
}
