import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';

import '../custom_text.dart';

class ForecastTab extends StatefulWidget {
  const ForecastTab({super.key, required this.homeProviderWatch});
  final HomeProvider homeProviderWatch;
  @override
  State<ForecastTab> createState() => _ForecastTabState();
}

class _ForecastTabState extends State<ForecastTab> {
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                        color: Color(0xFF32333E), borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                        child: CustomText(
                          text: "3 days of forecast",
                          size: 12,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: SizedBox(
                      height: 140,
                      child: Center(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.homeProviderWatch.currentModel?.forecast?.forecastday?.length,
                          itemBuilder: (context, index) {
                            return Container(
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
                                  Image.network(
                                      'http:${widget.homeProviderWatch.currentModel?.forecast?.forecastday?[index].day?.conditionModel?.icon}'),
                                  Text(
                                    items[index],
                                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                                  ),
                                  Text(
                                    '${widget.homeProviderWatch.currentModel?.forecast?.forecastday?[index].day?.avgtempC}°',
                                    style:
                                        const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Text(
                          'Average: ',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                        ),
                        const Text(
                          '28%',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(ImagePath.forecast.toPath()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFF2F313A), Color(0xFF232329)]),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'See minute-by-minute forecasts',
                                  style: TextStyle(color: Colors.grey.shade500),
                                ),
                                const Text(
                                  'Plan for the next 5 hours',
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2F313A)),
                              height: 50,
                              width: 50,
                              child: const Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: widget.homeProviderWatch.currentModel?.forecast?.forecastday
                              ?.map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(14)),
                                          gradient: LinearGradient(colors: [
                                            Color.fromARGB(255, 94, 96, 105),
                                            Color(0xFF2F313A),
                                          ])),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle, color: Color(0xFF2F313A)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                        'AVG',
                                                        style: TextStyle(fontSize: 14, color: Colors.white),
                                                      ),
                                                      Text(
                                                        '${e.day?.avgtempC?.toInt()}°',
                                                        style: const TextStyle(fontSize: 16, color: Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList() ??
                          [],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

List items = ["Sun", "Mon", "Tue"];
