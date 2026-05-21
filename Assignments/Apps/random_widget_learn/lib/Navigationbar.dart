import 'package:flutter/material.dart';

class Navigationbars extends StatefulWidget {
  const Navigationbars({super.key});

  @override
  State<Navigationbars> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbars>
    with SingleTickerProviderStateMixin {
  var index = 0;
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
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
      appBar: AppBar(title: Text('navigationvar')),
      bottomNavigationBar: BottomNavigationBar(elevation: 5,
        type: BottomNavigationBarType.fixed,
        onTap: (values) {
          setState(() {
            index = values;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOMe'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOMe'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOMe'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOMe'),
        ],
      ),
      body: Column(
        children: [
          Text('dhar', style: TextStyle(fontSize: 50)),
          Text('dhar', style: TextStyle(fontSize: 50)),
          Text('dhar', style: TextStyle(fontSize: 50)),
          Container(
            width: double.maxFinite,
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,indicatorAnimation: TabIndicatorAnimation.linear,
                indicatorColor: Colors.blue,
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: [
                  Tab(text: 'dhar',),
                  Tab(text: 'khar'),
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 400,
            child: TabBarView(
              controller: tabController,
              children: [
              ],
            ),
          ),
        ],
      ),
    );
  }
}
