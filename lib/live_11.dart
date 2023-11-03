import 'package:flutter/material.dart';

import 'dart:convert';

import 'weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  List<WeatherData> weatherDataList = [];

  @override
  void initState() {
    super.initState();
    // Replace this JSON string with your actual data source.
    final jsonString = '''
    [
      {
        "city": "New York",
        "temperature": 20,
        "condition": "Clear",
        "humidity": 60,
        "windSpeed": 5.5
      },
      {
        "city": "Los Angeles",
        "temperature": 25,
        "condition": "Sunny",
        "humidity": 50,
        "windSpeed": 6.8
      },
      {
        "city": "London",
        "temperature": 15,
        "condition": "Partly Cloudy",
        "humidity": 70,
        "windSpeed": 4.2
      },
      {
        "city": "Tokyo",
        "temperature": 28,
        "condition": "Rainy",
        "humidity": 75,
        "windSpeed": 8.0
      },
      {
        "city": "Sydney",
        "temperature": 22,
        "condition": "Cloudy",
        "humidity": 55,
        "windSpeed": 7.3
      }
    ]
    ''';

    final List<dynamic> jsonData = json.decode(jsonString);
    weatherDataList = jsonData.map((data) => WeatherData.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: ListView.builder(
        itemCount: weatherDataList.length,
        itemBuilder: (context, index) {
          final weatherData = weatherDataList[index];
          return ListTile(
            title: Text(weatherData.city),
            subtitle: Text(
              'Temperature: ${weatherData.temperature}°C\nCondition: ${weatherData.condition}\nHumidity: ${weatherData.humidity}%\nWind Speed: ${weatherData.windSpeed} km/h',
            ),
          );
        },
      ),
    );
  }
}
