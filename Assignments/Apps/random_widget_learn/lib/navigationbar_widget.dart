import 'package:flutter/material.dart';

class NavigationbarWidget extends StatefulWidget {
  const NavigationbarWidget({super.key});

  @override
  State<NavigationbarWidget> createState() => _NavigationbarWidgetState();
}

int currentindex = 0;

class _NavigationbarWidgetState extends State<NavigationbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigationBar Widget'),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentindex,
        onDestinationSelected: (i){
          setState(() {
            currentindex=i;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'favorite'),
          NavigationDestination(icon: Icon(Icons.adb_sharp), label: 'android'),
        ],
      ),
    );
  }
}
