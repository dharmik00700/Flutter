import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Model/news_channel_headlines_model.dart';
import 'package:weather_app/Screen/categories_screen.dart';
import 'package:weather_app/Screen/news_detail_screen.dart';
import 'package:weather_app/View_Model/news_view_model.dart';

import '../Model/categories_news_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterItem {
  bbcNews,
  thetimesofindia,
  bbcsports,
  abcNews,
  usatoday,
  aljazeera,
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  final format = DateFormat('MMMM dd, yyyy');
  FilterItem? selectedItem;

  String name = 'bbc-news';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      drawer: Drawer(
        width: width * .7,
        backgroundColor: Color.fromARGB(255, 241, 8, 8),
        elevation: 6,
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Text(
                    'News',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black,
                    child: Center(
                      child: Text(
                        'D',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'DHARMIK MAKWANA',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.category,color: Colors.white,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
              },
              title: Text(
                'Category Screen',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(leading: Icon(Icons.logout,color: Colors.white,),title: Text('Logout',style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),)
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton<FilterItem>(
            initialValue: selectedItem,
            onSelected: (FilterItem item) async {
              selectedItem = item;

              if (FilterItem.bbcNews.name == item.name) {
                name = 'bbc-news';
              }
              if (FilterItem.thetimesofindia.name == item.name) {
                name = 'the-times-of-india';
              }
              if (FilterItem.bbcsports.name == item.name) {
                name = 'bbc-sport';
              }
              if (FilterItem.abcNews.name == item.name) {
                name = 'abc-news';
              }
              if (FilterItem.usatoday.name == item.name) {
                name = 'usa-today';
              }
              if (FilterItem.aljazeera.name == item.name) {
                name = 'al-jazeera-english';
              }
              // SharedPreferencesAsync Data = await SharedPreferencesAsync();
              // Data.setString('Name', name);
            },
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            itemBuilder: (context) => <PopupMenuEntry<FilterItem>>[
              PopupMenuItem<FilterItem>(
                value: FilterItem.bbcNews,
                child: Text('BBC News'),
              ),
              PopupMenuItem<FilterItem>(
                value: FilterItem.thetimesofindia,
                child: Text('India'),
              ),
              PopupMenuItem<FilterItem>(
                value: FilterItem.bbcsports,
                child: Text('BBC Sports'),
              ),
              PopupMenuItem<FilterItem>(
                value: FilterItem.abcNews,
                child: Text('ABC News'),
              ),
              PopupMenuItem<FilterItem>(
                value: FilterItem.usatoday,
                child: Text('USA-Today'),
              ),
              PopupMenuItem<FilterItem>(
                value: FilterItem.aljazeera,
                child: Text('Aljazeera'),
              ),
            ],
          ),
        ],

        title: Text(
          'News',
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 241, 8, 8),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: height * .5,
            width: width,
            color: Color.fromARGB(0, 102, 20, 20),
            child: FutureBuilder<NewsChannelHeadLineModel>(
              future: newsViewModel.FetchNewsChannelHeadlineApi(name),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitSpinningLines(
                      size: 50,
                      color: Color.fromARGB(255, 246, 1, 1),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error'));
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
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
                        child: SizedBox(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: width * .9,
                                height: height * 0.6,
                                padding: EdgeInsets.symmetric(
                                  horizontal: height * .02,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(21),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!
                                        .articles![index]
                                        .urlToImage
                                        .toString(),
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
                              ),
                              Positioned(
                                bottom: 15,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: Color.fromARGB(216, 238, 227, 197),
                                    ),

                                    height: height * .12,
                                    width: width * .8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            snapshot
                                                .data!
                                                .articles![index]
                                                .title
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
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
                                                  fontSize: 14,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                format.format(datetime),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          FutureBuilder<CategoriesNewsModel>(
            future: newsViewModel.FetchCategoriesNewsApi('General'),
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
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
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
        ],
      ),
    );
  }
}
