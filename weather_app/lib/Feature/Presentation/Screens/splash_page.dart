import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Feature/Presentation/Screens/onboarding_page.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';
import 'package:weather_app/Product/Utility/Mixin/splash_mixin.dart';

import '../../../Core/Provider/splash_provider.dart';
import '../../../Product/Constants/app_strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<SplashProvider>().isSplash
            ? Stack(
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
              )
            : const OnboardingPage()
    
    );
  }
}
