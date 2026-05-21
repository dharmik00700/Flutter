import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_widget_learn/howdatabase__create/providermodel.dart';

class Provider_statemenagement extends StatefulWidget {
  const Provider_statemenagement({super.key});

  @override
  State<Provider_statemenagement> createState() =>
      _Provider_statemenagementState();
}

class _Provider_statemenagementState extends State<Provider_statemenagement> {
  @override
  Widget build(BuildContext context) {
    String values = Provider.of<providerexplain>(context).value.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('provider Statemanagement :'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkResponse(
              borderRadius: BorderRadius.all(Radius.circular(21)),
              splashColor: Color.fromARGB(255, 239, 201, 246),
              focusColor: Colors.deepPurpleAccent,
              hoverColor: Colors.white,
              hoverDuration: Duration(seconds: 2),
              onTap: () {
                Provider.of<providerexplain>(
                  context,
                  listen: false,
                ).increment();
              },
              onLongPress: () {
                Provider.of<providerexplain>(
                  context,
                  listen: false,
                ).increment();
              },
              child: Card(
                shadowColor: Color.fromARGB(255, 3, 18, 82),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),

                elevation: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.purple,
                    child: Center(
                      child: Text(
                        "Count\n$values",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
