import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grocery_new_apps/data/categories.dart';
import 'package:grocery_new_apps/models/category.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_new_apps/models/grocery_item.dart';

class NewItems extends StatefulWidget {
  const NewItems({super.key});

  @override
  State<NewItems> createState() => _NewItemsState();
}

class _NewItemsState extends State<NewItems> {
  final formkey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];
  var isLoading = false;

  void savedata() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      var url = Uri.https(
        'grocery-app-a3e3c-default-rtdb.firebaseio.com',
        'shopping_list.json',
      );
      setState(() {
        isLoading = true;
        print(isLoading);
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': _enteredName,
          'quantity': _enteredQuantity,
          'category': _selectedCategory!.title,
        }),
      );

      print(response.body);
      print(response.statusCode);
      Map<String, dynamic> restdata = json.decode(response.body);
      if (!context.mounted) {
        return;
      }
      if (response.body == 200) {
        Navigator.of(context).pop(
          GroceryItem(
            id: restdata["name"],
            name: _enteredName,
            quantity: _enteredQuantity,
            category: _selectedCategory!,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
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
                      initialValue: '1',
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
                                  style: TextStyle(fontSize: 15),
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
                    onPressed: isLoading
                        ? null
                        : () {
                            formkey.currentState!.reset();
                          },
                    child: Text('Reset', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 131, 131, 55),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: savedata,
                    child: Text('ADD DATA', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 131, 131, 55),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
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
