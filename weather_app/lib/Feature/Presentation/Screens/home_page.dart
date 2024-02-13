import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Feature/Components/Tabs/forecast_tab.dart';
import 'package:weather_app/Product/Constants/app_colors.dart';

import '../../../Product/Constants/app_strings.dart';
import '../../Components/Tabs/preciption_tab.dart';
import '../../Components/Tabs/today_tab.dart';
import '../../Components/custom_text.dart';
import '../../Components/sidebar.dart';

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
      drawer: const SideBar(),
        backgroundColor: AppColors.backColor,
        appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
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
        
          title: homeProviderWatch.isLoading
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : CustomText(
                  text:
                      '${homeProviderWatch.currentModel?.location?.name}, ${homeProviderWatch.currentModel?.location?.country}'),
          backgroundColor: AppColors.backColor,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            TodayTab(homeProviderWatch: homeProviderWatch),

ForecastTab(homeProviderWatch: homeProviderWatch),
          PreciptionTab(homeProviderWatch: homeProviderWatch),
            Container(),
          ],
      ),
    );
  }
}
