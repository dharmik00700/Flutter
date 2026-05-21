import 'package:flutter/material.dart';
import 'package:random_widget_learn/http_learn/http_model.dart';
import 'package:http/http.dart' as http;

class LearnParepose extends StatefulWidget {
  const LearnParepose({super.key});

  @override
  State<LearnParepose> createState() => _LearnPareposeState();
}

class _LearnPareposeState extends State<LearnParepose> {
  late final Future<List<SamplePosts>> sampledata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampledata = getapidata();
  }

  Future<List<SamplePosts>> getapidata() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    if (response.statusCode == 200) {
      return samplePostsFromJson(response.body);
    } else {
      return throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Parepose', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<SamplePosts>>(
        future: sampledata,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            var postdata = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final post = postdata![index];
                return ListTile(
                  leading: CircleAvatar(child: Text(post.id.toString())),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
