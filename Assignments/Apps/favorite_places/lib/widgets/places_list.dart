import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  PlacesList({super.key, required this.places});
  final List<Place> places;
  final List<Place> dummyPlaces = [
    Place(
      title: 'Our Lady',
      image: File('assets/images/our_lady.jpg'),
      location: PlaceLocation(
        latitude: 21.1702,
        longitude: 72.8311,
        address: '800 S Tucker Rd, Lima',
      ),
    ),
    Place(
      title: 'Path P',
      image: File('assets/images/path_p.jpg'),
      location: PlaceLocation(
        latitude: 34.0522,
        longitude: -118.2437,
        address: '7831 N Brown Rd, Little Mountain',
      ),
    ),
    Place(
      title: 'Our Lady',
      image: File('assets/images/our_lady.jpg'),
      location: PlaceLocation(
        latitude: 21.1702,
        longitude: 72.8311,
        address: '800 S Tucker Rd, Lima',
      ),
    ),
    Place(
      title: 'Path P',
      image: File('assets/images/path_p.jpg'),
      location: PlaceLocation(
        latitude: 34.0522,
        longitude: -118.2437,
        address: '7831 N Brown Rd, Little Mountain',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) => Card(
        elevation: 10,
        borderOnForeground: true,
        color: Colors.black,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blue, radius: 26),
            tileColor: Colors.black,
            title: Text(
              places[index].title,
              style: TextStyle(
                color:Color(0xFFc49450),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              places[index].location.address,
              style: TextStyle(color: Colors.white),
            ),
            onTap: ()=>{

            },
          ),
        ),
      ),
      itemCount: places.length,
    );
  }
}
