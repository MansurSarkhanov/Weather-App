import 'package:flutter/material.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';

import '../../../Product/Utility/Extension/icon_path_extension.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.homeProviderWatch});
  final HomeProvider homeProviderWatch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF373944), Color(0xFF232329)]),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "High",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "|",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Low",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: homeProviderWatch.currentModel?.forecast?.forecastday
                        ?.map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    IconPath.check.toPath(),
                                    width: 16,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    e.date.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Spacer(),
                                  Image.network(
                                    "https:${e.day?.conditionModel?.icon}",
                                    width: 30,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${e.day?.maxtempC.toString()}°',
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${e.day?.mintempC.toString()}°',
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  )
                                ],
                              ),
                            ))
                        .toList() ??
                    [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
