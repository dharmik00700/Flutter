import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: Shopping_Card_App()),
  );
}

class Shopping_Card_App extends StatefulWidget {
  const Shopping_Card_App({super.key});

  @override
  State<Shopping_Card_App> createState() => _Shopping_Card_AppState();
}

List<String> watchImageUrls = [
  'https://images.pexels.com/photos/125779/pexels-photo-125779.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/9978711/pexels-photo-9978711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/2113994/pexels-photo-2113994.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/280250/pexels-photo-280250.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/47856/rolex-wrist-watch-clock-gmt-47856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/2783873/pexels-photo-2783873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/179909/pexels-photo-179909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/1034008/pexels-photo-1034008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
];

class _Shopping_Card_AppState extends State<Shopping_Card_App> {
  List<bool> isSelected = List.generate(10, (_) => false);
  var total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App to card = ${total}',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 7, 12),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 112, 177, 243),
            ),

            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      watchImageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: Color.fromARGB(171, 9, 9, 9),
                    ),
                    height: 80,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                        total = isSelected.where((values)=>values==true).length;
                      });
                    },
                    label: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        color: isSelected[index]
                            ? Colors.yellowAccent
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    icon: Icon(
                      Icons.favorite,
                      color: isSelected[index] ? Colors.red : Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected[index]
                          ? Colors.green
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
