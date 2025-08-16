import 'dart:io';

void main() {
  stdout.write("Enter integers separated by spaces: ");
  List<int> numbers = stdin.readLineSync()!
      .split(' ')
      .map((e) => int.parse(e))
      .toList();

  List<int> ascending = bubbleSort(List.from(numbers), ascending: true);
  List<int> descending = bubbleSort(List.from(numbers), ascending: false);

  print("Ascending Order: $ascending");
  print("Descending Order: $descending");
}

List<int> bubbleSort(List<int> list, {bool ascending = true}) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      bool shouldSwap = ascending
          ? list[j] > list[j + 1]
          : list[j] < list[j + 1];
      if (shouldSwap) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}
/*
Enter integers separated by spaces: 10 20 30 40 50
Ascending Order: [10, 20, 30, 40, 50]
Descending Order: [50, 40, 30, 20, 10]
 */