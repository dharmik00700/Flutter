import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stackbutton extends StatefulWidget {
  const Stackbutton({
    super.key,
    required this.title,
    this.icon = Icons.email,
    this.color = Colors.blue,
    this.iconsize = 50,
  });

  final String title;
  final IconData icon;
  final Color color;
  final double iconsize;

  @override
  State<Stackbutton> createState() => _StackbuttonState();
}

class _StackbuttonState extends State<Stackbutton> {
  double width = 170;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.yellowAccent, Colors.deepOrange, Colors.blue],begin: Alignment.centerLeft,
          end: Alignment.centerRight,

        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(35),
          ),
          width: width,
          height: 55,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: -30,
                left: width / 2.7,
                child: Icon(widget.icon, color: Colors.blue, size: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
