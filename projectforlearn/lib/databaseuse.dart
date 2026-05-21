import 'package:flutter/material.dart';
import 'package:projectforlearn/database/database_model.dart';
import 'package:projectforlearn/database/dbhandler.dart';

class Databaseuse extends StatefulWidget {
  const Databaseuse({Key? key}) : super(key: key);

  @override
  _DatabaseuseState createState() => _DatabaseuseState();
}

class _DatabaseuseState extends State<Databaseuse> {
  final databasehelper _databasehelper = databasehelper();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> insetdata(String name, int numbers) async {
    _databasehelper.insert(modeldatabase(name: name, numbers: numbers));
  }

  Future<void> updatedata(String name, int numbers) async {
    _databasehelper.insert(modeldatabase(name: name, numbers: numbers));
  }

  Future<void> deletedata(int id) async {
    setState(() {
      _databasehelper.delete(id);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 162, 234, 229),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Name...',
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black.withAlpha(150)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _numberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Number...',
                  prefixIcon: Icon(Icons.numbers, color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _formKey.currentState!.reset();
                    });
                  },
                  child: Text('Reset'),
                ),
                OutlinedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      insetdata(
                        _nameController.text,
                        int.parse(_numberController.text),
                      );
                    }
                    setState(() {
                      _formKey.currentState!.reset();
                    });
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: _databasehelper.read(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            tileColor: Colors.black.withAlpha(100),
                            title: Text(item.name),
                            subtitle: Text(item.numbers.toString()),
                            leading: CircleAvatar(child: Text(item.id.toString())),
                            trailing: IconButton(
                              onPressed: () {

                                deletedata(item.id!);
                              },
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                color: Colors.redAccent,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: Text('No data found'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
