import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projectforlearn/databaseuse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ZeptoMainScreen(),
    );
  }
}

class ZeptoMainScreen extends StatefulWidget {
  const ZeptoMainScreen({super.key});

  @override
  State<ZeptoMainScreen> createState() => _ZeptoMainScreenState();
}

class _ZeptoMainScreenState extends State<ZeptoMainScreen>
    with SingleTickerProviderStateMixin {
  bool isvisible = true;
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> tabItems = [
    {"title": "Home", "tabbar": 'assets/images/tabbar-1.jpg'},
    {"title": "Search", "tabbar": 'assets/images/tabbar-1.jpg'},
    {"title": "Profile", "tabbar": 'assets/images/tabbar-1.jpg'},
    {"title": "Settings", "tabbar": 'assets/images/tabbar-1.jpg'},
    {"title": "Help", "tabbar": 'assets/images/tabbar-1.jpg'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabItems.length, vsync: this);

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isvisible) {
          setState(() {
            isvisible = false;
          });
        }
      } else {
        if (!isvisible) {
          setState(() {
            isvisible = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Padding(
                padding: isvisible
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'ROYAL INDUSTRY',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 245, 176, 8),
                  ),
                ),
              ),
              expandedHeight: 180,
              pinned: true,
              floating: false,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(color: Color.fromARGB(255, 0, 0, 0)),
                centerTitle: true,
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(77),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search, color: Colors.white60),
                          hintStyle: TextStyle(color: Colors.white60),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 75,
                      color: Colors.black,
                      width: double.maxFinite,
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          // shape: BoxShape.circle,
                          color: Colors.white.withAlpha(100),
                        ),
                        labelPadding: EdgeInsets.symmetric(horizontal: 7),
                        tabs: tabItems.map((item) {
                          return Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              // shape: BoxShape.circle,
                              // border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: CircleAvatar(
                                    radius: 19, // Half of width/height (30/2)
                                    backgroundImage: AssetImage(
                                      'assets/images/tabbar-1.jpg',
                                    ),
                                    onBackgroundImageError:
                                        (exception, stackTrace) {
                                          // Handle error here if needed
                                        },
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromARGB(255, 245, 176, 8),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(20),
            //       child: Container(height: 400, color: Colors.deepPurple[300]),
            //     ),
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(20),
            //       child: Container(height: 400, color: Colors.deepPurple[300]),
            //     ),
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(20),
            //       child: Container(height: 400, color: Colors.deepPurple[300]),
            //     ),
            //   ),
            // ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Databaseuse(),
                  Container(color: Colors.blue),
                  Container(color: Colors.pink),
                  Container(color: Colors.yellow),
                  Container(color: Colors.redAccent),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isvisible ? 60.0 : 0.0,
          // Increased height to prevent overflow
          decoration: BoxDecoration(color: Colors.black),
          child: SingleChildScrollView(
            // Prevents Re nderFlex overflow when height is animating or too small
            physics: const NeverScrollableScrollPhysics(),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              // Transparent to show pink container
              elevation: 0,
              selectedItemColor: Color.fromARGB(255, 245, 176, 8),
              unselectedItemColor: Colors.white60,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'PROFILE',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
