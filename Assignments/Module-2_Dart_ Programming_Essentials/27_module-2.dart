import 'dart:async';

Future<String> fetchUser(int id) async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 2));
  return 'User $id';
}

Future<void> fetchAllUsers() async {
  print('Fetching users...');

  List<Future<String>> userFutures = [];

  // Simulate fetching 5 users
  for (int i = 1; i <= 5; i++) {
    userFutures.add(fetchUser(i));
  }

  // Wait for all users to be fetched
  List<String> users = await Future.wait(userFutures);

  print('All users loaded:');
  for (var user in users) {
    print(user);
  }
}

void main() {
  fetchAllUsers();
}
/*
Fetching users...
All users loaded:
User 1
User 2
User 3
User 4
User 5
 */