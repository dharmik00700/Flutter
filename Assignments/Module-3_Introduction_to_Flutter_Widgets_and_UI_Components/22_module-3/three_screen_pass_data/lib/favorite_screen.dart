import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.values, required this.start});

  final List<Map<String, String>> values;
  final List<bool> start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Student List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 125, 142, 241),
      ),
      backgroundColor: Color.fromARGB(255, 10, 20, 10),
      body: Center(
        child: Column(
          children: [
            for (int i = 0; i < values.length; i++)
              if (start[i])
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(values[i]['roll']!),),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    tileColor: Color.fromARGB(255, 0, 255, 255),
                    title: Text(values[i]['name']!,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text(values[i]['course']!),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
