import 'package:api_call/api_service.dart';
import 'package:api_call/post_model.dart';
import 'package:flutter/material.dart';

class ScreenWithMultiValuesModel extends StatefulWidget {
  const ScreenWithMultiValuesModel({super.key});

  @override
  State<ScreenWithMultiValuesModel> createState() =>
      _ScreenWithMultiValuesModelState();
}

class _ScreenWithMultiValuesModelState
    extends State<ScreenWithMultiValuesModel> {
  List<postmodel> singlepost = [];
  bool isLoading = false;

  _getpost() {
    isLoading = true;
    ApiService().getpostmodel().then((value) {
      setState(() {
        singlepost = value!;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _getpost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi value Api Data')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: singlepost.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(singlepost[index].id.toString()),
                    title: Text(singlepost[index].title.toString()),
                    subtitle: Text(singlepost[index].body.toString()),
                  ),
                );
              },
            ),
    );
  }
}
