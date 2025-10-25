class Task {
  int? id;
  String title;
  String? description;
  int isDone; // 0 = false, 1 = true
  String createdAt;

  Task({
    this.id,
    required this.title,
    this.description,
    this.isDone = 0,
    String? createdAt,
  }) : createdAt = createdAt ?? DateTime.now().toIso8601String();

  // Convert Task -> Map for SQLite
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'description': description,
      'isDone': isDone,
      'createdAt': createdAt,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  // Create Task from Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int?,
      title: map['title'] as String,
      description: map['description'] as String?,
      isDone: map['isDone'] as int? ?? 0,
      createdAt: map['createdAt'] as String,
    );
  }
}
