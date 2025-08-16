void main() {
  // Original lists
  List<int> list1 = [3, 5, 7, 9];
  List<int> list2 = [1, 3, 5, 11];
  List<int> list3 = [2, 4, 6, 8, 9];

  // Combine using spread operator
  List<int> combinedList = [...list1, ...list2, ...list3];

  print('Combined List: $combinedList');

  // Remove duplicates using Set, then convert back to List
  List<int> uniqueList = combinedList.toSet().toList();

  print('Unique List: $uniqueList');

  // Sort in ascending order
  uniqueList.sort();

  print('Sorted List: $uniqueList');
}
/*
Combined List: [3, 5, 7, 9, 1, 3, 5, 11, 2, 4, 6, 8, 9]
Unique List: [3, 5, 7, 9, 1, 11, 2, 4, 6, 8]
Sorted List: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11]
 */