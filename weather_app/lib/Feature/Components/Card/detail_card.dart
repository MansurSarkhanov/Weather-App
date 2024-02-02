import 'package:flutter/material.dart';

import '../../../Core/Provider/home_provider.dart';
import '../../../Product/Constants/app_strings.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.homeProviderWatch,
  });

  final HomeProvider homeProviderWatch;
  Text _detailValueText(String text) => Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF2F313A), Color(0xFF232329)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    AppStrings.details,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Image.network(
                    'http:${homeProviderWatch.currentModel?.current?.condition?.icon}',
                    fit: BoxFit.fill,
                  )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Feels like',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            _detailValueText("${homeProviderWatch.currentModel?.current?.feelslikeC}°")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            _detailValueText("${homeProviderWatch.currentModel?.current?.humidity}%")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Visibility',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            _detailValueText("${homeProviderWatch.currentModel?.current?.visMi}mi")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'UV Index',
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            _detailValueText("${homeProviderWatch.currentModel?.current?.uv}")
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
