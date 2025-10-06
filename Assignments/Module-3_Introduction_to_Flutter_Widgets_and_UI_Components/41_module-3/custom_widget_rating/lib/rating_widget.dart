import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final int maxRating;
  final double iconSize;
  final void Function(int rating)? onRatingSelected;

  const RatingWidget({
    Key? key,
    this.maxRating = 5,
    this.iconSize = 40,
    this.onRatingSelected,
  }) : super(key: key);

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _currentRating = 0;

  void _setRating(int rating) {
    setState(() {
      _currentRating = rating;
    });
    widget.onRatingSelected?.call(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) {
        final starIndex = index + 1;
        return GestureDetector(
          onTap: () => _setRating(starIndex),
          child: Icon(
            starIndex <= _currentRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: widget.iconSize,
          ),
        );
      }),
    );
  }
}