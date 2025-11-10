import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({
    super.key,
    required this.newImage,
    required this.newsTitle,
    required this.author,
    required this.description,
    required this.content,
    required this.source,
    required this.newsDate,
  });

  final String newImage,
      newsTitle,
      newsDate,
      author,
      description,
      content,
      source;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.source,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              child: Container(
                height: height * .45,
                child: CachedNetworkImage(
                  imageUrl: widget.newImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      SpinKitSpinningLines(color: Colors.black, size: 50),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error_outline_outlined, color: Colors.red),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              color: Color.fromARGB(213, 245, 244, 226),
            ),
            height: height * .6,
            margin: EdgeInsets.only(top: height * .4),
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: ListView(
              children: [
                Text(
                  widget.newsTitle,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: height * .02),
                Row(
                  children: [
                    Text(
                      widget.author,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 14,
                      ),
                    ),
                    Spacer(),
                    Text(
                      widget.newsDate,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,

                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .03),
                Text(
                  widget.description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,

                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
