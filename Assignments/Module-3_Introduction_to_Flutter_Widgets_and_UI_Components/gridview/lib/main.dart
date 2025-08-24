import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Image_Show());
  }
}

class Image_Show extends StatefulWidget {
  const Image_Show({super.key});

  @override
  State<Image_Show> createState() => _Image_ShowState();
}

final List<String> iamgesurl = [
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=2070&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1528702748617-c64d49f918af?q=80&w=2070&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1531218150217-54595bc2b934?q=80&w=1932&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1506929562872-bb421503ef21?q=80&w=1974&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=2070&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1528702748617-c64d49f918af?q=80&w=2070&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1531218150217-54595bc2b934?q=80&w=1932&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1506929562872-bb421503ef21?q=80&w=1974&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=2070&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1528702748617-c64d49f918af?q=80&w=2070&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1531218150217-54595bc2b934?q=80&w=1932&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1506929562872-bb421503ef21?q=80&w=1974&auto=format&fit=crop',
];

class _Image_ShowState extends State<Image_Show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gridview Show Image',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: iamgesurl.map((url) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
