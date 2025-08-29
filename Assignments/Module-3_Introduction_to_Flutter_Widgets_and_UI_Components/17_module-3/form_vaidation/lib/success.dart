import 'package:flutter/material.dart';

class success extends StatelessWidget {
  const success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(child: Text('Successfully Registration',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),),
    );
  }
}