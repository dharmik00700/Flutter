import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PositionWidget());
}

class PositionWidget extends StatefulWidget {
  const PositionWidget({super.key});

  @override
  State<PositionWidget> createState() => _PositionWidgetState();
}

class _PositionWidgetState extends State<PositionWidget> {
  late final screenWidth = MediaQuery.of(context).size.width;
  late final screenHeight = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('How To Use Positioned Widget'),
          backgroundColor: Color.fromARGB(255, 178, 238, 238),
        ),
        body: Stack(
          children: [
            Positioned(
              top: screenHeight / 13,
              left: screenWidth / 4 - 100,

              child: Image.asset(
                'assets/images/ChatGPT Image Sep 14, 2025, 12_11_31 AM.png',
                height: 600,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black.withAlpha(125),
                width: screenWidth,
                height: 200,
                child: Center(
                  child: Text(
                    'It is Challenge video for Views',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
