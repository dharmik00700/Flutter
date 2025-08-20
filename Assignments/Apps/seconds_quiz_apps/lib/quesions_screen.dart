import 'package:flutter/material.dart';
import 'package:seconds_quiz_apps/AnswerButton.dart';
import 'package:seconds_quiz_apps/data/questions.dart';
import 'package:seconds_quiz_apps/result_screen.dart';

class quesions_screen extends StatefulWidget {
  const quesions_screen({super.key});

  @override
  State<quesions_screen> createState() => _quesions_screenState();
}

class _quesions_screenState extends State<quesions_screen> {
  var currentQuestionIndex = 0;
  List<String> newlist=[];
  void adddata(String a){
    newlist.add(a);
  }

  void answerQuestion(String answer) {
    setState(() {
      adddata(answer);
      print(answer);
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => result_screen(answer: answer,newlist:newlist)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 113, 37, 246),
              Color.fromARGB(255, 20, 243, 225),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  currentQuestion.text,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              ...currentQuestion.shuffleAnswers.map(
                (answer) => AnswerButton(
                  answerText: answer,
                  onTap: () {
                    return answerQuestion(answer);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
