import 'package:flutter/material.dart';

class ScrollbarWidget extends StatefulWidget {
  const ScrollbarWidget({super.key});

  @override
  State<ScrollbarWidget> createState() => _ScrollbarWidgetState();
}

class _ScrollbarWidgetState extends State<ScrollbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scroll bar widget', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) => Card(
            shadowColor: Colors.deepPurpleAccent,
            borderOnForeground: true,elevation: 30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ListTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
              // tileColor: Colors.deepPurpleAccent.withAlpha(80),
            ),
          ),
        ),
      ),
    );
  }
}
