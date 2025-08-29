import 'package:flutter/material.dart';
import 'package:gridview_image_loader/inside_image.dart';

void main() {
  runApp(MaterialApp(home: Gallery_Image(), debugShowCheckedModeBanner: false));
}

class Gallery_Image extends StatefulWidget {
  const Gallery_Image({super.key});

  @override
  State<Gallery_Image> createState() => _Gallery_ImageState();
}

final List<String> carImageUrls = [
  'https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/9735303/pexels-photo-9735303.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/112460/pexels-photo-112460.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/244206/pexels-photo-244206.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3137077/pexels-photo-3137077.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/457418/pexels-photo-457418.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3972755/pexels-photo-3972755.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/164634/pexels-photo-164634.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/358189/pexels-photo-358189.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3764984/pexels-photo-3764984.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/2127733/pexels-photo-2127733.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/575386/pexels-photo-575386.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/116675/pexels-photo-116675.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3422964/pexels-photo-3422964.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1007410/pexels-photo-1007410.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/2365572/pexels-photo-2365572.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/136872/pexels-photo-136872.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/3354648/pexels-photo-3354648.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/305070/pexels-photo-305070.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1035108/pexels-photo-1035108.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/261986/pexels-photo-261986.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/909907/pexels-photo-909907.jpeg?auto=compress&cs=tinysrgb&w=600',
  'https://images.pexels.com/photos/831475/pexels-photo-831475.jpeg?auto=compress&cs=tinysrgb&w=600',
];
final List<Map<String, String>> carBrandImages = [
  {
    'brand': 'Ford',
    'url':
        'https://images.pexels.com/photos/3764984/pexels-photo-3764984.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'BMW',
    'url':
        'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Mercedes-Benz',
    'url':
        'https://images.pexels.com/photos/112460/pexels-photo-112460.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Audi',
    'url':
        'https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Porsche',
    'url':
        'https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Ferrari',
    'url':
        'https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Lamborghini',
    'url':
        'https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Toyota',
    'url':
        'https://images.pexels.com/photos/2127733/pexels-photo-2127733.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Honda',
    'url':
        'https://images.pexels.com/photos/707046/pexels-photo-707046.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Nissan',
    'url':
        'https://images.pexels.com/photos/9735303/pexels-photo-9735303.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Chevrolet',
    'url':
        'https://images.pexels.com/photos/358189/pexels-photo-358189.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Tesla',
    'url':
        'https://images.pexels.com/photos/3972755/pexels-photo-3972755.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Volkswagen',
    'url':
        'https://images.pexels.com/photos/164634/pexels-photo-164634.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Subaru',
    'url':
        'https://images.pexels.com/photos/1035108/pexels-photo-1035108.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Mazda',
    'url':
        'https://images.pexels.com/photos/2365572/pexels-photo-2365572.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Jaguar',
    'url':
        'https://images.pexels.com/photos/3137077/pexels-photo-3137077.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Lexus',
    'url':
        'https://images.pexels.com/photos/3422964/pexels-photo-3422964.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Dodge',
    'url':
        'https://images.pexels.com/photos/116675/pexels-photo-116675.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Jeep',
    'url':
        'https://images.pexels.com/photos/1429775/pexels-photo-1429775.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Rolls-Royce',
    'url':
        'https://images.pexels.com/photos/261986/pexels-photo-261986.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Bentley',
    'url':
        'https://images.pexels.com/photos/305070/pexels-photo-305070.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'McLaren',
    'url':
        'https://images.pexels.com/photos/575386/pexels-photo-575386.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Aston Martin',
    'url':
        'https://images.pexels.com/photos/909907/pexels-photo-909907.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Hyundai',
    'url':
        'https://images.pexels.com/photos/3354648/pexels-photo-3354648.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Kia',
    'url':
        'https://images.pexels.com/photos/1007410/pexels-photo-1007410.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Maserati',
    'url':
        'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Bugatti',
    'url':
        'https://images.pexels.com/photos/457418/pexels-photo-457418.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Volvo',
    'url':
        'https://images.pexels.com/photos/136872/pexels-photo-136872.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Alfa Romeo',
    'url':
        'https://images.pexels.com/photos/831475/pexels-photo-831475.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
  {
    'brand': 'Koenigsegg',
    'url':
        'https://images.pexels.com/photos/6894429/pexels-photo-6894429.jpeg?auto=compress&cs=tinysrgb&w=600',
  },
];
String? brand;

class _Gallery_ImageState extends State<Gallery_Image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 215, 243),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                // isSelected[index] = !isSelected[index];
                // if (isSelected[index] == true) {
                //   brand = carBrandImages[index]['brand'];
                // }
                brand = carBrandImages[index]['brand'];
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => Inside_Image(brand: brand),
                  ),
                );
              });
            },
            child: Stack(
              children: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(
                    carBrandImages[index]['url']!,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Color.fromARGB(118, 10, 20, 30),
                    child: Center(
                      child: Text(
                        carBrandImages[index]['brand']!,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },

        itemCount: carImageUrls.length,
      ),
    );
  }
}
