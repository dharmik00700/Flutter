import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_new_apps/data/categories.dart';
import 'package:grocery_new_apps/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_new_apps/new_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  var groceryItems = [];
  var isLoading = true;
  var errormsg = "";

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  void _addItem() async {
    final newItem = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewItems()),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      groceryItems.add(newItem);
    });
  }

  Future<void> loadData() async {
    var uri = Uri.https(
      'grocery-app-a3e3c-default-rtdb.firebaseio.com',
      'shopping_list.json',
    );
    try {
      final response = await http.get(uri);
      if (response.statusCode >= 400) {
        setState(() {
          errormsg = 'Failed to Fetch Data. Please try again later';
        });
        return;
      }
      if (response.body == 'null') {
        setState(() {
          isLoading = false;
        });
        return;
      }
      Map<String, dynamic> listofdata = json.decode(response.body);
      List<GroceryItem> loadedItems = [];
      for (final items in listofdata.entries) {
        final category = categories.entries
            .firstWhere(
              (catItem) => catItem.value.title == items.value['category'],
            )
            .value;
        loadedItems.add(
          GroceryItem(
            id: items.key,
            name: items.value['name'],
            quantity: items.value['quantity'],
            category: category,
          ),
        );
      }
      setState(() {
        groceryItems = loadedItems;
        isLoading = false;
      });
    } catch (reeor) {
      setState(() {
        errormsg = 'somthing went wrong';
      });
    }
  }

  void removeItem(item_index) async {
    final index = groceryItems.indexOf(item_index);
    setState(() {
      groceryItems.remove(item_index);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text('Data is deleted'),
          title: Text('Alert'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    });
    var url = Uri.https(
      'grocery-app-a3e3c-default-rtdb.firebaseio.com',
      'shopping_list/${item_index.id}.json',
    );
    print(item_index.id);
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        groceryItems.insert(index, item_index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget context = Center(
      child: Text(
        '--- No items ---',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
    if (isLoading) {
      context = const Center(child: CircularProgressIndicator());
    }
    if (groceryItems.isNotEmpty) {
      context = ListView.builder(
        itemBuilder: (conext, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Dismissible(
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
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
                removeItem(groceryItems[index]);
                // setState(() {
                //   groceryItems.remove(groceryItems[index]);
                // });
              },
              key: ValueKey(groceryItems[index]),
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
            ),
          );
        },
        itemCount: groceryItems.length,
      );
    }
    if (errormsg != "") {
      context = Center(child: Text(errormsg));
    }
    return Scaffold(
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
