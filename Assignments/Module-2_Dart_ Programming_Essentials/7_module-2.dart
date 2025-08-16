import 'dart:io';

void main() {
  stdout.write("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  if (isPrime(number)) {
    print("$number is a prime number.");
  } else {
    print("$number is not a prime number.");
  }
}

bool isPrime(int num) {
  if (num <= 1) return false;
  if (num == 2) return true;
  if (num % 2 == 0) return false;

  for (int i = 3; i <= num ~/ 2; i += 2) {
    if (num % i == 0) return false;
  }
  return true;
}
/*
Enter a number: 13
13 is a prime number.
 */
