import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Page_Builder(), debugShowCheckedModeBanner: false));
}

class Page_Builder extends StatefulWidget {
  const Page_Builder({super.key});

  @override
  State<Page_Builder> createState() => _Page_BuilderState();
}

final List<String> images = [
  'assets/images/car1.jpg',
  'assets/images/car2.jpg',
  'assets/images/car3.jpg',
  'assets/images/car4.jpg',
];
late List<Widget> page;
int activepage = 0;
PageController pageController = PageController(initialPage: 0);
Timer? timer;

class _Page_BuilderState extends State<Page_Builder> {

  void starttimer(){
    timer = Timer.periodic(Duration(seconds: 3), (timer){
      if(pageController.page==images.length-1){
        pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }else{
        pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = List.generate(images.length, (index) {
      return Images(imagepath: images[index]);
    });
    starttimer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'carousel slider',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 215, 243),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                child: PageView.builder(
                  itemCount: images.length,
                  controller: pageController,
                  onPageChanged: (value){
                    setState(() {
                      activepage=value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return page[index];
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      page.length,
                      (index) => InkWell(
                        onTap: () {
                          pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: activepage == index ? 6 : 4,
                            backgroundColor: activepage == index
                                ? Color.fromARGB(255, 207, 147, 243)
                                : Color.fromARGB(255, 255, 208, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Images extends StatelessWidget {
  final String? imagepath;

  const Images({super.key, this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagepath!, fit: BoxFit.cover);
  }
}
