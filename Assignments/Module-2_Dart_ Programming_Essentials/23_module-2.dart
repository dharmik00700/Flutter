import 'dart:io';

void main() {
  print('Welcome to Dart Calculator');

  double num1 = getValidNumber('Enter first number: ');
  double num2 = getValidNumber('Enter second number: ');

  stdout.write('Choose operation (+, -, *, /): ');
  String? operation = stdin.readLineSync();

  double? result;

  try {
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) throw Exception('Division by zero is not allowed.');
        result = num1 / num2;
        break;
      default:
        throw Exception('Invalid operation selected.');
    }

    print('Result: $num1 $operation $num2 = ${result.toStringAsFixed(2)}');
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}

double getValidNumber(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();

    try {
      if (input == null || input.isEmpty) throw FormatException('Input cannot be empty.');
      return double.parse(input);
    } catch (e) {
      print('Invalid input. Please enter a valid number.');
    }
  }
}
/*
Welcome to Dart Calculator
Enter first number:
Invalid input. Please enter a valid number.
Enter first number:
Invalid input. Please enter a valid number.
Enter first number: 10
Enter second number:
Invalid input. Please enter a valid number.
Enter second number: 20
Choose operation (+, -, *, /):
Error: Exception: Invalid operation selected.
 */