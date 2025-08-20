import 'package:flutter/material.dart';

class QuesionsScreen extends StatefulWidget {
  const QuesionsScreen({super.key});

  @override
  State<QuesionsScreen> createState() => _QuesionsScreenState();
}

class _QuesionsScreenState extends State<QuesionsScreen> {
  // var currentQuestionIndex = 0;

  void answerQuestion() {
    // setState(() {
    //   currentQuestionIndex++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(width: 200, height: 200, color: Colors.orange),
            // Text(
            //   currentQuestion.text,
            //   style: TextStyle(color: Colors.white, fontSize: 25),
            //   textAlign: TextAlign.center,
            // ),
            // SizedBox(height: 40),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap: answerQuestion)
            // ...currentQuestion.shuffleAnswers.map(
            //   (answer) =>
            //       AnswerButton(answerText: answer, onTap: answerQuestion),
            // ),
          ],
        ),
      ),
    );
  }
}
