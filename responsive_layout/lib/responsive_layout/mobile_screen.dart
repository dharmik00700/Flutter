import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Screen'),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.blue.shade500,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(height: 150, color: Colors.yellow),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 100, color: Colors.orange),
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
