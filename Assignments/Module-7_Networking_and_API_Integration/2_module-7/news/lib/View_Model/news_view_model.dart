import 'package:weather_app/Model/categories_news_model.dart';
import 'package:weather_app/Model/news_channel_headlines_model.dart';
import 'package:weather_app/Repository/news_repository.dart';

class NewsViewModel {
  final res = NewsRepository();

  Future<NewsChannelHeadLineModel> FetchNewsChannelHeadlineApi(
    String channel,
  ) async {
    final response = await res.FetchNewsChannelHeadlineApi(channel);
    return response;
  }

  Future<CategoriesNewsModel> FetchCategoriesNewsApi(String categories) async {
    final response = await res.FetchCategoriesNewsApi(categories);
    return response;
  }
}
