import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class Task {
  final String title;

  Task(this.title);

  Map<String, dynamic> toJson() => {'title': title};

  factory Task.fromJson(Map<String, dynamic> json) => Task(json['title']);
}

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]) {
    _loadTasks();
  }

  void addTask(String title) {
    state = [...state, Task(title)];
    _saveTasks();
  }

  void removeTask(int index) {
    state = [...state]..removeAt(index);
    _saveTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('tasks') ?? [];
    state = jsonList.map((e) => Task.fromJson(json.decode(e))).toList();
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = state.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('tasks', jsonList);
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod To-Do',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      ref
                          .read(taskProvider.notifier)
                          .addTask(_controller.text.trim());
                      _controller.clear();
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? Center(child: Text('No tasks yet'))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (_, index) {
                      final task = tasks[index];
                      return ListTile(
                        title: Text(task.title),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () =>
                              ref.read(taskProvider.notifier).removeTask(index),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
