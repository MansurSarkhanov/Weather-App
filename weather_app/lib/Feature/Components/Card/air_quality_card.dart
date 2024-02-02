import 'package:flutter/material.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';

import '../../../Product/Constants/app_strings.dart';

class AirQualityCard extends StatelessWidget {
  const AirQualityCard({super.key, required this.homeProviderWatch});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.airQuality,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            ImagePath.airquality.toPath(),
                            fit: BoxFit.fill,
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${homeProviderWatch.currentModel?.current?.airModel?.o3?.toInt()}",
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                "Moderate",
                                style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        'You have good air quality - enjoy your outdoor activities.',
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                      ))
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
