import 'package:flutter/material.dart';

class HeroWidgets extends StatefulWidget {
  const HeroWidgets({super.key});

  @override
  State<HeroWidgets> createState() => _HeroWidgetsState();
}

class _HeroWidgetsState extends State<HeroWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Herodetail(index: index),
                  ),
                );
              },
              child: Hero(
                tag: 'image$index',
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: NetworkImage('https://picsum.photos/200/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Herodetail extends StatelessWidget {
  const Herodetail({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hero animation show '),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Hero(
            tag: 'image-$index',
            child: Container(
              width: double.maxFinite,
              height: 400,
              child: Image(
                image: NetworkImage('https://picsum.photos/200/300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('Hero images'),
        ],
      ),
    );
  }
}
