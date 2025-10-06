import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_price_change_add_remove_using_provider/cartmodule.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => Cartmodule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CartScreen());
  }
}

class CartScreen extends StatelessWidget {
  final List<Item> storeItems = [
    Item(name: 'Apple', price: 30),
    Item(name: 'Banana', price: 20),
    Item(name: 'Mango', price: 80),
  ];

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
        backgroundColor: Color.fromARGB(255, 241, 227, 171),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: storeItems.length,
              itemBuilder: (context, index) {
                final item = storeItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('₹${item.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Provider.of<Cartmodule>(context, listen: false).add(item);
                    },
                    child: Text('Add'),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Consumer<Cartmodule>(
            builder: (context, cart, child) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Total: ₹${cart.totalprice.toStringAsFixed(2)} ',
                  style: TextStyle(fontSize: 20),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
