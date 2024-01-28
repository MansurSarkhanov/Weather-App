import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/Provider/onboarding_provider.dart';

import '../../../Product/Constants/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final onboardingProviderWatch = context.watch<OnboardingProvider>();
    final onboardingProviderRead = context.read<OnboardingProvider>();

    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 82,
                width: 82,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade200,
                  color: AppColors.progresColor,
                  value: onboardingProviderWatch.value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                    onTap: () {
                      onboardingProviderRead.nextPage();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.backColor),
                      child: Icon(
                        onboardingProviderWatch.isLast ? Icons.check : Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    )),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.backColor,
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: onboardingProviderWatch.pageController,
          itemCount: onboardingProviderWatch.onboardingModel.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: AppColors.backColor,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(onboardingProviderWatch.onboardingModel[index].image)),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(MediaQuery.of(context).size.width * 0.48),
                        topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.48),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(60.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              onboardingProviderWatch.onboardingModel[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              onboardingProviderWatch.onboardingModel[index].subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
