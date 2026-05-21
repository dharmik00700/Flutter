import 'package:flutter/material.dart';

class Indexedstack extends StatefulWidget {
  const Indexedstack({super.key});

  @override
  State<Indexedstack> createState() => _IndexedstackState();
}

int currentindex = 0;

class _IndexedstackState extends State<Indexedstack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Indexedstack')),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: IndexedStack(
                  index: currentindex,
                  children: [
                    Container(
                      color: Colors.red.withAlpha(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(Icons.home),
                            SizedBox(width: 10),
                            Text('HOME SCREEN'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.green.withAlpha(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(Icons.car_rental),
                            SizedBox(width: 10),
                            Text('second SCREEN'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue.withAlpha(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(Icons.bolt),
                            SizedBox(width: 10),
                            Text('third SCREEN'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  currentindex=0;
                });
              }, child: Text('first')),
              ElevatedButton(onPressed: (){ setState(() {
                currentindex=1;
              });}, child: Text('second')),
              ElevatedButton(onPressed: (){ setState(() {
                currentindex=2;
              });}, child: Text('third')),            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Text('Input Code :-'),
                  SingleChildScrollView(
                    child: Text('''
                    body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: IndexedStack(
                  index: currentindex,
                  children: [
                    Container(
                      color: Colors.red.withAlpha(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(Icons.home),
                            SizedBox(width: 10),
                            Text('HOME SCREEN'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.green.withAlpha(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(Icons.car_rental),
                            SizedBox(width: 10),
                            Text('second SCREEN'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue.withAlpha(30),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(Icons.bolt),
                            SizedBox(width: 10),
                            Text('third SCREEN'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  currentindex=0;
                });
              }, child: Text('first')),
              ElevatedButton(onPressed: (){ setState(() {
                currentindex=1;
              });}, child: Text('second')),
              ElevatedButton(onPressed: (){ setState(() {
                currentindex=2;
              });}, child: Text('third')),            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Text('Input Code :-'),
                  SingleChildScrollView(
                    child: Text('''

                        '''),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                children: [
                  Text('queastions :-'),
                  Text(
                    '''

                        ''',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
                    '''),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView(
                children: [
                  Text('queastions :-'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '''
1.What is IndexedStack?
== IndexedStack shows only one child at a time from a list of children, based on the index property. All children maintain their state even when not visible.

*Key features:*

Only one child is visible at a time
All children maintain their state
Size is determined by the largest child
Perfect for tab-based navigation

*IndexedStack vs Stack:*
IndexedStack - Shows one child, maintains all states
Stack - Shows all children overlapped

* When to use IndexedStack?*
Tab navigation with state preservation
Multi-step forms
Wizard-like interfaces
Bottom navigation bar screens
              ''',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
