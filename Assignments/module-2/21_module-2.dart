import 'dart:io';

void main() {
  try {
    stdout.write('Enter numerator: ');
    double numerator = double.parse(stdin.readLineSync()!);

    stdout.write('Enter denominator: ');
    double denominator = double.parse(stdin.readLineSync()!);

    double result = divide(numerator, denominator);
    print('Result: $numerator ÷ $denominator = ${result.toStringAsFixed(2)}');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}

double divide(double a, double b) {
  if (b == 0) {
    throw Exception('Division by zero is not allowed.');
  }
  return a / b;
}

/*
Enter numerator: 12
Enter denominator: 4
Result: 12.0 ÷ 4.0 = 3.00
 */
