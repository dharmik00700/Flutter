import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class PathProviderLearn extends StatefulWidget {
  const PathProviderLearn({super.key});

  @override
  State<PathProviderLearn> createState() => _PathProviderLearnState();
}

class _PathProviderLearnState extends State<PathProviderLearn> {
  PathService pathService = PathService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Provider Learn'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Text('GET DOCUMENT PATH : ${PathService.getdocumentspath().toString()} '),
          Text('GET TEMPORARY PATH : ${PathService.getcachepath()} '),
        ],
      ),
    );
  }
}

class PathService {
  static Future getdocumentspath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future getcachepath() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }
}
