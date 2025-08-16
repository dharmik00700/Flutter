import 'dart:async';

Future<void> fetchWeatherData() async {
  print('Connecting to weather service...');
  await Future.delayed(Duration(seconds: 1));

  print('Fetching latest weather data...');
  await Future.delayed(Duration(seconds: 2));

  print('Processing data...');
  await Future.delayed(Duration(seconds: 1));

  print('Weather data loaded successfully!');
}

void main() {
  fetchWeatherData();
}
/*
Connecting to weather service...
Fetching latest weather data...
Processing data...
Weather data loaded successfully!
 */