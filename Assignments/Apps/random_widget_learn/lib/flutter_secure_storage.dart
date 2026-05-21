import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageLearn extends StatefulWidget {
  const FlutterSecureStorageLearn({super.key});

  @override
  State<FlutterSecureStorageLearn> createState() =>
      _FlutterSecureStorageLearnState();
}

class _FlutterSecureStorageLearnState extends State<FlutterSecureStorageLearn> {
  final storage = FlutterSecureStorage();
  bool iscolor = false;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  String keyvalues = '';
  String StorageValue = '';

  Future<void> Writedata() async {
    if (keyController.text.isEmpty && textEditingController.text.isEmpty) {
      setState(() {
        StorageValue = "Enter Key and Text";
        iscolor = true;
      });
      return;
    }
    await storage.write(
      key: keyController.text,
      value: textEditingController.text,
    );
    keyvalues = keyController.text;
    keyController.clear();
    textEditingController.clear();
    iscolor = false;

    setState(() {

      StorageValue = "Data written securely!";
    });
  }

  Future<void> readdata() async {
    String? reddata = await storage.read(key: keyvalues);
    setState(() {
      StorageValue = reddata ?? "No data fond";
    });
  }

  Future<void> deletedata() async {
    await storage.delete(key: keyvalues);
    setState(() {
      StorageValue = "Data deleted successfully";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Secure Storage Learn',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(21),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Text',
                      label: Text('Text'),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                  TextField(
                    controller: keyController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Key',
                      label: Text('Key'),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: Writedata,
                        child: Text('Write'),
                      ),
                      ElevatedButton(onPressed: readdata, child: Text('Read')),
                      ElevatedButton(
                        onPressed: deletedata,
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'File Content : $StorageValue',
                    maxLines: 4,
                    style: TextStyle(
                      color: iscolor ? Colors.red : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
