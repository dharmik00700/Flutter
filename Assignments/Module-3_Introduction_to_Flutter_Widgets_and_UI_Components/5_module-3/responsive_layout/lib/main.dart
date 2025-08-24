import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: responsive_layout(),
    ),
  );
}

class responsive_layout extends StatelessWidget {
  const responsive_layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive Layout',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 12, 12, 12),
      ),
      body: Row(
        children: [
          Expanded(flex: 3,child: Container(height: 100,color: Color.fromARGB(255, 255, 0, 0),)),
          Expanded(flex: 2,child: Container(height: 100,color: Color.fromARGB(255, 54, 255, 0),)),
          Expanded(flex: 1,child: Container(height: 100,color: Color.fromARGB(255, 9, 13, 238),)),
        ],
      ),
    );
  }
}
