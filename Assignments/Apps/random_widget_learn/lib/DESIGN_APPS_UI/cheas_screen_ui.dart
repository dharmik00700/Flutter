import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheasScreenUi extends StatefulWidget {
  const CheasScreenUi({super.key});

  @override
  State<CheasScreenUi> createState() => _CheasScreenUiState();
}

class _CheasScreenUiState extends State<CheasScreenUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cheas Screen'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                whitecontainer(FontAwesomeIcons.solidChessRook, Colors.black),
                greencontainer(FontAwesomeIcons.solidChessKnight, Colors.black),
                whitecontainer(FontAwesomeIcons.solidChessBishop, Colors.black),
                greencontainer(FontAwesomeIcons.solidChessQueen, Colors.black),
                whitecontainer(FontAwesomeIcons.solidChessKing, Colors.black),
                greencontainer(FontAwesomeIcons.solidChessBishop, Colors.black),
                whitecontainer(FontAwesomeIcons.solidChessKnight, Colors.black),
                greencontainer(FontAwesomeIcons.solidChessRook, Colors.black),
              ],
            ),
            Row(
              children: [
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.black),
              ],
            ),
            Row(children: [
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
            ]),
            Row(children: [
              withougreencontainer(),

              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
            ]),Row(children: [
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
            ]),
            Row(children: [
              withougreencontainer(),

              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
              withougreencontainer(),
              withoutwhitecontainer(),
            ]),
            Row(
              children: [
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
                whitecontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
                greencontainer(FontAwesomeIcons.solidChessPawn, Colors.white70),
              ],
            ),
            Row(
              children: [
                greencontainer(FontAwesomeIcons.solidChessRook, Colors.white70),
                whitecontainer(FontAwesomeIcons.solidChessKnight, Colors.white70),
                greencontainer(FontAwesomeIcons.solidChessBishop, Colors.white70),
                whitecontainer(FontAwesomeIcons.solidChessQueen, Colors.white70),
                greencontainer(FontAwesomeIcons.solidChessKing, Colors.white70),
                whitecontainer(FontAwesomeIcons.solidChessBishop, Colors.white70),
                greencontainer(FontAwesomeIcons.solidChessKnight, Colors.white70),
                whitecontainer(FontAwesomeIcons.solidChessRook, Colors.white70),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

whitecontainer(icon, color) {
  return Expanded(
    child: Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.grey,
      ),
      child: Center(child: FaIcon(icon, size: 35, color: color)),
    ),
  );
}

greencontainer(icon, color) {
  return Expanded(
    child: Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.green,
      ),
      child: Center(child: FaIcon(icon, size: 35, color: color)),
    ),
  );
}

withoutwhitecontainer() {
  return Expanded(
    child: Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.grey,
      ),
    ),
  );
}

withougreencontainer( ) {
  return Expanded(
    child: Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.green,
      ),
    ),
  );
}
