// Higher-order function
List<double> transformList(List<int> numbers, double Function(int) operation) {
  return numbers.map(operation).toList();
}

// Operations
double square(int x) => x * x.toDouble();
double cube(int x) => x * x * x.toDouble();
double half(int x) => x / 2;

void main() {
  List<int> numbers = [2, 4, 6, 8, 10];

  print('Original List: $numbers');

  List<double> squares = transformList(numbers, square);
  print('Squares: $squares');

  List<double> cubes = transformList(numbers, cube);
  print('Cubes: $cubes');

  List<double> halves = transformList(numbers, half);
  print('Halves: $halves');
}
/*
Original List: [2, 4, 6, 8, 10]
Squares: [4.0, 16.0, 36.0, 64.0, 100.0]
Cubes: [8.0, 64.0, 216.0, 512.0, 1000.0]
Halves: [1.0, 2.0, 3.0, 4.0, 5.0]
 */