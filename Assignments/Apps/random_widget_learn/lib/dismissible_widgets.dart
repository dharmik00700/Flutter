import 'package:flutter/material.dart';

class DismissibleWidgets extends StatefulWidget {
  const DismissibleWidgets({super.key});

  @override
  State<DismissibleWidgets> createState() => _DismissibleWidgetsState();
}

class _DismissibleWidgetsState extends State<DismissibleWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible Widget'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => Dismissible(
          key: ValueKey(index),
          background: Container(
            color: Colors.red,
            child: Center(
              child: Text('Delete', style: TextStyle(color: Colors.white)),
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('$index')),
            title: Text('title Test'),
            subtitle: Text('Subtitle Test'),
          ),
        ),
      ),
    );
  }
}
