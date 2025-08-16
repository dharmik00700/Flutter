import 'package:path/path.dart' as p;

void main() {
  String filePath = 'E:\Flutter UI_project\chatnewapp\lib\dharmik.txt';

  // Extract components
  String directory = p.dirname(filePath);
  String filename = p.basename(filePath);
  String extension = p.extension(filePath);

  print('Directory: $directory');
  print('Filename: $filename');
  print('Extension: $extension');
}
/*
Directory: .
Filename: E:Flutter UI_projectchatnewapplibdharmik.txt
Extension: .txt
 */