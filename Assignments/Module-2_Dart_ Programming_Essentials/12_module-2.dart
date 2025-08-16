import 'dart:math';

Map<String, num> findMinMax(List<num> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError("List cannot be empty.");
  }

  num smallest = numbers.reduce(min);
  num largest = numbers.reduce(max);

  return {'min': smallest, 'max': largest};
}

void main() {
  List<num> nums = [10, 5, 22, 3, 99, 7];
  var result = findMinMax(nums);
  print("Smallest: ${result['min']}");
  print("Largest: ${result['max']}");
}
/*
Smallest: 3
Largest: 99
 */