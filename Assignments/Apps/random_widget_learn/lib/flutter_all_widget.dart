import 'package:flutter/material.dart';
import 'package:random_widget_learn/basic_widgets.dart';

class FlutterAllWidget extends StatefulWidget {
  const FlutterAllWidget({super.key});

  @override
  State<FlutterAllWidget> createState() => _FlutterAllWidgetState();
}

class _FlutterAllWidgetState extends State<FlutterAllWidget> {
  Map<String, Widget> topic = {'BASIC WIDGETS' : BasicWidgets()};
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Flutter Widgets')),body: ListView.builder(
      itemCount: topic.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => topic.values.elementAt(
                  index)),
            );
          },
          child: Card(
            margin: EdgeInsets.all(4.0),
            elevation: 4,
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                topic.keys.elementAt(index),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
        );
      },
    ),);
  }
}
