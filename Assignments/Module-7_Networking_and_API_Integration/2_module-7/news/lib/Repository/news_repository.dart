import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/Model/categories_news_model.dart';
import 'package:weather_app/Model/news_channel_headlines_model.dart';

class NewsRepository {
  Future<NewsChannelHeadLineModel> FetchNewsChannelHeadlineApi(String channel) async {
    final Apikey = '7a0ad2024bd3492c95d8dceb2fc2c0db';

    // another way to data fetch
    // SharedPreferencesAsync Data = await SharedPreferencesAsync();
    // String? name = await Data.getString('Name') ?? 'bbc-news';
    // print('--------$name-----------');

    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?sources=$channel&apiKey=$Apikey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelHeadLineModel.fromJson(body);
    }
    throw Exception('error');
  }
  Future<CategoriesNewsModel> FetchCategoriesNewsApi(String categories) async {
    final Apikey = '7a0ad2024bd3492c95d8dceb2fc2c0db';
    // SharedPreferencesAsync Data = await SharedPreferencesAsync();
    // String? name = await Data.getString('Name') ?? 'bbc-news';
    // print('--------$name-----------');

    final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=$categories&apikey=$Apikey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('error');
  }
}
