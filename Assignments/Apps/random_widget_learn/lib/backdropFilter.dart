import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropfilterWidgets extends StatefulWidget {
  const BackdropfilterWidgets({super.key});

  @override
  State<BackdropfilterWidgets> createState() => _BackdropfilterWidgetsState();
}

class _BackdropfilterWidgetsState extends State<BackdropfilterWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BackdropFilter Widget'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 400,
                  child: Image(
                    image: NetworkImage('https://picsum.photos/200/300'),
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10,tileMode: TileMode.clamp),
                    child: Container(
                      width: 200,
                      height: 100,
                      // color: Colors.red,
                      child: Center(child: Text('Background')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
