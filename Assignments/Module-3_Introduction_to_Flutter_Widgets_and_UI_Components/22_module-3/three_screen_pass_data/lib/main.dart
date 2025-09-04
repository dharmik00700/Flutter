import 'package:flutter/material.dart';
import 'package:three_screen_pass_data/favorite_screen.dart';
import 'package:three_screen_pass_data/second_detail_screen.dart';

void main() {
  runApp(
    MaterialApp(home: First_Home_screen(), debugShowCheckedModeBanner: false),
  );
}

class First_Home_screen extends StatefulWidget {
  const First_Home_screen({super.key});

  @override
  State<First_Home_screen> createState() => _First_Home_screenState();
}

Icon first = Icon(Icons.star_border_purple500_outlined);
final List<Map<String, String>> data = [
  {'roll': '1', 'name': 'DHARMIK', 'course': 'COMPUTER ENG'},
  {'roll': '2', 'name': 'ROHIT', 'course': 'IT'},
  {'roll': '3', 'name': 'HET', 'course': 'AL/ML'},
  {'roll': '4', 'name': 'JENISH', 'course': 'CIVIL'},
  {'roll': '5', 'name': 'HARSH', 'course': 'CHEMICAL'},
  {'roll': '6', 'name': 'DHRUV', 'course': 'ELECTRIC'},
  {'roll': '7', 'name': 'BHUMAN', 'course': 'DOCTOR'},
  {'roll': '8', 'name': 'PRIYANSHU', 'course': 'AL/ML'},
  {'roll': '9', 'name': 'ZEEL', 'course': 'IT'},
  {'roll': '10', 'name': 'KRISH', 'course': 'CIVIL'},
  {'roll': '11', 'name': 'DHRUVIK', 'course': 'CHEMICAL'},
  {'roll': '12', 'name': 'AAKASH', 'course': 'ELECTRIC'},
  {'roll': '13', 'name': 'NISHIT', 'course': 'DOCTOR'},
  {'roll': '14', 'name': 'KRISH', 'course': 'COMPUTER'},
  {'roll': '15', 'name': 'ROCKY', 'course': 'IT'},
  {'roll': '16', 'name': 'LASH', 'course': 'CIVIL'},
  {'roll': '17', 'name': 'PARTH', 'course': 'CHEMICAL'},
  {'roll': '18', 'name': 'DHRUVAL', 'course': 'ELECTRIC'},
  {'roll': '19', 'name': 'CHANDAN', 'course': 'DOCTOR'},
  {'roll': '20', 'name': 'JAY', 'course': 'COMPUTER'},
  {'roll': '10', 'name': 'KRISH', 'course': 'IT'},
  {'roll': '21', 'name': 'BHAVIK', 'course': 'CIVIL'},
  {'roll': '22', 'name': 'VAIBHAV', 'course': 'CHEMICAL'},
  {'roll': '23', 'name': 'KANO', 'course': 'ELECTRIC'},
  {'roll': '24', 'name': 'VRAJ', 'course': 'DOCTOR'},
  {'roll': '25', 'name': 'AJAY', 'course': 'IT'},
  {'roll': '26', 'name': 'JIGAR', 'course': 'CIVIL'},
  {'roll': '27', 'name': 'JEINSH', 'course': 'CHEMICAL'},
  {'roll': '28', 'name': 'UTSAV', 'course': 'ELECTRIC'},
  {'roll': '29', 'name': 'DARSHAN', 'course': 'DOCTOR'},
  {'roll': '30', 'name': 'MANTRA', 'course': 'COMPUTER'},
];
List<bool> start = List.generate(data.length, (_) => false);

class _First_Home_screenState extends State<First_Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 70, 6, 101),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    FavoriteScreen(values: data, start: start),
              ),
            );
          });
        },
        child: Icon(Icons.add, size: 30),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final student = data[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondDetailScreen(
                          name: student['name'].toString(),
                          course: student['course'].toString(),
                          roll: student['roll'].toString(),
                        ),
                      ),
                    );
                  });
                },
                trailing: InkWell(
                  child: start[index]
                      ? Icon(Icons.star)
                      : Icon(Icons.star_border_purple500_outlined),
                  onTap: () {
                    setState(() {
                      start[index] = !start[index];
                    });
                  },
                  onDoubleTap: () {
                    setState(() {});
                  },
                ),
                tileColor: Color.fromARGB(255, 207, 143, 239),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Text(
                  student['name'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text('Course: ${student['course'] ?? ''}'),
                leading: CircleAvatar(child: Text(student['roll'] ?? '')),
              ),
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
