import 'package:flutter/material.dart';

import '../../Product/Constants/app_colors.dart';
import 'Tabs/forecast_tab.dart';

class DailtTempCF extends StatelessWidget {
  const DailtTempCF({
    super.key,
    required this.widget,
  });

  final ForecastTab widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10.0),
      child: Column(
        children: widget.homeProviderWatch.currentModel?.forecast?.forecastday
                ?.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            gradient: LinearGradient(colors: [
                              AppColors.backColor,
                              Color(0xFF2F313A),
                              AppColors.backColor,
                            ])),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6, left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [BoxShadow(blurRadius: 10)],
                                  shape: BoxShape.circle,
                                  color: Color(0xFF2F313A),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'AVG',
                                        style: TextStyle(fontSize: 12, color: Colors.white),
                                      ),
                                      Text(
                                        '${e.day?.avgtempC?.toInt()}°',
                                        style: const TextStyle(fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${e.day?.conditionModel?.text}',
                                    style: const TextStyle(
                                        color: Color(0xFFFFBD00), fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${e.astro?.sunrise}',
                                        style: TextStyle(color: Colors.grey.shade500),
                                      ),
                                      const Text("  |  "),
                                      Text(
                                        "${e.astro?.sunset}",
                                        style: TextStyle(color: Colors.grey.shade500),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [BoxShadow(blurRadius: 10)],
                                  shape: BoxShape.circle,
                                  color: Color(0xFF2F313A),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        'AVG',
                                        style: TextStyle(fontSize: 12, color: Colors.white),
                                      ),
                                      Text(
                                        '${e.day?.avgtempF?.toInt()}F',
                                        style: const TextStyle(fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList() ??
            [],
      ),
    );
  }
}
