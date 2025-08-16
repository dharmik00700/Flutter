import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  final target = random.nextInt(100) + 1; // Random number between 1 and 100
  int? guess;

  // Lambda function for hint
  var hint = (int guess) => guess > target
      ? 'Too high!'
      : guess < target
      ? 'Too low!'
      : 'Correct!';

  print('Guess the number between 1 and 100');

  do {
    stdout.write('Enter your guess: ');
    guess = int.tryParse(stdin.readLineSync() ?? '');

    if (guess == null) {
      print('Invalid input. Please enter a number.');
      continue;
    }

    print(hint(guess));
  } while (guess != target);

  print('You guessed it!');
}
/*
Guess the number between 1 and 100
Enter your guess: 20
Too low!
Enter your guess: 50
Too low!
Enter your guess: 60
Too low!
Enter your guess: 70
Too low!
Enter your guess: 80
Too low!
Enter your guess: 90
Too high!
Enter your guess: 81
Too low!
Enter your guess: 82
Too low!
Enter your guess: 83
Correct!
You guessed it!
 */