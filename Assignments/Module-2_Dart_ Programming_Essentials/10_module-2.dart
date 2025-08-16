import 'dart:io';

bool isPalindrome(String input) {
  String cleaned = input.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  String reversed = cleaned.split('').reversed.join('');
  return cleaned == reversed;
}

void main() {

  while (true) {
    stdout.write('Please Enter Palindrome Values: ');
    String? testString = stdin.readLineSync();
    if (testString!.isEmpty) {
      print('Please Enter Values');
    } else {
      if (isPalindrome(testString)) {
        print("'$testString' is a palindrome.");
      } else {
        print("'$testString' is not a palindrome.");
      }
    }
  }
}
/*
Please Enter Palindrome Values: level
'level' is a palindrome.
Please Enter Palindrome Values: bhai
'bhai' is not a palindrome.
Please Enter Palindrome Values:
 */