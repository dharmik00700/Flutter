import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stcak_button_overlay/stackbutton.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: DisplayContent()),
  );
}

class DisplayContent extends StatefulWidget {
  const DisplayContent({super.key});

  @override
  State<DisplayContent> createState() => _DisplayContentState();
}

class _DisplayContentState extends State<DisplayContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Overlay Button'),
        backgroundColor: Color.fromARGB(255, 245, 184, 184),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          color: Color.fromARGB(255, 185, 180, 180),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 270,
              height: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 50, color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Stack Overlay Button',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Stackbutton(title: 'Stack Button')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
