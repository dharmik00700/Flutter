import 'dart:io';

void main() {
  stdout.write("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync()!);

  print("\nChoose an operation:");
  print(" + : Addition");
  print(" - : Subtraction");
  print(" * : Multiplication");
  print(" / : Division");

  stdout.write("Enter your choice: ");
  String? choice = stdin.readLineSync();

  double result;

  switch (choice) {
    case '+':
      result = num1 + num2;
      print("Result: $num1 + $num2 = ${result.toStringAsFixed(2)}");
      break;
    case '-':
      result = num1 - num2;
      print("Result: $num1 - $num2 = ${result.toStringAsFixed(2)}");
      break;
    case '*':
      result = num1 * num2;
      print("Result: $num1 * $num2 = ${result.toStringAsFixed(2)}");
      break;
    case '/':
      if (num2 != 0) {
        result = num1 / num2;
        print("Result: $num1 / $num2 = ${result.toStringAsFixed(2)}");
      } else {
        print("Error: Division by zero is not allowed.");
      }
      break;
    default:
      print("Invalid operation selected.");
  }
}
/*
Enter first number: 12
Enter second number: 21

Choose an operation:
 + : Addition
 - : Subtraction
 * : Multiplication
 / : Division
Enter your choice: +
Result: 12.0 + 21.0 = 33.00
*/