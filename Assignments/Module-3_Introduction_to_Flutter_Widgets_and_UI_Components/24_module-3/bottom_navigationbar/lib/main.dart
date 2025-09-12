import 'package:bottom_navigationbar/messages_screen.dart';
import 'package:bottom_navigationbar/news_screen.dart';
import 'package:bottom_navigationbar/setting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHome(), debugShowCheckedModeBanner: false));
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final PageController pageController = PageController();
  var currentindex = 0;
  final List<Widget> pages = [News_Screen(), MessagesScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Bottom Navigation Bar')),
          body: PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (index) {
              setState(() {
                currentindex = index;
              });
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (values) {
              setState(() {
                pageController.animateToPage(
                  values,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
