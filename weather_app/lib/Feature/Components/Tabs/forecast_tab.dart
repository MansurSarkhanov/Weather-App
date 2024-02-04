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
                  SizedBox(
                    height: 150,
                    child: Center(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.homeProviderWatch.currentModel?.forecast?.forecastday?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.network(
                                    'http:${widget.homeProviderWatch.currentModel?.forecast?.forecastday?[index].day?.conditionModel?.icon}'),
                                Text(
                                  items[index],
                                  style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                                ),
                                const SizedBox(
                                  height: 8,
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
                  Image.asset(ImagePath.forecast.toPath())
                ],
              ),
            ),
          );
  }
}
List items = ["Sun", "Mon", "Tue"];
