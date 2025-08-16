import 'dart:io';

void main() {
  stdout.write('Please Enter Palindrome Values: ');
  String? testterms = stdin.readLineSync();
  int terms = int.parse(testterms!);
  print("Fibonacci series up to $terms terms:");
  for (int i = 0; i < terms; i++) {
    print(fibonacci(i));
  }
}

int fibonacci(int n) {
  if (n == 0) return 0;
  if (n == 1) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
/*
Please Enter Palindrome Values: 5
Fibonacci series up to 5 terms:
0
1
1
2
3
 */