import 'dart:async';
import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PlacesList extends StatefulWidget {
  PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {



  @override
  Widget build(BuildContext context) {

    if (widget.places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Color.fromARGB(255, 203, 162, 121)
                : Colors.black,
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        shadowColor: Theme.of(context).brightness == Brightness.dark
            ? Color.fromARGB(255, 203, 162, 121)
            : Colors.black,
       elevation: 10,
        borderOnForeground: true,

        color: Theme
            .of(context)
            .brightness == Brightness.dark
            ? Color.fromARGB(255, 203, 162, 121)
            : Colors.black,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: FileImage(widget.places[index].image),
              radius: 26,
            ),
            tileColor: Theme.of(context).brightness == Brightness.dark
                ? Color.fromARGB(255, 203, 162, 121)
                : Colors.black,
            title: Text(
              widget.places[index].title,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Color.fromARGB(255, 203, 162, 121),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget.places[index].location.address,
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => {Get.to(PlaceDetailScreen(place: widget.places[index]))},
          ),
        ),
      ),
      itemCount: widget.places.length,
    );
  }
}
