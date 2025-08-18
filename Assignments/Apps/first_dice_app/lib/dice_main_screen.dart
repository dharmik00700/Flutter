import 'package:first_dice_app/gradient_container.dart';
import 'package:flutter/material.dart';

class Dice_Main_Screen extends StatelessWidget {
  const Dice_Main_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice App',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
        backgroundColor: Colors.white,

      ),
      body: GradientContainer()

    );
  }
}
