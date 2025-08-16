import 'dart:io';

void main() {
  stdout.write("Enter a number: ");
  String? input = stdin.readLineSync();

  int? number = int.tryParse(input ?? '');

  if (number == null) {
    print("Invalid input. Please enter a valid integer.");
    return;
  }

  if (number % 2 == 0) {
    print("$number is even.");
  } else {
    print("$number is odd.");
  }
}
/*
Enter a number: 7
7 is odd.
*/