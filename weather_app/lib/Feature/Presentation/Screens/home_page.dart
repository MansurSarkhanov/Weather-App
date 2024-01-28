import 'package:flutter/material.dart';
import 'package:weather_app/Product/Constants/app_colors.dart';

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
  }
  @override
  Widget build(BuildContext context) {
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
            tabs: const [
              CustomText(text: "Today"),
              CustomText(text: "Forecast"),
              CustomText(text: "Precipitation"),
              CustomText(text: "Radar")
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
          title: const CustomText(text: "Data"),
          backgroundColor: AppColors.backColor,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        )
    );
  }
}
