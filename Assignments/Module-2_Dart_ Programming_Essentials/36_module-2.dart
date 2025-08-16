import 'dart:io';

void main() async {
  final filePath = 'E:\Flutter UI_project\chatnewapp\lib\dharmik.txt';
  final contentToWrite = 'Hello, Dharmik! This is your Dart file demo.';

  // Write to file
  try {
    final file = File(filePath);
    await file.writeAsString(contentToWrite);
    print('Data written to $filePath');
  } catch (e) {
    print('Failed to write to file: $e');
    return;
  }

  // Read from file
  try {
    final file = File(filePath);
    String contents = await file.readAsString();
    print('\nFile Contents:\n$contents');
  } catch (e) {
    print('Failed to read from file: $e');
  }
}

/*
  Data written to E:Flutter UI_projectchatnewapplibdharmik.txt

File Contents:
Hello, Dharmik! This is your Dart file demo.
   */
