import 'package:flutter/material.dart';

class MoviesDescription extends StatefulWidget {
  final list;

  const MoviesDescription({super.key, this.list});

  @override
  State<MoviesDescription> createState() => _MoviesDescriptionState();
}

class _MoviesDescriptionState extends State<MoviesDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.list.name,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(


                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Image.network(widget.list.imageUrl, fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${widget.list.name}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Release Date: ${widget.list.year}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 6),
            Text(
              'Rating: ${widget.list.rating}',
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Description: ${widget.list.description}',textAlign: TextAlign.justify
                ,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
