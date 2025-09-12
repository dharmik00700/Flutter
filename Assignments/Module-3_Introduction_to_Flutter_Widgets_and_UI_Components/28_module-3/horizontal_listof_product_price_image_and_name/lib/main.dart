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
    {
      'name': 'Omega Seamaster',
      'price': 4999,
      'image': 'assets/images/omega.png',
    },
    {
      'name': 'Rolex Submariner',
      'price': 8999,
      'image': 'assets/images/rolex.png',
    },
    {'name': 'Casio G-Shock', 'price': 199, 'image': 'assets/images/casio.png'},
    {
      'name': 'Tag Heuer Carrera',
      'price': 3499,
      'image': 'assets/images/tag.png',
    },
    {'name': 'Fossil Gen 6', 'price': 299, 'image': 'assets/images/fossil.png'},
    {'name': 'Tissot PRX', 'price': 649, 'image': 'assets/images/tissot.png'},
    {
      'name': 'Garmin Fenix 7',
      'price': 699,
      'image': 'assets/images/garmin.png',
    },
    {
      'name': 'Apple Watch Ultra',
      'price': 799,
      'image': 'assets/images/apple.png',
    },
    {'name': 'Seiko Prospex', 'price': 499, 'image': 'assets/images/seiko.png'},
    {
      'name': 'Citizen Eco-Drive',
      'price': 399,
      'image': 'assets/images/citizen.png',
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
      body: Column(
        children:[
          Row(
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = watchProducts[index];

                  return Container(
                    color: Colors.red,
                    margin: EdgeInsets.all(8),
                    width: 100,
                    height: 150,
                    child: Card(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(product['image'], fit: BoxFit.cover),
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
            ],
          ),Text('dharmik')
        ],


      ),
    );
  }
}
