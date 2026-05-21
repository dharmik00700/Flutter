import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({super.key});

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}
Color targetColor = Colors.grey;

class _DraggableWidgetState extends State<DraggableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable Widget"),
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            // Draggable Container
            Draggable<Color>(
              data: Colors.blue,

              feedback: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),

              childWhenDragging: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),

              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),

            // Drag Target Container
            DragTarget<Color>(
              onAccept: (color) {
                setState(() {
                  targetColor = color;
                });
              },

              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 100,
                  width: 100,
                  color: targetColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
