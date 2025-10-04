import 'package:favorite_places/main.dart';
import 'package:favorite_places/screens/adds_places.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_places_controller.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final controller = Get.put(UserPlacesController());
  final

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Get.to(AddsPlaces());
        },
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color.fromARGB(255, 203, 162, 121)
            : Colors.black,
        child: Icon(
          Icons.add,
          size: 35,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Color.fromARGB(255, 203, 162, 121),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Places',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).brightness == Brightness.dark
                ? Color.fromARGB(255, 203, 162, 121)
                : Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Color.fromARGB(255, 203, 162, 121),
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Color.fromARGB(255, 203, 162, 121),
      body: Obx(() => PlacesList(places: controller.places.value)),
    );
  }
}
