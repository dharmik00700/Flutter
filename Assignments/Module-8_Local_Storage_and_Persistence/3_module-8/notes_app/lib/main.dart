import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(NotesApp());

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotesHome(),
    );
  }
}

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  List<String> notes = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      notes = prefs.getStringList('notes') ?? [];
    });
  }

  Future<void> saveNote(String note) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notes.add(note);
    await prefs.setStringList('notes', notes);
    controller.clear();
    setState(() {});
  }

  Future<void> deleteNote(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notes.removeAt(index);
    await prefs.setStringList('notes', notes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Notes')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter note',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => saveNote(controller.text),
            child: Text('Save Note'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(notes[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteNote(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}