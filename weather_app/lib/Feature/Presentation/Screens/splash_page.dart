import 'package:flutter/material.dart';
import 'package:weather_app/Core/Service/Network/network_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final NetworkService _service = NetworkService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _service.fetchWeather();
      }),
    );
  }
}
