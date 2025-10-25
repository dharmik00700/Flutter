import 'package:flutter/material.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hero Animation',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final String imageUrl = 'https://picsum.photos/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SecondScreen(imageUrl: imageUrl),
              ),
            );
          },
          child: Hero(
            tag: 'hero-image',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, width: 150, height: 150),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String imageUrl;

  SecondScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Full View')),
      body: Center(
        child: Hero(tag: 'hero-image', child: Image.network(imageUrl)),
      ),
    );
  }
}
