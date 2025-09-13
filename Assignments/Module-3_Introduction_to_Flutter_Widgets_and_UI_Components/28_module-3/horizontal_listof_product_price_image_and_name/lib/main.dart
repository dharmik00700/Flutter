import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ProductList(), debugShowCheckedModeBanner: false));
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map<String, dynamic>> watchProducts = [
    {'name': 'Omega Seamaster', 'price': 4999, 'image': 'assets/images/1.jpeg'},
    {
      'name': 'Rolex Submariner',
      'price': 8999,
      'image': 'assets/images/2.jpeg',
    },
    {'name': 'Casio G-Shock', 'price': 199, 'image': 'assets/images/3.jpeg'},
    {
      'name': 'Tag Heuer Carrera',
      'price': 3499,
      'image': 'assets/images/4.jpeg',
    },
    {'name': 'Fossil Gen 6', 'price': 299, 'image': 'assets/images/5.jpeg'},
    {'name': 'Tissot PRX', 'price': 649, 'image': 'assets/images/6.jpeg'},
    {'name': 'Garmin Fenix 7', 'price': 699, 'image': 'assets/images/7.jpeg'},
    {
      'name': 'Apple Watch Ultra',
      'price': 799,
      'image': 'assets/images/8.jpeg',
    },
    {'name': 'Seiko Prospex', 'price': 499, 'image': 'assets/images/9.jpeg'},
    {
      'name': 'Citizen Eco-Drive',
      'price': 399,
      'image': 'assets/images/10.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Watch',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 8, 48, 77),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = watchProducts[index];
        
                  return Card(
                    color: Color.fromARGB(255, 33, 131, 197),
                    elevation: 4,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: 100,
                      height: 200,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${product['price']}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: watchProducts.length,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Watch',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = watchProducts[index];
        
                  return Card(
                    color: Color.fromARGB(255, 197, 96, 33),
                    elevation: 4,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: 100,
                      height: 200,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${product['price']}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: watchProducts.length,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Collections',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = watchProducts[index];
        
                  return Card(
                    color: Color.fromARGB(255, 78, 152, 145),
                    elevation: 4,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      width: 100,
                      height: 200,
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              product['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            product['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${product['price']}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: watchProducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
