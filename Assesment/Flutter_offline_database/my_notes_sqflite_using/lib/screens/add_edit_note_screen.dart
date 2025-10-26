// lib/screens/add_edit_note_screen.dart
import 'package:flutter/material.dart';
import '../models/note.dart';
import '../db/notes_db.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  AddEditNoteScreen({this.note});

  @override
  _AddEditNoteScreenState createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descController.text = widget.note!.description;
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _saving = true);

    final now = DateTime.now().toIso8601String();
    if (widget.note == null) {
      final note = Note(
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        createdAt: now,
      );
      final created = await NotesDB.instance.createNote(note);
      setState(() => _saving = false);
      Navigator.of(context).pop(created);
    } else {
      final updatedNote = widget.note!.copyWith(
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        createdAt: now,
      );
      await NotesDB.instance.updateNote(updatedNote);
      setState(() => _saving = false);
      Navigator.of(context).pop(updatedNote);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.note != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Note' : 'Add Note'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _saving
            ? Center(child: CircularProgressIndicator())
            : Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Note Title'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter title' : null,
              ),
              SizedBox(height: 12),
              Expanded(
                child: TextFormField(
                  controller: _descController,
                  decoration: InputDecoration(labelText: 'Note Description'),
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter description' : null,
                ),
              ),
              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  child: Text(isEdit ? 'Update' : 'Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
