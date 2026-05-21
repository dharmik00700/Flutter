import 'package:flutter/material.dart';
import 'package:random_widget_learn/Indexedstack.dart';
import 'package:random_widget_learn/howdatabase__create/network_image_widget.dart';
import 'package:random_widget_learn/richtext_widget.dart';

class BasicWidgets extends StatefulWidget {
  const BasicWidgets({super.key});

  @override
  State<BasicWidgets> createState() => _BasicWidgetsState();
}

class _BasicWidgetsState extends State<BasicWidgets> {
  Map<String, Widget> topic = {'NetworkImage Widget': networkimagewidget(),'RichText Widget': RichtextWidget(),'IndexedStack Widget': Indexedstack()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widgets')),
      body: ListView.builder(
        itemCount: topic.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => topic.values.elementAt(index),
                ),
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
      ),
    );
  }
}
