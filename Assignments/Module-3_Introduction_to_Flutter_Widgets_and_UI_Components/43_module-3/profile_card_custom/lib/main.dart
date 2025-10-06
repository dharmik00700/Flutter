import 'package:flutter/material.dart';
import 'package:profile_card_custom/profilecard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text('Profile Card')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileCard(
                name: 'Dharmik Makvana',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUiA2A0u7fGqpyKSYCqUbwTZvBSANLujyydw&s',
                bio:
                    'Flutter developer passionate about UI design, animations, and clean code.',
              ),
              ProfileCard(
                name: 'Dharmik Makvana',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUiA2A0u7fGqpyKSYCqUbwTZvBSANLujyydw&s',
                bio:
                    'Flutter developer passionate about UI design, animations, and clean code.',
              ),
              ProfileCard(
                name: 'Dharmik Makvana',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUiA2A0u7fGqpyKSYCqUbwTZvBSANLujyydw&s',
                bio:
                    'Flutter developer passionate about UI design, animations, and clean code.',
              ),
              ProfileCard(
                name: 'Dharmik Makvana',
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUiA2A0u7fGqpyKSYCqUbwTZvBSANLujyydw&s',
                bio:
                    'Flutter developer passionate about UI design, animations, and clean code.',
              ),
              ProfileCard(
                name: 'Dharmik Makvana',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUiA2A0u7fGqpyKSYCqUbwTZvBSANLujyydw&s',
                bio:
                'Flutter developer passionate about UI design, animations, and clean code.',
              ),
              ProfileCard(
                name: 'Dharmik Makvana',
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUiA2A0u7fGqpyKSYCqUbwTZvBSANLujyydw&s',
                bio:
                'Flutter developer passionate about UI design, animations, and clean code.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
