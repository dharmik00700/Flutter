import 'dart:ui';

import 'package:flutter/material.dart';

class LearnDart extends StatefulWidget {
  const LearnDart({super.key});

  @override
  State<LearnDart> createState() => _LearnDartState();
}

class _LearnDartState extends State<LearnDart> {
  List<Map<String, String>> data = [
    {
      "what is dart?":
          "Dart is a client-optimized programming language primarily used for building cross-platform mobile, web, and desktop applications, most notably with the Flutter framework. It is also used for server-side development and can be compiled to JavaScript for web development. ",
    },
    {
      "what is flutter?":
          "Flutter is an open-source UI toolkit developed by Google for building natively compiled applications for mobile, web, and desktop from a single codebase. It allows developers to create visually appealing and high-performance applications across multiple platforms, with features like Hot Reload for faster development and a flexible, customizable design system. ",
    },
    {
      'what is mysql?':
          "MySQL is an open-source relational database management system (RDBMS). It is widely used to store and manage data in a structured way, making it a popular choice for web applications and other data-driven systems. ",
    },
    {
      'what is sqlite?':
          "SQFlite is a popular Flutter plugin that enables developers to use SQLite as a local, embedded relational database within their Flutter applications. It provides a straightforward API to interact with the SQLite database, abstracting away much of the complexity of working directly with SQLite.",
    },
    {
      'shared preferences flutter':
          "SharedPreferences in Flutter provides a way to store and retrieve small amounts of primitive data (like String, int, double, bool, and List<String>) as key-value pairs on the device's local storage. This is particularly useful for storing user preferences, settings, or other lightweight data that needs to persist across app sessions. ",
    },
    {
      'what is shared preferences?':
          "Shared Preferences in Flutter refers to a mechanism for persistently storing small amounts of simple data on a user's device. It utilizes a key-value pair system, where a unique key is associated with a corresponding value.",
    },
    {
      'what is c language?':
          "C is a general-purpose, procedural computer programming language developed in the early 1970s by Dennis Ritchie at Bell Labs.",
    },
    {
      'what is C++ language?':
          "C++ is a powerful, general-purpose programming language developed by Bjarne Stroustrup, initially as an extension of the C language. It is a multi-paradigm language, meaning it supports various programming styles, including procedural, object-oriented, and generic programming.",
    },
    {
      'what is python?':
          "Python is a high-level, interpreted, general-purpose programming language. It was created by Guido van Rossum and first released in 1991. Python is known for its readability and simple syntax, which makes it relatively easy to learn and use, especially for beginners. ",
    },
    {
      'what is firebase':
          "Firebase, in the context of Flutter, refers to the integration of Google's Firebase platform with Flutter applications. Firebase is a Backend-as-a-Service (BaaS) platform that provides a comprehensive suite of tools and services for building, managing, and growing mobile and web applications.",
    },
    {
      'firebase which type of service provides?':
          "Authentication,Cloud Firestore,Realtime Database,Storage,Analytics,Crashlytics,Cloud Storage,Cloud Messaging",
    },
    {
      'what is Android SDK?':
          "The Android SDK is a collection of tools, libraries, and resources developed by Google for creating Android applications. It includes debuggers, emulators, and libraries that allow developers to build, test, and package their apps for the Android platform. ",
    },
    {
      'what is provider?':
          "\"Provider\" refers to a popular state management solution, implemented as a package, that simplifies how data is shared and managed across different parts of your application. It acts as a wrapper around the InheritedWidget mechanism, providing a more convenient and less verbose way to manage application state.",
    },
    {
      'flutter provider which type of service provide?':
          "Exposing and Accessing Data,Listening for Changes and Rebuilding Widgets,Separation of Concerns",
    },
    {
      'what is GetX ?':
          "GetX is a powerful, lightweight, and highly performant state management library for Flutter. It provides a comprehensive solution for various aspects of Flutter development, encompassing state management, route management, and dependency injection, all designed to simplify development and enhance application performance. ",
    },
    {
      'flutter Getx which type of service provide?':
          "Reactive State Management,Simple State Management,GetX Widgets,Dependency Injection,Route Management",
    },
    {
      'what is Dio in Flutter ?':
          "Dio is a powerful and popular third-party HTTP client library for Dart and Flutter. It simplifies and enhances the process of making network requests (like GET, POST, PUT, DELETE) to APIs from your Flutter application. ",
    },
    {
      'whta is http in flutter?':
          "In Flutter, \"http\" primarily refers to the http package, which is a popular and widely used library for making HTTP requests and handling network communication.",
    },
    {
      'http Functionality':
          "GET: To retrieve data from a server. POST: To send data to a server (e.g., creating a new resource).PUT: To update existing data on a server.DELETE: To remove data from a server.",
    },
    {
      'what is Flutter DevTools?':
          "Flutter DevTools is a suite of performance and debugging tools designed for Dart and Flutter applications. It provides developers with a comprehensive set of functionalities to inspect, analyze, and optimize their applications during development. ",
    },
    {
      'what is postman?':
          "Postman is an API platform used by developers to create, test, and document APIs. It simplifies the process of sending and receiving requests, analyzing responses, and collaborating on API development through a graphical user interface. ",
    },
    {
      'what is Routing & Navigation in flutter?':
          "In Flutter, Routing & Navigation refers to the system for moving between different screens or \"pages\" within an application and managing the flow and organization of these screens. It's a fundamental aspect of building any multi-screen mobile application",
    },
    {
      'what is asynchronous programming in flutter?':
          "Asynchronous programming in Flutter, powered by Dart, is a paradigm that allows your application to perform time-consuming operations without blocking the main user interface (UI) thread. This ensures a smooth and responsive user experience, preventing the app from freezing during tasks like network requests, file I/O, or complex computations.",
    },
    {
      'what is Stateless & Stateful Widgets in flutter?':
          "Stateless widgets are immutable and don't have changeable internal state, meaning they are static once built, while Stateful widgets are mutable and can change their appearance during the app's lifetime in response to user interaction or other events",
    },
    {
      'what is Widget Lifecycle in flutter?':
          "createState(),initState(),didChangeDependencies(),build(BuildContext context),didUpdateWidget(covariant T oldWidget),setState(VoidCallback fn),deactivate(),dispose()",
    },
    {
      'what is state management in flutter':
          "State management in Flutter addresses the challenge of handling and updating the data that defines the current condition of an application and how it influences the user interface. In essence, it's about organizing how data is accessed, shared, and modified across different parts of your Flutter app, particularly between widgets.",
    },
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var quesion = TextEditingController();
  var answer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text(
          'Learn Dart',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 195, 34, 255), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 3, 42, 65),
                          Color.fromARGB(255, 122, 194, 234),
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: quesion,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter quetion';
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter Quesion Name :-',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                  enabled: true,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: answer,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter answer';
                                  }
                                },
                                maxLines: 5,

                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  hintText: 'Enter Answer Name :-',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                  ),
                                  enabled: true,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        data.add({quesion.text: answer.text});
                                        quesion.clear();
                                        answer.clear();
                                        _formKey.currentState?.save();
                                        Navigator.pop(context);
                                      });
                                    }
                                  },
                                  child: Text('Add'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.white,
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      35,
                                      100,
                                      21,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _formKey.currentState?.reset();
                                  },
                                  child: Text('reset'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.white,
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      100,
                                      14,
                                      14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              shadowColor: Colors.black,
              elevation: 5,
              borderOnForeground: true,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 0, 0, 0), Colors.white],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 4, 65, 100),
                              Colors.white,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        data[index].keys.first,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Card(
                      margin: EdgeInsets.only(right: 5, left: 5, bottom: 5),
                      color: Colors.grey.withAlpha(25),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[index].values.first,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
