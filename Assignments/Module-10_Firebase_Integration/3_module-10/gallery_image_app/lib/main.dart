import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'gallery_page.dart';
import 'upload_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ImageGalleryApp());
}

class ImageGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Image Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Upload Image'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => UploadPage())),
            ),
            ElevatedButton(
              child: Text('View Gallery'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => GalleryPage())),
            ),
          ],
        ),
      ),
    );
  }
}