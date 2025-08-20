import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class quesion_summary extends StatelessWidget {
  const quesion_summary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: Column(
          children: summaryData.map((summary) {
            bool iscorrect =
                summary['correct_answer'] == summary['user_answer'];
            return Card(
              elevation: 4,
              color: iscorrect == true
                  ? Color.fromARGB(184, 65, 210, 65)
                  : Colors.red,
              child: ListTile(
                leading: CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: Color.fromARGB(100, 65, 69, 75),
                  child: Text(
                    ((summary['question_index'] as int) + 1).toString(),
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                title: Text(
                  summary['question'].toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        summary['correct_answer'].toString(),
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        summary['user_answer'].toString(),
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
