import 'dart:io';

void main() {
  stdout.write("Enter the student's score (0–100): ");
  int score = int.parse(stdin.readLineSync()!);

  String grade;

  if (score >= 90 && score <= 100) {
    grade = 'A';
  } else if (score >= 80 && score <= 89) {
    grade = 'B';
  } else if (score >= 70 && score <= 79) {
    grade = 'C';
  } else if (score >= 60 && score <= 69) {
    grade = 'D';
  } else if (score >= 0 && score < 60) {
    grade = 'F';
  } else {
    grade = 'Invalid score';
  }

  print("Grade: $grade");
}
/*
Enter the student's score (0–100): 99
Grade: A
*/