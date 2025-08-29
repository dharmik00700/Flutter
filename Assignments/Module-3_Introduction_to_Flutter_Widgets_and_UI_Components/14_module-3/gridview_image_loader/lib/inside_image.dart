import 'package:flutter/material.dart';
import 'package:gridview_image_loader/main.dart';

class Inside_Image extends StatefulWidget {
  const Inside_Image({super.key, required this.brand});

  final String? brand;

  @override
  State<Inside_Image> createState() => _Inside_ImageState();
}

List<Map<String, String>> brancar = [
  {
    'brand':
        'https://images.pexels.com/photos/3764984/pexels-photo-3764984.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
];

class _Inside_ImageState extends State<Inside_Image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          brand.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 215, 243),
      ),
    );
  }
}
