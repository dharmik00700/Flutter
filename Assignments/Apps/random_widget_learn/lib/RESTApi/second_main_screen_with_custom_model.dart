import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondMainScreenWithCustomModel extends StatefulWidget {
  const SecondMainScreenWithCustomModel({super.key});

  @override
  State<SecondMainScreenWithCustomModel> createState() =>
      _SecondMainScreenWithCustomModelState();
}

class _SecondMainScreenWithCustomModelState
    extends State<SecondMainScreenWithCustomModel> {
  List<photos> photoslist = [];

  Future<List<photos>> ftechdata() async {
    final responce = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/photos"),
    );
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      photoslist.clear();
      for (Map i in data) {
        photoslist.add(photos(title: i['title'], url: i['url']));
      }
      return photoslist;
    }
    return photoslist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Model'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: ftechdata(),
              builder: (context, AsyncSnapshot<List<photos>> snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: photoslist.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(
                          'Title : ${snapshot.data![index].title.toString()}',
                        ),
                        subtitle: Text(
                          'url : ${snapshot.data![index].url.toString()}',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class photos {
  String? url, title;

  photos({required this.title, required this.url});
}
