import 'package:flutter/material.dart';
import 'package:weather_app_using_api/weathermodel.dart';
import 'weather_service.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  final TextEditingController _controller = TextEditingController();

  void _getWeather() async {
    final city = _controller.text;
    final weather = await _weatherService.fetchWeather(city);
    setState(() {
      _weather = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'),backgroundColor: Colors.orange,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter city name'),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _getWeather, child: Text('Get Weather')),
            SizedBox(height: 20),
            if (_weather != null) ...[
              Text('City: ${_weather!.city}', style: TextStyle(fontSize: 20)),
              Text(
                'Temperature: ${_weather!.temperature}°C',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Condition: ${_weather!.description}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
