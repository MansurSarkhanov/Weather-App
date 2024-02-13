import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Feature/Components/custom_text.dart';
import 'package:weather_app/Product/Utility/Extension/icon_path_extension.dart';

class PreciptionTab extends StatefulWidget {
  const PreciptionTab({super.key, required this.homeProviderWatch});
  final HomeProvider homeProviderWatch;

  @override
  State<PreciptionTab> createState() => _PreciptionTabState();
}

class _PreciptionTabState extends State<PreciptionTab> {
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
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        CustomText(
                          text: "Precipition",
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: chatItem
                            .map((e) => Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                  Text(
                                    e.weekDay,
                                    style: TextStyle(color: Colors.grey.shade400),
                                  ),
                                  const Spacer(),
                                  Container(
                                    color: e.color,
                                    height: e.height,
                                    width: 50,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  CustomText(text: e.precentText),
                                ]))
                            .toList()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        CustomText(
                          text: "Precipition",
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10.0),
                    child: Column(
                      children: widget.homeProviderWatch.currentModel?.forecast?.forecastday
                              ?.map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(14)),
                                        color: Color(0xFF2F313A),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 6.0, bottom: 6, left: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(
                                                'http:${widget.homeProviderWatch.currentModel?.forecast?.forecastday?.first.day?.conditionModel?.icon}'),
                                            Column(
                                              children: [
                                                Text(
                                                  '${e.day?.conditionModel?.text}',
                                                  style: const TextStyle(
                                                      color: Color(0xFFFFBD00),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                Text(
                                                  "${e.day?.maxwindKph} km/h",
                                                  style: TextStyle(color: Colors.grey.shade500),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 12.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${e.day?.maxtempC?.toInt()}°/",
                                                        style: const TextStyle(color: Colors.white),
                                                      ),
                                                      Text(
                                                        "${e.day?.mintempC?.toInt()}°",
                                                        style: const TextStyle(color: Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      IconPath.drop.toImage(12),
                                                      const SizedBox(
                                                        width: 12,
                                                      ),
                                                      Text(
                                                        "${e.day?.avghumidity}%",
                                                        style: const TextStyle(color: Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
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

class ChartItemModel {
  final String weekDay;
  final String precentText;
  final double height;
  final Color color;

  ChartItemModel({required this.color, required this.weekDay, required this.precentText, required this.height});
}

List<ChartItemModel> chatItem = [
  ChartItemModel(
      color: const Color(
        0xFF98999C,
      ),
      weekDay: 'SUN',
      precentText: "30%",
      height: 50),
  ChartItemModel(
      color: const Color(
        0xFFD2D2D3,
      ),
      weekDay: 'MON',
      precentText: "60%",
      height: 80),
  ChartItemModel(
      color: const Color(
        0xFF98999C,
      ),
      weekDay: 'TUE',
      precentText: "40%",
      height: 60),
  ChartItemModel(
      color: const Color(
        0xFFD2D2D3,
      ),
      weekDay: 'WED',
      precentText: "80%",
      height: 100),
  ChartItemModel(
      color: const Color(
        0xFF98999C,
      ),
      weekDay: 'THU',
      precentText: "70%",
      height: 90),
  ChartItemModel(
      color: const Color(
        0xFFD2D2D3,
      ),
      weekDay: 'FRI',
      precentText: "50%",
      height: 70),
  ChartItemModel(
      color: const Color(
        0xFF98999C,
      ),
      weekDay: 'SAT',
      precentText: "10%",
      height: 30),
];
