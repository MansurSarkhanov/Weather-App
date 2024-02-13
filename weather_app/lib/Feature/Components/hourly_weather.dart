import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../Core/Provider/home_provider.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({
    super.key,
    required this.homeProviderWatch,
  });

  final HomeProvider homeProviderWatch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        width: context.general.mediaQuery.size.width,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 8, right: 8),
          itemCount: homeProviderWatch.currentModel?.forecast?.forecastday?.first.hour?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            DateTime? parsedDate = DateTime.parse(
                homeProviderWatch.currentModel?.forecast?.forecastday?.first.hour?[index].time ?? '2024-02-02 00:00');
            String? hourMinute = '${parsedDate.hour}:${parsedDate.minute}0';

            return Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                width: 64,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 56, 60, 75),
                    boxShadow: [BoxShadow(blurRadius: 8)],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hourMinute,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Image.network(
                      "https:${homeProviderWatch.currentModel?.forecast?.forecastday?.first.hour?[index].condition?.icon}",
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      '${homeProviderWatch.currentModel?.forecast?.forecastday?.first.hour?[index].tempC}°',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
