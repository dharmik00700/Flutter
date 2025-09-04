import 'package:checkboxtile/model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CheckBoxTile(), debugShowCheckedModeBanner: false));
}

class CheckBoxTile extends StatefulWidget {
  const CheckBoxTile({super.key});

  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

final List<taskadd> tasks = [];

class _CheckBoxTileState extends State<CheckBoxTile> {
  TextEditingController taskcontroller = TextEditingController();

  void addtask() {
    final text = taskcontroller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        tasks.add(taskadd(title: text));
        taskcontroller.clear();
      });
    }
  }

  void toggletask(int index, bool? values) {
    setState(() {
      tasks[index].isCompleted = values ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task ManageMent',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 4, 94, 122),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskcontroller,
                    decoration: InputDecoration(
                      labelText: 'Enter Task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addtask,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 4, 94, 122),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CheckboxListTile(
                        checkColor: Colors.black,
                        activeColor: Colors.yellowAccent,
                        tileColor: Color.fromARGB(219, 4, 94, 122),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Text(
                          task.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: task.isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                        value: task.isCompleted,
                        onChanged: (value) => toggletask(index, value),
                      ),
                    ),
                  );
                },
                itemCount: tasks.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
