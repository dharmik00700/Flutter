import 'package:flutter/material.dart';
import 'rating_widget.dart';

class RatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int selectedRating = 0;

    return Scaffold(
      appBar: AppBar(title: Text('Rate Us'),backgroundColor: Colors.redAccent,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingWidget(
              onRatingSelected: (rating) {
                selectedRating = rating;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You rated: $rating stars')),
                );
              },
            ),
            SizedBox(height: 20),
            Text('Tap a star to rate', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}