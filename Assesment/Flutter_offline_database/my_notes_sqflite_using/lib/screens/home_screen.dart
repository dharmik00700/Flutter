// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../db/notes_db.dart';
import '../models/note.dart';
import 'add_edit_note_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _notes = [];
  List<Note> _filtered = [];
  bool _loading = true;
  final _searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _refreshNotes();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final q = _searchController.text.toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filtered = List.from(_notes);
      } else {
        _filtered = _notes.where((n) {
          return n.title.toLowerCase().contains(q) || n.description.toLowerCase().contains(q);
        }).toList();
      }
    });
  }

  Future<void> _refreshNotes() async {
    setState(() => _loading = true);
    final notes = await NotesDB.instance.readAllNotes();
    setState(() {
      _notes = notes;
      _filtered = List.from(_notes);
      _loading = false;
    });
  }

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso);
      return DateFormat('yyyy-MM-dd HH:mm').format(dt);
    } catch (e) {
      return iso;
    }
  }

  Future<void> _deleteNote(int id) async {
    final sure = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete note?'),
        content: Text('Are you sure you want to delete this note? This action cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.of(context).pop(true), child: Text('Delete')),
        ],
      ),
    );

    if (sure == true) {
      await NotesDB.instance.deleteNote(id);
      await _refreshNotes();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Note deleted')));
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildNoteCard(Note note) {
    final desc = note.description.length > 120 ? note.description.substring(0, 120) + '...' : note.description;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(note.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(desc, maxLines: 2, overflow: TextOverflow.ellipsis),
            SizedBox(height: 6),
            Text(_formatDate(note.createdAt), style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ],
        ),
        isThreeLine: true,
        trailing: PopupMenuButton<String>(
          onSelected: (value) async {
            if (value == 'edit') {
              final updated = await Navigator.of(context).push<Note>(
                MaterialPageRoute(builder: (_) => AddEditNoteScreen(note: note)),
              );
              if (updated != null) await _refreshNotes();
            } else if (value == 'delete') {
              await _deleteNote(note.id!);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: 'edit', child: Row(children: [Icon(Icons.edit), SizedBox(width: 8), Text('Edit')])),
            PopupMenuItem(value: 'delete', child: Row(children: [Icon(Icons.delete), SizedBox(width: 8), Text('Delete')])),
          ],
        ),
        onTap: () async {
          // open edit on tap as well
          final updated = await Navigator.of(context).push<Note>(
            MaterialPageRoute(builder: (_) => AddEditNoteScreen(note: note)),
          );
          if (updated != null) await _refreshNotes();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyNotes'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search notes by title or description',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : _filtered.isEmpty
          ? Center(child: Text('No notes yet. Tap + to add one.'))
          : RefreshIndicator(
        onRefresh: _refreshNotes,
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 80, top: 8),
          itemCount: _filtered.length,
          itemBuilder: (context, index) {
            final note = _filtered[index];
            return _buildNoteCard(note);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final created = await Navigator.of(context).push<Note>(
            MaterialPageRoute(builder: (_) => AddEditNoteScreen()),
          );
          if (created != null) await _refreshNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
