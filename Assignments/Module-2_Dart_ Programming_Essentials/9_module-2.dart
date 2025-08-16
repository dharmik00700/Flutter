import 'dart:io';

void main() {
  stdout.write("Enter a non-negative integer: ");
  int number = int.parse(stdin.readLineSync()!);

  if (number < 0) {
    print("Factorial is not defined for negative numbers.");
  } else {
    int result = factorial(number);
    print("Factorial of $number is: $result");
  }
}

int factorial(int n) {
  if (n == 0 || n == 1) return 1;
  return n * factorial(n - 1);
}
/*
Enter a non-negative integer: 6
Factorial of 6 is: 720
 */