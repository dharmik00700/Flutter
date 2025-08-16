import 'dart:io';
import 'dart:math';

void main() {
  const double piValue = pi;

  stdout.write("Enter the radius of the circle: ");
  double radius = double.parse(stdin.readLineSync()!);

  double area = piValue * radius * radius;
  double circumference = 2 * piValue * radius;

  print("Area of the circle: ${area.toStringAsFixed(2)}");
  print("Circumference of the circle: ${circumference.toStringAsFixed(2)}");
}
/*
Enter the radius of the circle: 25
Area of the circle: 1963.50
Circumference of the circle: 157.08
*/