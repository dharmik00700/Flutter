import 'dart:convert';

import 'package:weather_app_using_api/weathermodel.dart';
import 'package:http/http.dart'as http;

class WeatherService {
  final String apikey = 'your api key';

  Future<Weather> fetchWeather(String city) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric',
    );
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    }else{
      throw Exception("failed to load weather data");
    }
  }
}
