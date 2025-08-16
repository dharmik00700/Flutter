
Stream<int> generateIntegers(int count) async* {
  for (int i = 1; i <= count; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  int maxCount = 5;

  print('Starting integer stream (up to $maxCount)...');

  await for (int number in generateIntegers(maxCount)) {
    print('Emitted: $number');
  }

  print('Stream completed.');
}
/*
Starting integer stream (up to 5)...
Emitted: 1
Emitted: 2
Emitted: 3
Emitted: 4
Emitted: 5
Stream completed.
 */