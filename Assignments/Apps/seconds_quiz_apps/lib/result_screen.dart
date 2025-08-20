import 'package:flutter/material.dart';
import 'package:seconds_quiz_apps/data/questions.dart';
import 'package:seconds_quiz_apps/models/quiz_question.dart';
import 'package:seconds_quiz_apps/quesion_summary.dart';
import 'package:seconds_quiz_apps/quesions_screen.dart';

class result_screen extends StatefulWidget {
  const result_screen({super.key, required this.answer, required this.newlist});

  final String answer;
  final List<String> newlist;

  @override
  State<result_screen> createState() => _result_screenState();
}

class _result_screenState extends State<result_screen> {
  // List<String> mainanswer = [questions[0].answers[0],questions[1].answers[0],questions[2].answers[0],questions[3].answers[0],questions[4].answers[0],questions[5].answers[0]];

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> data = [];
    for (var i = 0; i < widget.newlist.length; i++) {
      data.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": widget.newlist[i],
      });
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var numOfQuestions = questions.length;
    var numOfCorrectAnswers = summaryData
        .where((summary) => summary["user_answer"] == summary["correct_answer"])
        .length;
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
              Text(
                'You answered $numOfCorrectAnswers out of $numOfQuestions questions correctly!!!',
                style: TextStyle(
                  color: Color.fromARGB(255, 9, 9, 9),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              quesion_summary(summaryData: summaryData),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>quesions_screen()));
                },
                label: Text('Restart Quiz!',style: TextStyle(fontSize: 16),),
                icon: Icon(Icons.restart_alt),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  foregroundColor: Colors.white,
                  side: BorderSide(
                    color: Color.fromARGB(150, 25, 15, 23),
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
