import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:intl/intl.dart';
import 'package:weather_app/Model/categories_news_model.dart';

import '../View_Model/news_view_model.dart';
import 'news_detail_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  final format = DateFormat('MMMM dd, yyyy');

  String categories = 'General';

  List<String> categoriesList = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Business',
    'Science',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CATEGORIES NEWS',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 241, 8, 8),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    categories = categoriesList[index];
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: categories == categoriesList[index]
                          ? Color.fromARGB(255, 162, 6, 6)
                          : Color.fromARGB(255, 255, 2, 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        categoriesList[index],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<CategoriesNewsModel>(
              future: newsViewModel.FetchCategoriesNewsApi(categories),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Center(
                      child: SpinKitSpinningLines(
                        size: 50,
                        color: Color.fromARGB(255, 246, 1, 1),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      DateTime datetime = DateTime.parse(
                        snapshot.data!.articles![index].publishedAt.toString(),
                      );
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(
                                newImage: snapshot
                                    .data!
                                    .articles![index]
                                    .urlToImage
                                    .toString(),
                                newsTitle: snapshot.data!.articles![index].title
                                    .toString(),
                                author: snapshot.data!.articles![index].author
                                    .toString(),
                                description: snapshot
                                    .data!
                                    .articles![index]
                                    .description
                                    .toString(),
                                content: snapshot.data!.articles![index].content
                                    .toString(),
                                source: snapshot
                                    .data!
                                    .articles![index]
                                    .source!
                                    .name
                                    .toString(),
                                newsDate: format.format(datetime),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 4,
                          color: Color.fromARGB(255, 239, 230, 190),
                          child: Container(
                            margin: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(21),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!
                                        .articles![index]
                                        .urlToImage
                                        .toString(),
                                    height: height * .18,
                                    width: width * .3,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        SpinKitSpinningLines(
                                          color: Colors.black,
                                          size: 50,
                                        ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error_outline_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 15),
                                    height: height * .18,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${snapshot.data!.articles![index].title}',
                                          maxLines: 3,
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),

                                        Text(
                                          snapshot
                                              .data!
                                              .articles![index]
                                              .source!
                                              .name
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          format.format(datetime),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
