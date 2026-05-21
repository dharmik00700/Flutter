import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  void showalertdialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurpleAccent[70],
          title: Text('Alert Dialog'),
          content: Text('Content of Alert Box'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Show'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            children: [
              Containerofgrid(
                text: 'Alert Dialog',
                icon: Icons.warning_amber,
                onTap: showalertdialog,
              ),
              Containerofgrid(
                text: 'Confirm Dialog',
                icon: Icons.help_outline,
                onTap: showalertdialog,
              ),
              Containerofgrid(
                text: 'Custom Dialog',
                icon: Icons.star,
                onTap: showalertdialog,
              ),
              Containerofgrid(
                text: 'Simple Dialog',
                icon: Icons.list,
                onTap: showalertdialog,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget Containerofgrid({
  required String text,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.red, size: 30),
          SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    ),
  );
}
