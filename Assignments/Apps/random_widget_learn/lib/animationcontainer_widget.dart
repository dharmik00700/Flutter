import 'package:flutter/material.dart';

class AnimationcontainerWidget extends StatefulWidget {
  const AnimationcontainerWidget({super.key});

  @override
  State<AnimationcontainerWidget> createState() =>
      _AnimationcontainerWidgetState();
}

double width = 100;
double size = 30;
double height = 100;

Color color = Colors.deepPurpleAccent;
Color border = Colors.white10;
double borderwidth = 2;


class _AnimationcontainerWidgetState extends State<AnimationcontainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation container widget'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Expanded(
              child: AnimatedContainer(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: color,
              
                  border: Border.all(width: borderwidth, color: border),
                ),
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                child: Icon(Icons.adb_sharp, color: Colors.white,size: size,),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                width = width == 100 ? 200 : 100;
                height = height == 100 ? 200 : 100;
                color = color == Colors.deepPurpleAccent
                    ? Colors.red
                    : Colors.deepPurpleAccent;
                size = size == 30 ? 50 : 30;
                border = border == Colors.white10 ? Colors.black : Colors.white10;
                borderwidth = borderwidth == 2 ? 5 : 2;
              });
            },
            child: Text('show animation'),
          ),
        ],
      ),
    );
  }
}
