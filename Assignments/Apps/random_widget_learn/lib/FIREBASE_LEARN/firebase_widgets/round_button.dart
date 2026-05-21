import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool isLoading;
  final VoidCallback ontap;

  const RoundButton({
    super.key,
    required this.title,
    required this.ontap,
    required this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(8),
        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 0.7,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
