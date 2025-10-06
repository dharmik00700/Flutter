import 'package:flutter/material.dart';

void main() => runApp(ProductCatalogApp());

class ProductCatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Catalog',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ProductCatalogScreen(),
    );
  }
}

class ProductCatalogScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Wireless Headphones',
      price: 2499,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYHX7uICP0d8LruXy9EG7RWABnK8rts2G5HA&s',
    ),
    Product(
      name: 'Smart Watch',
      price: 4999,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTNFiOBAf4U50WlqDdPNu6RL1aMyxfP2smNA&s',
    ),
    Product(
      name: 'Bluetooth Speaker',
      price: 1999,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeCEotko2Y4Eq7yDnfoml5nOptg4NtDjziKg&s',
    ),
    Product(
      name: 'Gaming Mouse',
      price: 1499,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKGX8wBTs3cr_CgM5A7ZbCw78R6BCl6TRPhA&s',
    ),
    Product(
      name: 'Fitness Band',
      price: 2999,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtpBz_nBf_pO8xfyX1sx3E9S4XLAaumpjv9g&s',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Catalog')),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.network(
                    product.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '₹${product.price}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final int price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}
