import 'package:flutter/material.dart';
import 'package:grocery_new_apps/data/dummy_items.dart';
import 'package:grocery_new_apps/new_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery app'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.outlined(
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewItems()),
                  );
                });
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 84, 59, 59),
      body: ListView.builder(
        itemBuilder: (conext, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: ListTile(
              title: Text(groceryItems[index].name),
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: groceryItems[index].category.color,
                ),
                width: 24,
                height: 24,
              ),
              trailing: CircleAvatar(
                child: Text(
                  groceryItems[index].quantity.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Color.fromARGB(255, 100, 77, 77),
              ),
            ),
          );
        },
        itemCount: groceryItems.length,
      ),
    );
  }
}
