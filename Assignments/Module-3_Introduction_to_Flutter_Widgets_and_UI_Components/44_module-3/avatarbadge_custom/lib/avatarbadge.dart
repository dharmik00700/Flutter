import 'package:flutter/material.dart';

class AvatarBadge extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;
  final double radius;

  const AvatarBadge({
    Key? key,
    required this.imageUrl,
    this.isOnline = false,
    this.radius = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage(imageUrl),
        ),
        if (isOnline)
          Positioned(
            bottom: 6,
            right: 6,
            child: Container(
              width: radius * 0.4,
              height: radius * 0.4,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}