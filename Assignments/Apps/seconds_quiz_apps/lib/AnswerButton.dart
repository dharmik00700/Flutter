import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onTap;

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          answerText,
          style: TextStyle(fontSize: 22, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: Colors.transparent,
          fixedSize: Size(450, double.infinity),
        ),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.only(bottom: 4),
    //   child: ElevatedButton(onPressed: onTap,
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: Color.fromARGB(255, 33, 1, 95),
    //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    //       ),
    //       child: (answerText)),
    // );
  }
}

/*
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: onTap,
    child: Text(
      answerText,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ),
)
 */
