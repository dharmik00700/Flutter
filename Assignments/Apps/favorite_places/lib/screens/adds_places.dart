import 'dart:io';

import 'package:favorite_places/controller/user_places_controller.dart';
import 'package:favorite_places/widgets/image_inputs.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/place.dart';

class AddsPlaces extends StatefulWidget {
  const AddsPlaces({super.key});

  @override
  State<AddsPlaces> createState() => _AddsPlacesState();
}

class _AddsPlacesState extends State<AddsPlaces> {
  final titlecontroller = TextEditingController();
  File? selectedImage;
  PlaceLocation? selectedLocation;

  @override
  void dispose() {
    // TODO: implement dispose
    titlecontroller.dispose();
    super.dispose();
  }

  final controller = Get.find<UserPlacesController>();

  void saveplace() {
    final enteredTitle = titlecontroller.text;
    if (enteredTitle.isEmpty ||
        selectedImage == null ||
        selectedLocation == null) {
      return;
    }
    controller.addPlace(enteredTitle, selectedImage!, selectedLocation!);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Place',style: TextStyle(color:  Theme.of(context).brightness == Brightness.dark
            ? Color.fromARGB(255, 203, 162, 121)
            : Colors.black,),),
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Color.fromARGB(255, 203, 162, 121),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Color.fromARGB(255, 203, 162, 121),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              enabled: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                labelText: 'Title',
                labelStyle: TextStyle(
                  color:  Theme.of(context).brightness == Brightness.dark
                      ? Color.fromARGB(255, 203, 162, 121)
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withAlpha(100)
                      : Colors.black.withAlpha(100)),
                  borderRadius: BorderRadius.circular(21),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 5,color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white.withAlpha(100)
                      : Colors.black.withAlpha(100)),
                  borderRadius: BorderRadius.circular(21),
                ),
                border: OutlineInputBorder(
                  // borderSide: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
              controller: titlecontroller,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 10),
            ImageInputs(
              onpickimage: (image) {
                selectedImage = image;
              },
            ),
            SizedBox(height: 10),
            LocationInput(
              onselectlocation: (select) {
                selectedLocation = select;
              },
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withAlpha(70)
                  : Colors.black.withAlpha(70),),
              onPressed: saveplace,
              label: Text('Add Place',style: TextStyle(color:  Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,),),
              icon: Icon(Icons.add,color:  Theme.of(context).brightness == Brightness.dark
                  ? Color.fromARGB(255, 203, 162, 121)
                  : Colors.black,),
            ),
          ],
        ),
      ),
    );
  }
}
