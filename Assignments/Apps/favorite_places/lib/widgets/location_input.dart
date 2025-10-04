import 'dart:convert';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  Future<void> selectonmap() async {
    final pickedlocation = await Get.to<LatLng?>(MapScreen());
    if (pickedlocation == null) {
      return;
    }
    saveplace(pickedlocation.latitude, pickedlocation.longitude);
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
      'NO LOCATION SELECTED',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ?Color.fromARGB(255, 203, 162, 121)
            : Colors.black,
        fontWeight: FontWeight.bold,
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
            borderRadius: BorderRadius.circular(21),
            border: Border.all(width: 5, color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white.withAlpha(100)
                : Colors.black.withAlpha(100)),
          ),
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: ClipRRect(
            child: previewcontent,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: getcurretlocation,
                icon: Icon(Icons.location_on, color:  Theme.of(context).brightness == Brightness.dark
                    ? Color.fromARGB(255, 203, 162, 121)
                    : Colors.black,),
                label: FittedBox(
                  child: Text(
                    'Get Current Loaction',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: selectonmap,
                icon: Icon(Icons.map,color:  Theme.of(context).brightness == Brightness.dark
                    ? Color.fromARGB(255, 203, 162, 121)
                    : Colors.black,),
                label: Text(
                  'Selected From Map',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
