import 'package:flutter/material.dart';

class ALL_SMALL_WIDGET extends StatefulWidget {
  const ALL_SMALL_WIDGET({super.key});

  @override
  State<ALL_SMALL_WIDGET> createState() => _ALL_SMALL_WIDGETState();
}

String selectedaction = 'none';
String selecedOption = 'option';
int menucount = 0;

class _ALL_SMALL_WIDGETState extends State<ALL_SMALL_WIDGET> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL SMALL WIDGETS'),
        bottom: PreferredSize(
          preferredSize: Size(double.maxFinite, 50),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          inkresponseshow(),
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  setState(() {
                    selectedaction = value;
                  });
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: 'edit', child: Text('option 1')),
                  PopupMenuItem(value: 'delete', child: Text('option 2')),
                  PopupMenuItem(value: 'share', child: Text('option 3')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget inkresponseshow() {
  return Expanded(
    child: Container(
      width: double.maxFinite,
      height: 60,
      decoration: BoxDecoration(border: Border.all(width: 2)),
      child: InkResponse(
        onTap: () {},
        radius: 30,
        splashColor: Colors.greenAccent,
        highlightColor: Colors.yellowAccent,
        child: Container(width: 60, height: 60, child: Icon(Icons.android)),
      ),
    ),
  );
}
