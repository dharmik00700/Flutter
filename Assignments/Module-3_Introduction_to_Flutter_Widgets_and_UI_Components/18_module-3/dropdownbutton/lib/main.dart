import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: DropDownButton(), debugShowCheckedModeBanner: false),
  );
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

final List<String> feedbackOptions = ['Excellent', 'Good', 'Average', 'Poor'];
String? selecteditem;

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 215, 243),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  labelText: 'Name :',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 35, 225, 25),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 175, 241, 171),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
            ),
            DropdownButton(
              borderRadius: BorderRadius.circular(20),
              dropdownColor: Color.fromARGB(0, 10, 20, 30),
              hint: Text('Select Feedback'),
              value: selecteditem,
              items: feedbackOptions.map((items) {
                return DropdownMenuItem(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(items,style: TextStyle(color: Color.fromARGB(
                      255, 0, 0, 0)),),
                ), value: items);
              }).toList(),
              onChanged: (values) {
                setState(() {
                  selecteditem = values;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextField(
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter Your Feeback',
                  labelText: 'Feedback :',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 35, 225, 25),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 175, 241, 171),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
