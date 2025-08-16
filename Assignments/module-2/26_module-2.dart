import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

  print('Fetching data...');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data loaded successfully:');
      print('Title: ${data['title']}');
      print('Body: ${data['body']}');
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}
/*
Fetching data...
Data loaded successfully:
Title: sunt aut facere repellat provident occaecati excepturi optio reprehenderit
Body: quia et suscipit
suscipit recusandae consequuntur expedita et cum
reprehenderit molestiae ut ut quas totam
nostrum rerum est autem sunt rem eveniet architecto
 */