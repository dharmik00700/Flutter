import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) setState(() => _image = File(pickedFile.path));
  }

  Future uploadImage() async {
    if (_image == null) return;
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance.ref().child('images/$fileName.jpg');
    await ref.putFile(_image!);
    final url = await ref.getDownloadURL();
    await FirebaseFirestore.instance.collection('gallery').add({'url': url});
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Uploaded!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Column(
        children: [
          SizedBox(height: 20),
          _image != null
              ? Image.file(_image!, height: 250)
              : Text('No image selected'),
          ElevatedButton(onPressed: pickImage, child: Text('Pick Image')),
          ElevatedButton(onPressed: uploadImage, child: Text('Upload')),
        ],
      ),
    );
  }
}