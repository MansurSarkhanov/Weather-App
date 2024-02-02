import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Feature/Components/Card/air_quality_card.dart';
import 'package:weather_app/Feature/Components/Card/sun_moon_card.dart';
import 'package:weather_app/Feature/Components/Card/weather_card.dart';

import '../../../Core/Provider/home_provider.dart';
import '../../../Product/Utility/Extension/icon_path_extension.dart';
import '../../../Product/Utility/Extension/image_path_extension.dart';
import '../Card/detail_card.dart';
import '../custom_text.dart';
import '../hourly_weather.dart';

class TodayTab extends StatefulWidget {
  const TodayTab({super.key, required this.homeProviderWatch});

  final HomeProvider homeProviderWatch;

  @override
  State<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  @override
  Widget build(BuildContext context) {
    return widget.homeProviderWatch.isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.blue,
          ))
        : RefreshIndicator(
            onRefresh: () {
              Provider.of<HomeProvider>(context, listen: false).isLoading = true;
              setState(() {});
              return context.read<HomeProvider>().getWeather();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _dateView(),
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
                        _weatherView()
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Feels like ${widget.homeProviderWatch.currentModel?.current?.feelslikeC}°",
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                      ),
                      Text(
                        '|',
                        style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                      ),
                      Text(
                        'Wind ${widget.homeProviderWatch.currentModel?.current?.windKph} KM/H ',
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
                                  '${widget.homeProviderWatch.currentModel?.current?.windMph} mp/h',
                                  style:
                                      const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
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
                                  ' ${widget.homeProviderWatch.currentModel?.current?.windMph}%   ',
                                  style:
                                      const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
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
                                  ' ${widget.homeProviderWatch.currentModel?.forecast?.forecastday?.first.astro?.sunrise}',
                                  style:
                                      const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
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
                                  ' ${widget.homeProviderWatch.currentModel?.forecast?.forecastday?.first.astro?.sunset}',
                                  style:
                                      const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  HourlyWeather(homeProviderWatch: widget.homeProviderWatch),
                  const SizedBox(
                    height: 24,
                  ),
                  WeatherCard(homeProviderWatch: widget.homeProviderWatch),
                  const SizedBox(
                    height: 24,
                  ),
                  DetailCard(homeProviderWatch: widget.homeProviderWatch),
                  const SizedBox(
                    height: 24,
                  ),
                  AirQualityCard(homeProviderWatch: widget.homeProviderWatch),
                  const SizedBox(
                    height: 24,
                  ),
                  SunMoonCard(homeProviderWatch: widget.homeProviderWatch),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          );
  }

  Column _weatherView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${widget.homeProviderWatch.currentModel?.current?.tempC.toString()}°",
          style: TextStyle(fontSize: 58, color: Colors.grey.shade400),
        ),
        Text(
          "${widget.homeProviderWatch.currentModel?.current?.condition?.text.toString()}",
          style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
        ),
      ],
    );
  }

  Container _dateView() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(color: Color(0xFF32333E), borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
          child: CustomText(
            text: "${widget.homeProviderWatch.date}",
            size: 12,
          )),
    );
  }
}
