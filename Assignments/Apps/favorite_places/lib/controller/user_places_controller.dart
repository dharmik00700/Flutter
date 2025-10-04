import 'dart:io';
import 'package:favorite_places/models/place.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:get/get.dart';

class UserPlacesController extends GetxController {
  final places = List<Place>.empty().obs;
  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspath.getApplicationDocumentsDirectory();
    places.add(Place(title: title, image: File(image.path), location: location));
    print("=========== $places =======");
    print("=========== $appDir =======");
    final filename = path.basename(image.path);
    print("=========== $appDir =======");
    final copiedFile = await image.copy('$appDir/$filename');
    print("=========== $appDir =======");




        // Place(title: title, image: copiedFile, location: location));
        }
}
