import 'package:flutter/material.dart';

import 'Tabs/forecast_tab.dart';

class DaysTemp extends StatelessWidget {
  const DaysTemp({
    super.key,
    required this.widget,
  });

  final ForecastTab widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                        'http:${widget.homeProviderWatch.currentModel?.forecast?.forecastday?[index].day?.conditionModel?.icon}'),
                    Text(
                      items[index],
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    ),
                    Text(
                      '${widget.homeProviderWatch.currentModel?.forecast?.forecastday?[index].day?.avgtempC}°',
                      style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List items = ["Sun", "Mon", "Tue"];
