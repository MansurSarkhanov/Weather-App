import 'package:flutter/material.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';

import '../../../Product/Constants/app_strings.dart';

class SunMoonCard extends StatelessWidget {
  const SunMoonCard({super.key, required this.homeProviderWatch});

  final HomeProvider homeProviderWatch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF2F313A), Color(0xFF232329)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    AppStrings.sunMoon,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${homeProviderWatch.currentModel?.forecast?.forecastday?.first.astro?.sunrise}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Sunrise',
                          style: TextStyle(color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: Stack(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 120,
                        child: Center(
                          child: Image.asset(
                            ImagePath.dropline.toPath(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: Image.asset(
                          ImagePath.sun.toPath(),
                          width: 40,
                        ),
                      )
                    ],
                  )),
                  Expanded(
                      child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${homeProviderWatch.currentModel?.forecast?.forecastday?.first.astro?.sunset}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Sunset',
                          style: TextStyle(color: Colors.grey.shade400),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
