import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Product/Constants/app_colors.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';

import '../../../Product/Constants/app_strings.dart';
import '../../Components/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    context.read<HomeProvider>().getWeather();
  }

  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = context.watch<HomeProvider>();

    return Scaffold(
        backgroundColor: AppColors.backColor,
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            dividerHeight: 0.5,
            isScrollable: true,
            indicatorColor: Colors.white,
            tabAlignment: TabAlignment.center,
            controller: tabController,
            labelPadding: const EdgeInsets.all(16),
            labelColor: Colors.white,
            tabs: const [
              CustomText(text: AppStrings.today),
              CustomText(text: AppStrings.forecastHome),
              CustomText(text: AppStrings.preciption),
              CustomText(text: AppStrings.radar)
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                ))
          ],
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          title: CustomText(
              text:
                  '${homeProviderWatch.currentModel?.location?.name}, ${homeProviderWatch.currentModel?.location?.country}'),
          backgroundColor: AppColors.backColor,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Column(
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
                    ),
                  ),
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
                )
              ],
            ),
            Container(),
            Container(),
            Container(),
          ],
        ));
  }
}
