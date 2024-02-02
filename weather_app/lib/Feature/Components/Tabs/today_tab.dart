import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../Core/Provider/home_provider.dart';
import '../../../Product/Utility/Extension/icon_path_extension.dart';
import '../../../Product/Utility/Extension/image_path_extension.dart';
import '../custom_text.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({super.key, required this.homeProviderWatch});

  final HomeProvider homeProviderWatch;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration:
              const BoxDecoration(color: Color(0xFF32333E), borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
              child: homeProviderWatch.isLoading
                  ? const CupertinoActivityIndicator(
                      color: Colors.white,
                    )
                  : CustomText(
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
                  homeProviderWatch.isLoading
                      ? const CupertinoActivityIndicator(
                          radius: 50,
                          color: Colors.white,
                        )
                      : Text(
                          "${homeProviderWatch.currentModel?.current?.tempC.toString()}°",
                          style: TextStyle(fontSize: 58, color: Colors.grey.shade400),
                        ),
                  if (homeProviderWatch.isLoading) ...[
                    const SizedBox(
                      height: 16,
                    )
                  ],
                  homeProviderWatch.isLoading
                      ? const CupertinoActivityIndicator(
                          color: Colors.white,
                        )
                      : Text(
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
            homeProviderWatch.isLoading
                ? const CupertinoActivityIndicator(color: Colors.white)
                : Text(
                    "Feels like ${homeProviderWatch.currentModel?.current?.feelslikeC}°",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  ),
            Text(
              '|',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            ),
            homeProviderWatch.isLoading
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : Text(
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
                      homeProviderWatch.isLoading
                          ? const CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                          : Text(
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
                      homeProviderWatch.isLoading
                          ? const CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                          : Text(
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
                      homeProviderWatch.isLoading
                          ? const CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                          : Text(
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
                      homeProviderWatch.isLoading
                          ? const CupertinoActivityIndicator()
                          : Text(
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
          height: 20,
        ),
        SizedBox(
            height: 150,
            width: context.general.mediaQuery.size.width,
            child: ListView.builder(
              itemCount: homeProviderWatch.currentModel?.forecast?.forecastday?.first.hour?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
               
                DateTime? parsedDate = DateTime.parse(
                    homeProviderWatch.currentModel?.forecast?.forecastday?.first.hour?[index].time ??
                        '2024-02-02 00:00');
                String? hourMinute = '${parsedDate.hour}:${parsedDate.minute}0';

                
             
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  height: 144,
                  width: 64,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 56, 60, 75), borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        hourMinute,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      homeProviderWatch.isLoading
                          ? const CupertinoActivityIndicator()
                          : Image.network(
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
            )
      ],
    );
  }
}
