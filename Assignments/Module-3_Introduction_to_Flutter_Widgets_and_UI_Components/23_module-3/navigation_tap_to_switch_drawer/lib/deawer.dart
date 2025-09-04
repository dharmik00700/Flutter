import 'package:flutter/material.dart';
import 'package:navigation_tap_to_switch_drawer/profile_screen.dart';
import 'package:navigation_tap_to_switch_drawer/setting_screen.dart';

import 'main.dart';

class Drawer_screen extends StatefulWidget {
  const Drawer_screen({super.key});

  @override
  State<Drawer_screen> createState() => _Drawer_screenState();
}

List<Map<String, bool>> draweritems = [
  {'home': false, 'profile': false, 'setting': false},
];

class _Drawer_screenState extends State<Drawer_screen> {
  @override
  void initState() {
    super.initState();
    draweritems = [
      {'home': false},
    ];
    draweritems = [
      {'profile': false},
    ];
    draweritems = [
      {'setting': false},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Welcome Dharmik'),
          ),
          ListTile(
            title: Text('HOME'),
            onTap: () {
              if (draweritems[0]['home'] == true) {
              } else {
                setState(() {
                  draweritems = [
                    {'home': true},
                  ];
                  draweritems = [
                    {'profile': false},
                  ];
                  draweritems = [
                    {'setting': false},
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Navigation_Drawer(),
                    ),
                  );
                });
              }

              // Navigate to Profile
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              if (draweritems[0]['profile'] == true) {
                return;
              } else {
                setState(() {
                  draweritems = [
                    {'home': false},
                  ];
                  draweritems = [
                    {'profile': true},
                  ];
                  draweritems = [
                    {'setting': false},
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                });
              }
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              if (draweritems[0]['setting'] == true) {
                return;
              } else {
                setState(() {
                  draweritems = [
                    {'home': false},
                  ];
                  draweritems = [
                    {'profile': false},
                  ];
                  draweritems = [
                    {'setting': true},
                  ];
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  );
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
