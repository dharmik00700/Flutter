import 'package:api_call/api_service.dart';
import 'package:flutter/material.dart';

class ScreenWithoutMultiValueModel extends StatefulWidget {
  const ScreenWithoutMultiValueModel({super.key});

  @override
  State<ScreenWithoutMultiValueModel> createState() =>
      _ScreenWithoutMultiValueModelState();
}

class _ScreenWithoutMultiValueModelState
    extends State<ScreenWithoutMultiValueModel> {
  dynamic values = [];
  bool isLoading = false;

  _getdata() {
    isLoading = true;
    ApiService().getwithoutmodel().then((value) {
      setState(() {
        values = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api call Without Model'),
        backgroundColor: Colors.pink,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Text(values[index]["id"].toString()),
                    title: Text(values[index]["title"].toString()),
                    subtitle: Text(values[index]["body"].toString()),
                  ),
                );
              },
            ),
    );
  }
}
