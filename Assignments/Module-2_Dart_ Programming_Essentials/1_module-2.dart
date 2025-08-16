import 'dart:io';

void main() {
  print("Enter Your name :-");
  var username = stdin.readLineSync();

  print("Enter Your age :-");
  var ageuser = stdin.readLineSync();

  var ageint = int.parse(ageuser!);
  var leftyear = 100 - ageint;

  print(
      "Welcome, $username your age is $ageuser and your out of 100 years left year is $leftyear");
}
/*Enter Your name :-
Chansik
Enter Your age :-
19
Welcome, Chansik your age is 19 and your out of 100 years left year is 81
*/
