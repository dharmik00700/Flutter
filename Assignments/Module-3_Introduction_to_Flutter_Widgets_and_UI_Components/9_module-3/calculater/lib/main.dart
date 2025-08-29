import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: Calculater_Screen(), debugShowCheckedModeBanner: false),
  );
}

class Calculater_Screen extends StatefulWidget {
  const Calculater_Screen({super.key});

  @override
  State<Calculater_Screen> createState() => _Calculater_ScreenState();
}

class _Calculater_ScreenState extends State<Calculater_Screen> {
  double? total;
bool istrue=false;
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromARGB(255, 248, 238, 204),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 212,
            decoration: BoxDecoration(
              color: Color.fromARGB(0, 241, 8, 8),
              border: Border.all(width: 3, color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextField(
                  enabled: true,
                  keyboardType: TextInputType.number,
                  controller: n1,

                  style: TextStyle(fontSize: 25, color: Colors.black),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 2),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: n2,
                  decoration: InputDecoration(
                    enabled: false,border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(0, 12, 45, 78))),
                  ),
                  enabled: true,
                  style: TextStyle(fontSize: 25, color: Colors.black),
                  textAlign: TextAlign.end,
                ),
                Text(
                  'Result : ${n1.text.isEmpty ? '' : istrue == true ? total : 'Please press equal to'}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 500,
            color: Color.fromARGB(255, 248, 225, 195),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 13,
                crossAxisSpacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        n1.clear();
                        n2.clear();
                        istrue = false;
                      });
                    },
                    child: Text(
                      'C',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '5',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '6',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        total = int.parse(n1.text) / int.parse(n2.text);
                      });
                    },
                    child: Text(
                      '/',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '7',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '8',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '9',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        total = double.parse(n1.text) * double.parse(n2.text);
                      });
                    },
                    child: Text(
                      'X',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '10',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        total = double.parse(n1.text) + double.parse(n2.text);
                      });
                    },
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '00',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        total = double.parse(n1.text) % double.parse(n2.text);
                      });
                    },
                    child: Text(
                      '%',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        istrue = !istrue;
                      });
                    },
                    child: Text(
                      '=',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        total = double.parse(n1.text) - double.parse(n2.text);
                      });
                    },
                    child: Text(
                      '-',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
