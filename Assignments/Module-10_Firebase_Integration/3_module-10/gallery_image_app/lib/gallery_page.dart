import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('gallery').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final docs = snapshot.data!.docs;
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final url = docs[index]['url'];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(url, fit: BoxFit.cover),
              );
            },
          );
        },
      ),
    );
  }
}