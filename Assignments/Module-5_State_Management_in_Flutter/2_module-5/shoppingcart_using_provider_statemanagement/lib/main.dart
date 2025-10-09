import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: MyApp(),
    ),
  );
}

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final List<String> products = ['Shoes', 'T-Shirt', 'Watch', 'Bag'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),backgroundColor: Colors.greenAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return ListTile(
            title: Text(product),
            trailing: ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).addItem(product);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$product added to cart')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart'),backgroundColor: Colors.redAccent,),
      body: cart.items.isEmpty
          ? Center(child: Text('Cart is empty'))
          : ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (_, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => cart.removeItem(item),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          child: Text('Clear Cart'),
          onPressed: cart.items.isEmpty ? null : cart.clearCart,
        ),
      ),
    );
  }
}