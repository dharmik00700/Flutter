import 'package:flutter/material.dart';
import 'avatarbadge.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avatar Badge Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: Text('Avatar Badge'),backgroundColor: Colors.orange,),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 231, 206, 118),
          child: Column(
            children: [
              DrawerHeader(
                child: AvatarBadge(
                  imageUrl: 'assets/images/india.jpg',
                  isOnline: true,
                  radius: 70,
                ),
              ),
              Divider(),
            ],
          ),
        ),
        // body: Center(
        //     child:
        // ),
      ),
    );
  }
}
