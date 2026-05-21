import 'package:flutter/material.dart';

class StepperWidgets extends StatefulWidget {
  const StepperWidgets({super.key});

  @override
  State<StepperWidgets> createState() => _StepperWidgetsState();
}

class _StepperWidgetsState extends State<StepperWidgets> {
  var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('stepper widget')),
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Stepper(
            currentStep: currentindex,
            onStepTapped: (value) {
              setState(() {
                currentindex = value;
              });
            },
            onStepContinue: () {
              setState(() {
                currentindex++;
                if (currentindex == 3) {
                  currentindex = 0;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                currentindex--;
                if (currentindex == 3) {
                  currentindex = 3;
                }
              });
            },

            steps: [
              Step(title: Text('Step 1'), content: Text('Step 1 content')),
              Step(title: Text('Step 2'), content: Text('Step 2 content')),
              Step(title: Text('Step 3'), content: Text('Step 3 content')),
            ],
          ),
        ),
      ),
    );
  }
}
