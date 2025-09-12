import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListTileCreate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListTileCreate extends StatefulWidget {
  const ListTileCreate({super.key});

  @override
  State<ListTileCreate> createState() => _ListTileCreateState();
}

class _ListTileCreateState extends State<ListTileCreate> {
  List<String> fruits = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List values',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: Icon(Icons.star),
            title: Text(fruits[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete_forever, color: Colors.red),
              onPressed: () {
                setState(() {
                  fruits.removeAt(index);
                });
              },
            ),
          ),
          elevation: 4,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
      ),
    );
  }
}
