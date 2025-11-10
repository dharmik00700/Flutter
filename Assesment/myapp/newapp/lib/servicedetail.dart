import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceDetailScreen extends StatefulWidget {
  ServiceDetailScreen({super.key, required this.service});
  final Service service;
  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? xfile = await _picker.pickImage(source: source, maxWidth: 1600);
      if (xfile == null) return;
      final File file = File(xfile.path);
      final dir = await getApplicationDocumentsDirectory();
      final String newPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_${xfile.name}';
      final saved = await file.copy(newPath);
      setState(() => _pickedImage = saved);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image saved locally')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image pick failed: $e')));
    }
  }

  Future<void> _callProvider() async {
    final url = 'tel:${widget.service.phone}';
    if (await canLaunchUrl(Uri.parse(url))) await launchUrl(Uri.parse(url));
  }

  Future<void> _smsProvider() async {
    final url = 'sms:${widget.service.phone}?body=Hi%20I%20need%20help%20with...';
    if (await canLaunchUrl(Uri.parse(url))) await launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.service.name)),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(widget.service.image, height: 200, width: double.infinity, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(height:200, color:Colors.grey, child: Icon(Icons.image, size:60))),
          Padding(padding: const EdgeInsets.all(12.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.service.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(widget.service.category),
            SizedBox(height: 8),
            Text(widget.service.description),
            SizedBox(height: 12),
            Row(children: [
              ElevatedButton.icon(onPressed: _callProvider, icon: Icon(Icons.phone), label: Text('Call')),
              SizedBox(width: 8),
              ElevatedButton.icon(onPressed: _smsProvider, icon: Icon(Icons.message), label: Text('SMS')),
            ]),
            SizedBox(height: 12),
            Text('Upload photo (optional):'),
            SizedBox(height: 8),
            Row(children: [
              ElevatedButton.icon(onPressed: () => _pickImage(ImageSource.camera), icon: Icon(Icons.camera_alt), label: Text('Camera')),
              SizedBox(width: 8),
              ElevatedButton.icon(onPressed: () => _pickImage(ImageSource.gallery), icon: Icon(Icons.photo_library), label: Text('Gallery')),
            ]),
            if (_pickedImage != null) ...[
              SizedBox(height: 12),
              Text('Selected image:'),
              SizedBox(height: 8),
              Image.file(_pickedImage!, height: 200),
            ]
          ]))
        ]),
      ),
    );
  }
}
