import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:weather_app/Core/Provider/home_provider.dart';
import 'package:weather_app/Feature/Components/custom_text.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2F313A),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Hi, Welcome",
                    size: 24,
                  ),
                  IconButton(
                      onPressed: () {
                        context.route.pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CustomText(
                        text: 'Location',
                        size: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "${context.watch<HomeProvider>().currentModel?.location?.country}",
                          ),
                          Text(
                            "${context.watch<HomeProvider>().currentModel?.current?.tempC?.toInt()}°, ${context.watch<HomeProvider>().currentModel?.current?.condition?.text}",
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade300),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CustomText(
                        text: 'Tools',
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomText(text: 'Notification'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomText(text: 'Settings'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CustomText(text: 'Rate this app'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Share.share(
                          'Hi, Today the weather is ${Provider.of<HomeProvider>(context, listen: false).currentModel?.current?.tempC}°/${Provider.of<HomeProvider>(context, listen: false).currentModel?.current?.tempF}F in ${Provider.of<HomeProvider>(context, listen: false).currentModel?.location?.name}',
                          subject: 'Weather App');
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.share,
                          size: 28,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomText(text: 'Share your weather'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
