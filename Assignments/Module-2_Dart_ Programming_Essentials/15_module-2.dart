import 'dart:io';

void main() {
  stdout.write("Enter a string: ");
  String input = stdin.readLineSync()!;

  Map<String, int> charFrequency = {};

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    if (charFrequency.containsKey(char)) {
      charFrequency[char] = charFrequency[char]! + 1;
    } else {
      charFrequency[char] = 1;
    }
  }

  print("Character Frequencies:");
  charFrequency.forEach((char, count) {
    print("'$char' : $count");
  });
}
/*
Enter a string: helloworld
Character Frequencies:
'h' : 1
'e' : 1
'l' : 3
'o' : 2
'w' : 1
'r' : 1
'd' : 1
 */