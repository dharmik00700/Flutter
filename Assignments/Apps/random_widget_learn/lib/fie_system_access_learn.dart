import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileSystemAccessLearn extends StatefulWidget {
  const FileSystemAccessLearn({super.key});

  @override
  State<FileSystemAccessLearn> createState() => _FileSystemAccessLearnState();
}

class _FileSystemAccessLearnState extends State<FileSystemAccessLearn> {
  TextEditingController textEditingController = TextEditingController();
  String filecontent = "";

  Future<String> getfilepath() async {
    final directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/mydata.txt";
  }

  Future<void> writefile(String data) async {
    final filepath = await getfilepath();
    final file = File(filepath);
    await file.writeAsString(data);
  }

  Future<void> readfile() async {
    try {
      final filepath = await getfilepath();
      final file = File(filepath);
      String content = await file.readAsString();
      if (content.isEmpty) {
        setState(() {
          filecontent = "File is Empty";
        });
      }
      setState(() {
        filecontent = content;
      });
    } catch (e) {
      setState(() {
        filecontent = "Error reading file : $e";
      });
    }
  }

  Future<void> filedelete() async {
    final filepath = await getfilepath();
    final file = File(filepath);
    if (await file.exists()) {
      await file.delete();
      setState(() {
        filecontent = "File deleted successfully";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File System Learn', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
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
                color: Colors.deepPurpleAccent[100],
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(21),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: textEditingController,
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Text',
                      label: Text('Text File'),
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
                        onPressed: () {
                          writefile(textEditingController.text);
                          textEditingController.clear();
                          setState(() {
                            filecontent = "File written successfully";
                          });
                        },
                        child: Text('Write'),
                      ),
                      ElevatedButton(onPressed: readfile, child: Text('Read')),
                      ElevatedButton(
                        onPressed: filedelete,
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'File Content : $filecontent',
                    maxLines: 4,
                    style: TextStyle(
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
