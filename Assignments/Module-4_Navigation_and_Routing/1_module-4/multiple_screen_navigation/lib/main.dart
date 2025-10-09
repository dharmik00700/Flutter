import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Screen App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/products': (context) => ProductListScreen(),
        '/details': (context) => ProductDetailsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),backgroundColor: Colors.redAccent,),
      body: Center(
        child: ElevatedButton(
          child: Text('View Products'),
          onPressed: () {
            Navigator.pushNamed(context, '/products');
          },
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'id': 1, 'name': 'Laptop', 'price': 75000},
    {'id': 2, 'name': 'Smartphone', 'price': 30000},
    {'id': 3, 'name': 'Headphones', 'price': 5000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'),backgroundColor: Colors.greenAccent,),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('₹${product['price']}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: product,
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> product =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Product Details'),backgroundColor: Colors.blueAccent,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product ID: ${product['id']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Name: ${product['name']}', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text('Price: ₹${product['price']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Back to Products'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}