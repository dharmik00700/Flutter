import 'package:flutter/material.dart';

class SecondDetailScreen extends StatelessWidget {
  const SecondDetailScreen({
    super.key,
    required this.name,
    required this.course,
    required this.roll,
  });

  final String name;
  final String course;
  final String roll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail of Student',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 4, 54, 80),
      ),
      body: Column(
        children: [
          Card(
            elevation: 4,
            color: Color.fromARGB(242, 30, 166, 234),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Course : $course',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Roll Number : $roll',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Setting..',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,fontSize: 20
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 4, 54, 80),
            ),
          ),
        ],
      ),
    );
  }
}
