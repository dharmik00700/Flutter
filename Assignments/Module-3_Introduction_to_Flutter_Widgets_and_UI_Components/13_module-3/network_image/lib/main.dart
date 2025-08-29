import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: Network_Images(), debugShowCheckedModeBanner: false),
  );
}

final irandom = Random();

class Network_Images extends StatefulWidget {
  const Network_Images({super.key});

  @override
  State<Network_Images> createState() => _Network_ImagesState();
}

final List<String> imageUrls = [
  'https://picsum.photos/id/237/200/300',
  'https://picsum.photos/id/10/200/300',
  'https://picsum.photos/id/100/200/300',
  'https://picsum.photos/id/1000/200/300',
  'https://picsum.photos/id/1015/200/300',
  'https://picsum.photos/id/1025/200/300',
  'https://picsum.photos/id/1040/200/300',
  'https://picsum.photos/id/1060/200/300',
  'https://picsum.photos/id/1084/200/300',
  'https://picsum.photos/id/431/200/300',
];

class _Network_ImagesState extends State<Network_Images> {
  int currectindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image From Network',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 215, 243),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              imageUrls[currectindex],
              width: double.infinity,
              height: 300,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  currectindex = irandom.nextInt(10);
                });
              },
              child: Text('Next Image'),
            ),
          ],
        ),
      ),
    );
  }
}
