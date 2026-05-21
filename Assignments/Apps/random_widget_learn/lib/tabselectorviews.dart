import 'package:flutter/material.dart';

class tabviewtoselectiontime extends StatefulWidget {
  const tabviewtoselectiontime({super.key});

  @override
  State<tabviewtoselectiontime> createState() => _tabviewtoselectiontimeState();
}

class _tabviewtoselectiontimeState extends State<tabviewtoselectiontime>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  var currentindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: 3,
      initialIndex: currentindex,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
            children: [
              Center(
                child: Container(
                  color: Colors.grey,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Icon(Icons.home),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.orange,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Icon(Icons.business_rounded),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.green,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Icon(Icons.directions_subway),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabPageSelector(
              selectedColor: Colors.redAccent,
              controller: tabController,
              color: Colors.yellowAccent,
              borderStyle: BorderStyle.solid,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (ctx) => Homepage()),
                );
              },
              child: Text('Skip'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          (currentindex != 3 - 1) ? currentindex++ : currentindex = 0;
          tabController.animateTo(currentindex);
        },
        child: Icon(Icons.arrow_right_alt),
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black, Colors.white],begin: Alignment.topCenter,end: Alignment.bottomCenter),
          ),
        ),
        title: Text('THIS IS HOME'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Tooltip(message: 'Text',child: Text('home', style: TextStyle(fontSize: 35)))),
    );
  }
}
