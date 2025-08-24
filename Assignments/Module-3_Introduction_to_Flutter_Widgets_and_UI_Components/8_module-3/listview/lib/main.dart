import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: Listview(), debugShowCheckedModeBanner: false),
  );
}

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

final List<String> names = [
  'DHARMIK',
  'ROHIT',
  'HET',
  'DHRUV',
  'BHUMAN',
  'JENISH',
  'MANAN',
  'ZEEL',
  'PRIYANSHU',
  'HARSH',
  'PAL',
  'AKASH',
  'JEINSH',
  'KANO',
  'KRISH',
  'DHRUVIK',
];

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listview Builder',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 3, 48, 94),
                child: Icon(Icons.electric_bike_sharp,color: Colors.white,),
              ),
              title: Text(
                names[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              tileColor: Color.fromARGB(255, 148, 200, 250),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              onTap: () {
                print(names[index]);
              },
              hoverColor: Colors.white,
            ),
          );
        },
        itemCount: names.length,
      ),
    );
  }
}
