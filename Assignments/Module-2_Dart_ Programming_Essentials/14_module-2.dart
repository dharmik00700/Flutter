import 'dart:io';

void main() {
  stdout.write("Enter words separated by spaces: ");
  List<String> words = stdin.readLineSync()!
      .split(' ')
      .map((word) => word.toLowerCase())
      .toList();

  // Remove duplicates using a Set
  Set<String> uniqueWords = Set.from(words);

  // Convert back to list and sort alphabetically
  List<String> sortedWords = uniqueWords.toList()..sort();

  print("📝 Unique words in alphabetical order:");
  for (var word in sortedWords) {
    print(word);
  }
}
/*
Enter words separated by spaces: a b c d e f g h i j k a b
📝 Unique words in alphabetical order:
a
b
c
d
e
f
g
h
i
j
k
 */