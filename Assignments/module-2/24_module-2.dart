import 'dart:io';

void main() {
  print('Enter a list of integers separated by spaces:');

  List<int> numbers = [];

  while (true) {
    stdout.write('Your input: ');
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print('Input cannot be empty. Please try again.');
      continue;
    }

    try {
      numbers = input
          .trim()
          .split(RegExp(r'\s+'))
          .map((e) => int.parse(e))
          .toList();
      break; // Exit loop if parsing succeeds
    } catch (e) {
      print('Invalid input. Please enter only integers separated by spaces.');
    }
  }

  print('\nYou entered: $numbers');
}
/*
Enter a list of integers separated by spaces:
Your input:
Input cannot be empty. Please try again.
Your input: 10 h 20 30
Invalid input. Please enter only integers separated by spaces.
Your input: 10 20 30 40 50

You entered: [10, 20, 30, 40, 50]
 */
