import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double percentage; // 0 to 100
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const ProgressBar({
    Key? key,
    required this.percentage,
    this.height = 20,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clampedPercent = percentage.clamp(0, 100);

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: clampedPercent / 100,
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}