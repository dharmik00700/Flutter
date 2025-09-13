import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: CardFloatingButton()),
  );
}

class CardFloatingButton extends StatefulWidget {
  const CardFloatingButton({super.key});

  @override
  State<CardFloatingButton> createState() => _CardFloatingButtonState();
}

List<String> names = [
  'dharmik',
  'rohit',
  'jenish',
  'nikhil',
  'het',
  'bhuman',
  'dharmik',
  'rohit',
  'jenish',
  'nikhil',
  'het',
  'bhuman',
  'dharmik',
  'rohit',
  'jenish',
  'nikhil',
  'het',
  'bhuman',
];
List<Color> colors = [
  Color.fromARGB(255, 179, 86, 218),
  Color.fromARGB(255, 135, 189, 243),
  Color.fromARGB(255, 234, 97, 97),
  Color.fromARGB(255, 232, 125, 78),
  Color.fromARGB(255, 11, 122, 234),
  Color.fromARGB(255, 154, 229, 79),
  Color.fromARGB(255, 211, 155, 114),
  Color.fromARGB(255, 81, 62, 136),
  Color.fromARGB(255, 168, 72, 139),
  Color.fromARGB(255, 118, 204, 187),
  Color.fromARGB(255, 57, 108, 121),
  Color.fromARGB(255, 116, 175, 234),
  Color.fromARGB(255, 82, 61, 61),
  Color.fromARGB(255, 13, 66, 45),
  Color.fromARGB(255, 16, 239, 142),
  Color.fromARGB(255, 89, 91, 93),
];

class _CardFloatingButtonState extends State<CardFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Inside Flaoting Button '),
        backgroundColor: Color.fromARGB(255, 106, 171, 234),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 4,
          color: colors[index],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 25,
                    child: Text(
                      names[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.add),
                      elevation: 4,
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: 15,
      ),
    );
  }
}
