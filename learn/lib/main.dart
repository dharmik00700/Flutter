import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var index = 0;
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Icon(Icons.ac_unit), text: 'home'),
            Tab(icon: Icon(Icons.ac_unit), text: 'home'),
          ],
        ),
        title: Text(
          'Home Screen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.purpleAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'shop',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'setting'),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('text'),
                    subtitle: Text('subtext'),
                    tileColor: Colors.lightBlueAccent,
                  ),
                );
              },
            ),
          ),
          Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,mainAxisSpacing: 10
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.amberAccent,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
