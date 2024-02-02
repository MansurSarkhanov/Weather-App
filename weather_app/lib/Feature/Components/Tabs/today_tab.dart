import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/Product/Utility/Extension/lottie_path_extension.dart';

import '../../../Core/Provider/home_provider.dart';
import '../../../Product/Utility/Extension/icon_path_extension.dart';
import '../../../Product/Utility/Extension/image_path_extension.dart';
import '../custom_text.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({super.key, required this.homeProviderWatch});

  final HomeProvider homeProviderWatch;
  @override
  Widget build(BuildContext context) {
    return homeProviderWatch.isLoading
        ? Lottie.asset(
            LottiePath.loading.toPath(),
            repeat: true,
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                      color: Color(0xFF32333E), borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                      child: CustomText(
                        text: "${homeProviderWatch.date}",
                        size: 12,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ImagePath.homesun.toImage(160),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${homeProviderWatch.currentModel?.current?.tempC.toString()}°",
                            style: TextStyle(fontSize: 58, color: Colors.grey.shade400),
                          ),
                          Text(
                            "${homeProviderWatch.currentModel?.current?.condition?.text.toString()}",
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Feels like ${homeProviderWatch.currentModel?.current?.feelslikeC}°",
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    ),
                    Text(
                      '|',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    ),
                    Text(
                      'Wind ${homeProviderWatch.currentModel?.current?.windKph} KM/H ',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    '------------------------------------',
                    style: TextStyle(fontSize: 14, color: Color(0xFF979797)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconPath.sun.toImage(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Wind: ',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                              ),
                              Text(
                                '${homeProviderWatch.currentModel?.current?.windMph} mp/h',
                                style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconPath.hum.toImage(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Humidity:',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                              ),
                              Text(
                                ' ${homeProviderWatch.currentModel?.current?.windMph}%   ',
                                style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconPath.sunrise.toImage(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sunrise: ',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                              ),
                              Text(
                                ' ${homeProviderWatch.currentModel?.forecast?.forecastday?.first.astro?.sunrise}',
                                style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconPath.sunrise.toImage(),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sunset:',
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
                              ),
                              Text(
                                ' ${homeProviderWatch.currentModel?.forecast?.forecastday?.first.astro?.sunset}',
                                style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                _hourWeather(context),
                const SizedBox(
                  height: 28,
                ),
                _weatherCard(),
                const SizedBox(
                  height: 28,
                ),
              ],
            ),
          );
  }

  Padding _weatherCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        height: 300,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF373944), Color(0xFF232329)]),
            boxShadow: [BoxShadow(blurRadius: 1)],
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

  SizedBox _hourWeather(BuildContext context) {
    return SizedBox(
        height: 150,
        width: context.general.mediaQuery.size.width,
        child: ListView.builder(
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
        )
        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: homeProviderWatch.currentModel?.forecast?.forecastday?.first.hour
        //           ?.map(
        //             (e) => Container(
        //               height: 144,
        //               width: 64,
        //               decoration: const BoxDecoration(
        //                   color: Color.fromARGB(255, 56, 60, 75),
        //                   borderRadius: BorderRadius.all(Radius.circular(30))),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Image.network(
        //                     "https:${e.condition?.icon}",
        //                     width: 40,
        //                     height: 40,
        //                   ),
        //                   Text(
        //                     '${e.tempC}°',
        //                     style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           )
        //           .toList() ??
        //       [],
        // ),
        );
  }
}
