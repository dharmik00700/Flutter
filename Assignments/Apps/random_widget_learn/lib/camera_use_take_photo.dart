import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CameraUseTakePhoto extends StatefulWidget {
  const CameraUseTakePhoto({super.key});

  @override
  State<CameraUseTakePhoto> createState() => _CameraUseTakePhotoState();
}

class _CameraUseTakePhotoState extends State<CameraUseTakePhoto>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ImagePicker picker = ImagePicker();
  List<File> image = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    loaddata();
  }
  Future<void> savedata() async{
    final prefer = await SharedPreferences.getInstance();
    List<String> images = image.map((file)=>file.path).toList();
    prefer.setStringList('images', images);
    }

  Future<void> loaddata() async{
    final prefer = await SharedPreferences.getInstance();
    List<String>? imagepath = prefer.getStringList('images');
    if(imagepath!=null){
      setState(() {
        image = imagepath.map((path)=>File(path)).toList();
      });
    }
  }



  Future<void> takephoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        image.add(File(photo.path));
      });
      savedata();
      tabController.animateTo(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('take photo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 50,
            color: Colors.yellow,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: [
                Tab(text: 'Take'),
                Tab(text: 'show'),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            color: Colors.grey,
            height: 500,
            child: TabBarView(
              controller: tabController,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: takephoto,
                    child: Text('take photo'),
                  ),
                ),
                image.isEmpty
                    ? Center(child: Text("No images taken yet"))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: image.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onLongPress: () {
                              setState(() {
                                image.removeAt(index);
                              });
                            },
                            child: Image.file(
                              image[index],
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
