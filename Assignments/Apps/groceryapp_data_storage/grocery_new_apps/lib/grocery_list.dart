import 'package:flutter/material.dart';
import 'package:grocery_new_apps/data/categories.dart';
import 'package:grocery_new_apps/login_screen.dart';
import 'package:grocery_new_apps/models/category.dart';
import 'package:grocery_new_apps/models/grocery_item.dart';
import 'package:grocery_new_apps/new_items.dart';
import 'package:grocery_new_apps/offline_database/database_helper.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceryItems = [];

  @override
  void initState() {
    data();
    super.initState();
  }

  Category getCategoryFromTitle(title) {
    return categories.entries
        .firstWhere((element) => element.value.title == title)
        .value;
  }

  Future<List<GroceryItem>> getGroceryItems() async {
    final db = await initializationDatabase();
    final List<Map<String, dynamic>> maps = await db.query(tablGroceryItem);
    return List.generate(maps.length, (index) {
      return GroceryItem(
        id: maps[index][dbId],
        name: maps[index][dbName],
        quantity: maps[index][dbQuantity],
        category: getCategoryFromTitle(maps[index][dbCategory]),
      );
    });
  }

  void data() async {
    final groceryData = await getGroceryItems();
    setState(() {
      groceryItems.addAll(groceryData);
    });
  }

  void _addItem() async {
    final groceryitem = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NewItems()),
    );
    if (groceryitem == null) {
      return;
    }
    setState(() {
      groceryItems.add(groceryitem);
    });
  }

  void _removeItem(item) async {
    final db = await initializationDatabase();
    int count = await db.delete(
      tablGroceryItem,
      where: "$dbId = ?",
      whereArgs: [item.id],
    );
    if (count > 0) {
      setState(() {
        groceryItems.remove(item);
      });
    }
  }

  void editItem(index) async {
    final groceryItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewItems(groceryItem: groceryItems[index]),
      ),
    );
    if (groceryItem == null) {
      return;
    }
    groceryItems.removeAt(index);
    setState(() {
      groceryItems.insert(index, groceryItem);
    });
  }

  void logout() {
    setState(() {
      asyncPrefs.clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget context = Center(
      child: Text(
        '--- No items ---',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
    if (groceryItems.isNotEmpty) {
      context = ListView.builder(
        itemBuilder: (conext, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Dismissible(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.centerRight,

                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              onDismissed: (direction) {
                _removeItem(groceryItems[index]);
              },
              key: ValueKey(groceryItems[index]),
              child: InkWell(
                onTap: () => editItem(index),
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
                    backgroundColor: groceryItems[index].category.color,
                    child: Text(
                      groceryItems[index].quantity.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: groceryItems.length,
      );
    }
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  CircleAvatar(radius: 40, child: Icon(Icons.person)),
                  SizedBox(height: 10),
                  Text(
                    'Welcome Dharmik!',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: logout,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Grocery app'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.outlined(
              onPressed: _addItem,
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 84, 59, 59),
      body: context,
    );
  }
}
