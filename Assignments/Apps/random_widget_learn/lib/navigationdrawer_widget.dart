import 'package:flutter/material.dart';

class NavigationdrawerWidget extends StatefulWidget {
  const NavigationdrawerWidget({super.key});

  @override
  State<NavigationdrawerWidget> createState() => _NavigationdrawerWidgetState();
}

int currentindex = 0;

class _NavigationdrawerWidgetState extends State<NavigationdrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigationDrawer'),
        backgroundColor: Colors.yellowAccent,
      ),
      drawer: NavigationDrawer(
        selectedIndex: currentindex,
        onDestinationSelected: (index) {
          setState(() {
            currentindex = index;
          });
        },
        elevation: 4,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(child: Icon(Icons.person_rounded), radius: 20),
                SizedBox(height: 10),
                Text('Drawer Header'),
              ],
            ),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.home),
            label: Text('home'),
          ),
          Divider(),
          NavigationDrawerDestination(
            icon: Icon(Icons.favorite),
            label: Text('favorite'),
          ),
          Divider(),
          NavigationDrawerDestination(
            icon: Icon(Icons.ac_unit_outlined),
            label: Text('ac unit'),
          ),
        ],
      ),
    );
  }
}
