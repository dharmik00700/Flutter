import 'package:flutter/material.dart';
import 'package:grocery_new_apps/data/categories.dart';
import 'package:grocery_new_apps/models/category.dart';
import 'package:grocery_new_apps/models/grocery_item.dart';
import 'package:grocery_new_apps/offline_database/database_helper.dart';

class NewItems extends StatefulWidget {
  const NewItems({super.key, this.groceryItem});

  final GroceryItem? groceryItem;

  @override
  State<NewItems> createState() => _NewItemsState();
}

class _NewItemsState extends State<NewItems> {
  final formkey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];

  @override
  void initState() {
    if (widget.groceryItem != null) {
      _enteredName = widget.groceryItem!.name;
      _enteredQuantity = widget.groceryItem!.quantity;
      _selectedCategory = widget.groceryItem!.category;
    }
    super.initState();
  }

  void saveItem() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final groceryItem = GroceryItem(
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory!,
      );
      final db = await initializationDatabase();
      if (widget.groceryItem == null) {
        int newId = await db.insert(tablGroceryItem, groceryItem.toMap());
        if (newId > 0) {
          groceryItem.id = newId;
        }
      } else {
        int count = await db.update(
          tablGroceryItem,
          groceryItem.toMap(),
          where: "$dbId = ?",
          whereArgs: [widget.groceryItem!.id],
        );
        print("count : $count");
        if (count > 0) {
          groceryItem.id = widget.groceryItem!.id;
        }
      }
      Navigator.of(context).pop(groceryItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.groceryItem == null ? 'Add Data' : 'Update Data'),
        backgroundColor: Color.fromARGB(255, 131, 131, 55),
      ),
      backgroundColor: Color.fromARGB(255, 245, 245, 185),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _enteredName,
                validator: (values) {
                  if (values == null ||
                      values.isEmpty ||
                      values.trim().length <= 1 ||
                      values.trim().length > 50) {
                    return "Must be between 1 and 50 characters.";
                  }
                  return null;
                },
                onSaved: (values) {
                  _enteredName = values!;
                },
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: 'NAME:',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 3, color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be a valid, positive number.";
                        }
                        return null;
                      },
                      onSaved: (values) {
                        _enteredQuantity = int.parse(values!);
                      },
                      decoration: InputDecoration(
                        labelText: 'Quantity:',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 3, color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      dropdownColor: Color.fromARGB(255, 131, 131, 55),
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 2, color: Colors.black),
                        ),
                      ),
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: category.value.color,
                                  ),
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  category.value.title,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (values) {
                        setState(() {
                          _selectedCategory = values;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      formkey.currentState!.reset();
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 131, 131, 55),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                    ),
                    child: Text('Reset', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: saveItem,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 131, 131, 55),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                    ),
                    child: Text(
                      widget.groceryItem == null ? "Add Item" : "Update Item",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
