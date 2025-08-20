// import 'package:flutter/material.dart';
//
// class AnswerButton extends StatelessWidget {
//   final String answerText;
//   final void Function() onTap;
//
//   const AnswerButton({
//     super.key,
//     required this.answerText,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4.0),
//       child: ElevatedButton(
//         onPressed: onTap,
//         child: Text(
//           answerText,
//           style: TextStyle(fontSize: 22, color: Colors.black),
//         ),
//         style: ElevatedButton.styleFrom(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(40),
//           ),
//           fixedSize: Size(500, double.infinity),
//         ),
//       ),
//     );
//     // Padding(
//     //   padding: const EdgeInsets.only(bottom: 4),
//     //   child: ElevatedButton(onPressed: onTap,
//     //       style: ElevatedButton.styleFrom(
//     //         backgroundColor: Color.fromARGB(255, 33, 1, 95),
//     //         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//     //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
//     //       ),
//     //       child: (answerText)),
//     // );
//   }
// }
