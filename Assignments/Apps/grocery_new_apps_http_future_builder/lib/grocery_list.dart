import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  late Future<List<GroceryItem>> loadItems;

  // var isLoading = true;
  // var groceryItems = [];

  @override
  void initState() {
    loadItems = loadData();
    super.initState();
  }

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => NewItems()));
    print('start-------------------------------');
    print(newItem);

    if (newItem == null) {
      return;
    }
    setState(() {
      loadItems = loadData();
    });
  }

  Future<List<GroceryItem>> loadData() async {
    // var uri = Uri.https(
    //   'grocery-app-a3e3c-default-rtdb.firebaseio.com',
    //   'shopping_list.json',
    // );
    var uri = Uri.parse("${dotenv.env['BASE_URL']}/shopping_list.json");

    final response = await http.get(uri);
    if (response.statusCode >= 400) {
      throw Exception('Failed to Fetch Data. Please try again later');
      // errormsg = 'Failed to Fetch Data. Please try again later';
    }
    if (response.body == 'null') {
      return [];
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
    // setState(() {
    //   groceryItems = loadedItems;
    //   isLoading = false;
    // });

    // setState(() {
    //   errormsg = 'somthing went wrong';
    // });
    return loadedItems;
  }

  void removeItem(item_index) async {
    // final index = groceryItems.indexOf(item_index);
    // setState(() {
    //   groceryItems.remove(item_index);
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     content: Text('Data is deleted'),
    //     title: Text('Alert'),
    //     actions: [
    //       TextButton(
    //         onPressed: () {
    //           setState(() {
    //             Navigator.of(context).pop();
    //           });
    //         },
    //         child: Text('Close'),
    //       ),
    //     ],
    //   ),
    // );

    var url = Uri.https(
      'grocery-app-a3e3c-default-rtdb.firebaseio.com',
      'shopping_list/${item_index.id}.json',
    );
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      // setState(() {
      //   groceryItems.insert(index, item_index);
      // });
      return;
    }

    setState(() {
      loadItems = loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: loadItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                '--- No items ---',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
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
                    removeItem(snapshot.data![index]);
                    // setState(() {
                    //   groceryItems.remove(groceryItems[index]);
                    // });
                  },
                  key: ValueKey(snapshot.data![index]),
                  child: ListTile(
                    title: Text(snapshot.data![index].name),
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: snapshot.data![index].category.color,
                      ),
                      width: 24,
                      height: 24,
                    ),
                    trailing: CircleAvatar(
                      child: Text(
                        snapshot.data![index].quantity.toString(),
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
          );
        },
      ),
    );
  }
}
