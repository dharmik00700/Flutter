import 'package:grocery_new_apps/models/category.dart';

class GroceryItem {
  int? id;
  final String name;
  final int quantity;
  final Category category;

  GroceryItem({
    this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'quantity': quantity, 'category': category.title};
  }
}
