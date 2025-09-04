import 'package:flutter/material.dart';
import 'package:navigation_tap_to_switch_drawer/deawer.dart';
import 'package:navigation_tap_to_switch_drawer/profile_screen.dart';
import 'package:navigation_tap_to_switch_drawer/setting_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Navigation_Drawer(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Navigation_Drawer extends StatefulWidget {
  const Navigation_Drawer({super.key});

  @override
  State<Navigation_Drawer> createState() => _Navigation_DrawerState();
}


class _Navigation_DrawerState extends State<Navigation_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Drawer Switch',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 215, 243),
      ),
      drawer: Drawer_screen(),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'HOME',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
