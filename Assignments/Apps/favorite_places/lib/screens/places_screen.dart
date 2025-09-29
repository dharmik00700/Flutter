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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 35, color: Color(0xFFc49450)),
      ),
      appBar: AppBar(
        title: Text(
          'Places',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 203, 162, 121),
      ),
      backgroundColor: Color.fromARGB(255, 203, 162, 121),
      body: Obx(() => PlacesList(places: controller.places.value)),
    );
  }
}
