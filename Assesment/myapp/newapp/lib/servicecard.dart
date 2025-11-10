import 'package:flutter/material.dart';
import 'package:newapp/servicedetail.dart';
import 'package:newapp/servicemodel.dart';

class ServiceCard extends StatelessWidget {


  const ServiceCard({super.key, required this.service});
  final Service service;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ServiceDetailScreen(service: service))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.network(service.image, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Icon(Icons.image, size: 48))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(service.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(service.category),
                  Row(children: [Icon(Icons.star, size: 16), Text(service.rating.toStringAsFixed(1))]),
                ])
              ]),
            )
          ],
        ),
      ),
    );
  }
}