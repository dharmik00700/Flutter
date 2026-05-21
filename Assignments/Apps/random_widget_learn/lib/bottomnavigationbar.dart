import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

int currentindex = 0;

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationBar Demo')),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.baby_changing_station),
            label: 'log',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'mones'),
        ],
      ),
    );
  }
}
