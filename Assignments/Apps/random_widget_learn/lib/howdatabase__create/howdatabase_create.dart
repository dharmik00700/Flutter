import 'package:flutter/material.dart';
import 'package:random_widget_learn/howdatabase__create/databasemodel.dart';
import 'package:random_widget_learn/howdatabase__create/db__helper.dart';

class HowdatabaseCreate extends StatefulWidget {
  const HowdatabaseCreate({super.key});

  @override
  State<HowdatabaseCreate> createState() => _HowdatabaseCreateState();
}

class _HowdatabaseCreateState extends State<HowdatabaseCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var productname = TextEditingController();
  var rupees = TextEditingController();
  DbHelper db = DbHelper();
  var isvisiblity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'How DataBase Create',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 26, 49, 4),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      isvisiblity = !isvisiblity;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: Text('Insert'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: Text('Update'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            width: double.maxFinite,
            height: isvisiblity ? 350 : 0,
            color: Colors.purple.withValues(alpha: 0.1),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: productname,
                      decoration: const InputDecoration(
                        labelText: 'Product Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a product name.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: rupees,
                      decoration: const InputDecoration(labelText: 'Rupees'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a price.';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final product = Product(
                            productname: productname.text,
                            rupees: double.parse(rupees.text),
                          );
                          await db.insertProduct(product);
                          productname.clear();
                          rupees.clear();
                          setState(() {
                            isvisiblity = false; // Hide after inserting
                          });
                        }
                      },
                      child: const Text('Add Product'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              child: FutureBuilder<List<Product>>(
                future: db.getall(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var product = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Color.fromARGB(255, 212, 238, 191),
                            title: Text(product.productname),
                            subtitle: Text('₹${product.rupees}'),
                            trailing: InkWell(
                              onTap: (){
                                db.deleteproduct(product);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Text(
                      "No items found",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
