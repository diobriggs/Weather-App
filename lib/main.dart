import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String cityName = '';
  String temperature = '---';
  String weatherCondition = '---';

  // Simulate fetching weather data
  void _fetchWeatherData() {
    final random = Random();
    setState(() {
      cityName = _cityController.text;
      temperature = '${15 + random.nextInt(16)}°C'; // Random temperature between 15°C and 30°C
      weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][random.nextInt(3)]; // Random weather condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Container(
        color: Colors.green, // Set background color to green
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Check Weather',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white70, // Background color for text field
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeatherData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Updated to backgroundColor
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 32),
            Text(
              'City: $cityName',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Temperature: $temperature',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Condition: $weatherCondition',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
