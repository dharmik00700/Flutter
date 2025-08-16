import 'dart:io';

void main() {
  stdout.write('Enter the file path: ');
  String? filePath = stdin.readLineSync();

  if (filePath == null || filePath.isEmpty) {
    print('Error: No file path provided.');
    return;
  }

  try {
    File file = File(filePath);
    String contents = file.readAsStringSync();
    print('\nFile Contents:\n');
    print(contents);
  } on FileSystemException catch (e) {
    print('File not found or cannot be read.');
    print('Details: ${e.message}');
  } catch (e) {
    print(' Unexpected error: $e');
  }finally{
    print('finally block');
  }
}
/*
Enter the file path: dharmik.txt
File not found or cannot be read.
Details: Cannot open file
finally block
 */