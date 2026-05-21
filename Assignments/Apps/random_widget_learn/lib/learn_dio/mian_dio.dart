import 'package:flutter/material.dart';
import 'package:random_widget_learn/learn_dio/recipe_model.dart';
import 'package:random_widget_learn/learn_dio/recipe_service.dart';

class Main_dio_Learn extends StatefulWidget {
  const Main_dio_Learn({super.key});

  @override
  State<Main_dio_Learn> createState() => _Main_dio_LearnState();
}

class _Main_dio_LearnState extends State<Main_dio_Learn> {
  RecipeModel? recipeModel;

  @override
  void initState() {
    // TODO: implement initState
    getapidata();
    super.initState();
  }

  Future<void> getapidata() async {
    try {
      recipeModel = await RecipeService().getrecipe();
      setState(() {});
    } on Exception catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Dio'),
        backgroundColor: Colors.tealAccent,
      ),
    );
  }
}
