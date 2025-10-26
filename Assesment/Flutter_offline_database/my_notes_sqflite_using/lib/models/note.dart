// lib/models/note.dart
class Note {
  final int? id;
  final String title;
  final String description;
  final String createdAt;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  Note copyWith({int? id, String? title, String? description, String? createdAt}) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'description': description,
      'created_at': createdAt,
    };
    if (id != null) map['id'] = id;
    return map;
  }
}
