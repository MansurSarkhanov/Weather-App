import 'package:flutter/material.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';

import '../../../Product/Constants/app_strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color.fromARGB(255, 117, 133, 155), Colors.white],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePath.splash.toImage(),
                const Text(
                  AppStrings.weather,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(AppStrings.forecast),
              ],
            ),
          )
        ],
      ),
    
    );
  }
}
