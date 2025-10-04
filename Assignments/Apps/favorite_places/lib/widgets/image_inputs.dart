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
      style: TextButton.styleFrom(overlayColor: Colors.black.withAlpha(100)),
      icon: Icon(Icons.camera_alt, color:  Theme.of(context).brightness == Brightness.dark
          ? Color.fromARGB(255, 203, 162, 121)
          : Colors.black,),
      label: Text(
        'Take Pickture',
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Color.fromARGB(255, 203, 162, 121)
              : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
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
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(width: 5, color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withAlpha(100)
            : Colors.black.withAlpha(100)),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: ClipRRect(child: content, borderRadius: BorderRadius.circular(15)),
    );
  }
}
