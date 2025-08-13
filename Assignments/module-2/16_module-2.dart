import 'dart:io';

void main() {
  Map<String, String> addressBook = {};

  while (true) {
    print("\nAddress Book Menu:");
    print("1. Add Entry");
    print("2. Update Entry");
    print("3. Remove Entry");
    print("4. View All Entries");
    print("5. Exit");

    stdout.write("Choose an option (1–5): ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter phone number: ");
        String phone = stdin.readLineSync()!;
        addressBook[name] = phone;
        print("Entry added.");
        break;

      case '2':
        stdout.write("Enter name to update: ");
        String name = stdin.readLineSync()!;
        if (addressBook.containsKey(name)) {
          stdout.write("Enter new phone number: ");
          String newPhone = stdin.readLineSync()!;
          addressBook[name] = newPhone;
          print("Entry updated.");
        } else {
          print("Name not found.");
        }
        break;

      case '3':
        stdout.write("Enter name to remove: ");
        String name = stdin.readLineSync()!;
        if (addressBook.remove(name) != null) {
          print("Entry removed.");
        } else {
          print("Name not found.");
        }
        break;

      case '4':
        print("\nAddress Book Entries:");
        if (addressBook.isEmpty) {
          print("No entries found.");
        } else {
          addressBook.forEach((name, phone) {
            print("$name : $phone");
          });
        }
        break;

      case '5':
        print("Exiting Address Book. Goodbye!");
        return;

      default:
        print("Invalid option. Please choose between 1 and 5.");
    }
  }
}
/*
1. Add Entry
2. Update Entry
3. Remove Entry
4. View All Entries
5. Exit
Choose an option (1–5): 1
Enter name: dharmik
Enter phone number: 9484560730
Entry added.

Address Book Menu:
1. Add Entry
2. Update Entry
3. Remove Entry
4. View All Entries
5. Exit
Choose an option (1–5): 4

Address Book Entries:
dharmik : 9484560730

Address Book Menu:
1. Add Entry
2. Update Entry
3. Remove Entry
4. View All Entries
5. Exit
Choose an option (1–5):
 */