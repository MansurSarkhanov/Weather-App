import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';

import '../custom_text.dart';
import '../daily_tempfc.dart';
import '../days_temp.dart';

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
                  const ForecastHeaderCard(),
                  DaysTemp(widget: widget),
                  _avaregeText(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Image.asset(ImagePath.forecast.toPath()),
                  ),
                  _planCard(),
                  DailtTempCF(widget: widget)
                ],
              ),
            ),
          );
  }

  Padding _planCard() {
    return Padding(
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
                    style: TextStyle(color: Colors.white, fontSize: 12),
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
    );
  }

  Padding _avaregeText() {
    return Padding(
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
    );
  }
}

class ForecastHeaderCard extends StatelessWidget {
  const ForecastHeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(color: Color(0xFF32333E), borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
          child: CustomText(
            text: "3 days of forecast",
            size: 12,
          )),
    );
  }
}

