import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:random_widget_learn/learn_dio/recipe_model.dart';

class RecipeService {
  final dio = Dio();

  Future<RecipeModel> getrecipe() async {
    try {
      Response response = await dio.get("https://dummyjson.com/recipes");
      return RecipeModel.fromJson(jsonDecode(response.data));
    } on DioException catch (error) {
      log(error.toString());
      throw '$error';
    }
  }
}
