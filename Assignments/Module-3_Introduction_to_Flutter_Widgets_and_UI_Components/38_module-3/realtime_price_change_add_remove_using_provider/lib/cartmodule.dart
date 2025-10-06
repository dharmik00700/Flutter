import 'package:flutter/widgets.dart';

class Cartmodule extends ChangeNotifier {
  final List<Item> _Items = [];

  List<Item> get items => _Items;

  double get totalprice => _Items.fold(0, (sum, item) => sum + item.price);

  void add(Item item) {
    _Items.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    _Items.remove(item);
    notifyListeners();
  }
}

class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});
}
