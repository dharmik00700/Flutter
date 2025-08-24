import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: card_using_column_and_row(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class card_using_column_and_row extends StatefulWidget {
  const card_using_column_and_row({super.key});

  @override
  State<card_using_column_and_row> createState() =>
      _card_using_column_and_rowState();
}

class _card_using_column_and_rowState extends State<card_using_column_and_row> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Responsive Layout',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 12, 12, 12),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: FaIcon(FontAwesomeIcons.bookBookmark)
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dharmik Makvana',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Flutter enthusiast & Computer Engineering student. Passionate about clean UI and efficient code.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
