import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Toggle_Switch(), debugShowCheckedModeBanner: false));
}

class Toggle_Switch extends StatefulWidget {
  const Toggle_Switch({super.key});

  @override
  State<Toggle_Switch> createState() => _Toggle_SwitchState();
}

class _Toggle_SwitchState extends State<Toggle_Switch> {
  bool isSwitched = false;
  Color newcolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Toggle Switch',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Switch(
              activeColor: Colors.green,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 204, 164, 243),
      ),
      backgroundColor: isSwitched ? Colors.black : Colors.white,
      body: Center(
        child: Text(
          'Colors : ${isSwitched ? 'BLACK' : 'WHITE'}',
          style: TextStyle(
            color: isSwitched ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
