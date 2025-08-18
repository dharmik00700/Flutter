import 'package:flutter/material.dart';
import 'dart:math';

final randomnumber = Random();

class GradientContainer extends StatefulWidget {
  GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

void RollDice() {}

class _GradientContainerState extends State<GradientContainer> {
  num diceimagerandom = 2;

  void RollDice() {
    setState(() {
      diceimagerandom = randomnumber.nextInt(6) + 1;
    });
    print("Changing Dice...");
    print(diceimagerandom.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Image.asset(
            'assets/images/dice-six-faces-${diceimagerandom}.png',
            width: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 30),
          OutlinedButton(
            onPressed: RollDice,
            child: Text('Roll Dice', style: TextStyle(color: Colors.white)),
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 2, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
