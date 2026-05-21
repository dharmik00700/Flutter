import 'package:flutter/material.dart';
import 'package:random_widget_learn/DESIGN_APPS_UI/movie_mode.dart';
import 'package:random_widget_learn/DESIGN_APPS_UI/movies_description.dart';

class MoviesScreeUi extends StatefulWidget {
  const MoviesScreeUi({super.key});

  @override
  State<MoviesScreeUi> createState() => _MoviesScreeUiState();
}

class _MoviesScreeUiState extends State<MoviesScreeUi>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moviews App Ui', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 32, 31, 31),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.all(10),
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.red,
              dividerColor: Colors.transparent,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber, // The yellow background
              ),
              controller: tabController,
              tabs: [
                Tab(text: 'all'),
                Tab(text: 'hollywood'),
                Tab(text: 'bollywood'),
                Tab(text: 'DRAMA'),
                Tab(text: 'SCI-FI'),
                Tab(text: 'ROMANCE'),
                Tab(text: 'COMEDY'),
                Tab(text: 'HORROR'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Movie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.all(5),

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listOfMovie.length,
              itemBuilder: (context, index) {
                Movie movies = listOfMovie[index];
                return displaymovieslist(movies, context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Trending Movie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 250,
            padding: EdgeInsets.all(5),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listOfMovie.length,
              itemBuilder: (context, index) {
                Movie movies = trendingMovie[index];
                return displaymovieslist(movies, context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

displaymovieslist(movies, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MoviesDescription(list: movies),
        ),
      );
    },
    child: Hero(
      tag: movies.name,
      child: Column(
        children: [
          Card(
            elevation: 10,
            child: Image.network(
              movies.imageUrl,
              width: 140,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            movies.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 15),
              Text(
                movies.rating,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
