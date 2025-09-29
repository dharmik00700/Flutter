import 'dart:convert';

import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onselectlocation});

  final void Function(PlaceLocation location) onselectlocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? pickerlocation;
  var isgettinglocation = false;

  String get locationImage {
    if (pickerlocation == null) {
      return "";
    }
    final lat = pickerlocation?.latitude;
    final lng = pickerlocation?.longitude;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyDF0kkbnVgE8g1XUaQ-r6fV5ujufLbkJ20";
  }

  Future<void> getcurretlocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    setState(() {
      isgettinglocation = true;
    });
    locationData = await location.getLocation();

    print(locationData.latitude);
    print(locationData.longitude);
    double? lat = locationData.latitude;
    double? lng = locationData.longitude;
    if (lat == null || lng == null) {
      return;
    }
    saveplace(lat, lng);
  }

  Future<void> saveplace(double lat, double lng) async {
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyDF0kkbnVgE8g1XUaQ-r6fV5ujufLbkJ20",
    );
    final response = await http.get(url);
    final resdata = json.decode(response.body);
    final address = resdata['results'][0]['formatted_address'];

    setState(() {
      pickerlocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
      isgettinglocation = false;
    });
    widget.onselectlocation(pickerlocation!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewcontent = Text(
      'No LOCATION SELECTED',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
    if (isgettinglocation) {
      previewcontent = CircularProgressIndicator();
    }
    if (pickerlocation != null) {
      previewcontent = Image.network(
        locationImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      );
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withAlpha(50),
            ),
          ),
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: previewcontent,
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: getcurretlocation,
              icon: Icon(Icons.location_on),
              label: Text('Get Current Loaction'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('Selected From Map'),
            ),
          ],
        ),
      ],
    );
  }
}
