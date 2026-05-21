import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_widget_learn/getx_class_increament.dart';

class GetxHomeScreen extends StatefulWidget {
  const GetxHomeScreen({super.key});

  @override
  State<GetxHomeScreen> createState() => _GetxHomeScreenState();
}

final countercontroller controller = countercontroller();

class _GetxHomeScreenState extends State<GetxHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'gex tutorials',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('title', 'message');
        },
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Card(
            color: Color.fromARGB(255, 69, 10, 99),
            elevation: 10,
            child: ListTile(
              textColor: Colors.white,
              title: Text(
                'Snapshot Show',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.snackbar(
                  '',
                  '',
                  titleText: Text(
                    'title testing',
                    style: TextStyle(color: Colors.white),
                  ),
                  messageText: Text(
                    'message testing',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Color.fromARGB(255, 69, 10, 99),
            elevation: 10,
            child: ListTile(
              textColor: Colors.white,
              title: Text(
                'DialogBox Show',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.defaultDialog(
                  title: 'Delete Chat',
                  middleText: 'Are you sure you want to delete this chat?',

                  // textCancel: 'Cancel', this is button
                  // textConfirm: 'Yes',
                  confirm: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Open'),
                  ),
                  cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Color.fromARGB(255, 69, 10, 99),
            elevation: 10,
            child: ListTile(
              textColor: Colors.white,
              title: Text(
                'Bottom Sheet Show',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21),
                      ),
                      border: Border.symmetric(
                        horizontal: BorderSide(width: 2, color: Colors.white),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF6236BE), // Deep Purple
                          Color(0xFF147EFF), // Vibrant Blue
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 16, 51, 161),
                            elevation: 10,
                            child: ListTile(
                              leading: Icon(
                                Icons.light_mode,
                                color: Colors.yellowAccent,
                              ),
                              textColor: Colors.white,
                              title: Text(
                                'Light Mode',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                Get.changeTheme(ThemeData.light());
                                Get.back();
                              },
                            ),
                          ),
                          Card(
                            color: Color.fromARGB(255, 0, 0, 0),
                            elevation: 10,
                            child: ListTile(
                              leading: Icon(
                                Icons.dark_mode,
                                color: Colors.grey,
                              ),
                              textColor: Colors.white,
                              title: Text(
                                'Dark Mode',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                Get.changeTheme(ThemeData.dark());
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(21)),
            ),
            child: Container(
              width: double.maxFinite,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(21)),
                border: Border.all(width: 2, color: Colors.white),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(248, 231, 239, 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'hello'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Get.updateLocale(Locale('en', 'US'));
                          },
                          child: Text(
                            'Us Translate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.updateLocale(Locale('hi', 'IN'));
                          },
                          child: Text(
                            'Hindi Translate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(21)),
            ),
            child: Container(
              width: double.maxFinite,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(21)),
                border: Border.all(width: 2, color: Colors.white),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 17, 209, 234),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => Text(
                        controller.count.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            controller.increament();
                          },
                          child: Text(
                            '+',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            controller.Deincreament();
                          },
                          child: Text(
                            '-',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
