import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputs extends StatefulWidget {
  const ImageInputs({super.key, required this.onpickimage});

  final void Function(File image) onpickimage;

  @override
  State<ImageInputs> createState() => _ImageInputsState();
}

class _ImageInputsState extends State<ImageInputs> {
  File? selectedImage;

  void takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    print(pickedImage);
    setState(() {
      selectedImage = File(pickedImage.path);
    });
    widget.onpickimage(selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: takePicture,
      icon: Icon(Icons.camera_alt),
      label: Text('Take Pickture'),
    );
    if (selectedImage != null) {
      content = InkWell(
        onTap: takePicture,
        child: Image.file(
          selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withAlpha(50),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
