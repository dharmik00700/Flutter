import 'package:flutter/material.dart';

class TabbarWidgets extends StatefulWidget {
  const TabbarWidgets({super.key});

  @override
  State<TabbarWidgets> createState() => _TabbarWidgetsState();
}

class _TabbarWidgetsState extends State<TabbarWidgets>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 9, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
        bottom: TabBar(
          controller: tabController,

          isScrollable: true,
          dividerColor: Colors.green,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'HOME'),
            Tab(icon: Icon(Icons.menu), text: 'MENU'),
            Tab(icon: Icon(Icons.propane_rounded), text: 'PROFILE'),
            Tab(icon: Icon(Icons.home), text: 'HOME'),
            Tab(icon: Icon(Icons.menu), text: 'MENU'),
            Tab(icon: Icon(Icons.propane_rounded), text: 'PROFILE'),
            Tab(icon: Icon(Icons.home), text: 'HOME'),
            Tab(icon: Icon(Icons.menu), text: 'MENU'),
            Tab(icon: Icon(Icons.propane_rounded), text: 'PROFILE'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          newtabbar('HOME', Colors.blue),
          newtabbar('MENU', Colors.redAccent),
          newtabbar('PROFILe', Colors.yellowAccent),
          newtabbar('HOME', Colors.blue),
          newtabbar('MENU', Colors.redAccent),
          newtabbar('PROFILe', Colors.yellowAccent),
          newtabbar('HOME', Colors.blue),
          newtabbar('MENU', Colors.redAccent),
          newtabbar('PROFILe', Colors.yellowAccent),
        ],
      ),
    );
  }
}

Widget newtabbar(String name, Color colors) {
  return Center(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      color: colors,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(name, style: TextStyle(fontSize: 35))],
      ),
    ),
  );
}
