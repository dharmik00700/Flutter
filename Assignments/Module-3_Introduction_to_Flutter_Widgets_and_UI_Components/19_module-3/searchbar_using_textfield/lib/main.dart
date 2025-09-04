import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SearchBar(), debugShowCheckedModeBanner: false));
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

final List<String> allitems = [
  'Apple',
  'Banana',
  'Orange',
  'Mango',
  'Grapes',
  'Strawberry',
  'Pineapple',
  'Watermelon',
  'Kiwi',
  'Blueberry',
  'Peach',
  'Cherry',
  'Pear',
  'Plum',
  'Raspberry',
  'Lemon',
  'Avocado',
  'Pomegranate',
  'Coconut',
  'Papaya',
];
List<String> filteredsearchs = [];
String? values;
class _SearchBarState extends State<SearchBar> {
  TextEditingController contriller = TextEditingController();

  void filtersearch(String values) {
    setState(() {
      filteredsearchs = allitems
          .where((items) => items.toLowerCase().contains(values.toLowerCase()))
          .toList();
    });
  }

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
        backgroundColor: Color.fromARGB(255, 104, 3, 145),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: contriller,
              onChanged: filtersearch,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 10, 20, 30),
                ),
                hintText: '$values',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(width: 3),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(onTap: (){
                    setState(() {
                      values = filteredsearchs[index];

                    });
                  },title: Text(filteredsearchs[index]),tileColor: Colors.white30,);
                },
                itemCount: filteredsearchs.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
