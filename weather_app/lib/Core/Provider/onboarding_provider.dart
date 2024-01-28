import 'package:flutter/material.dart';
import 'package:weather_app/Core/Models/onboarding_model.dart';
import 'package:weather_app/Product/Constants/app_strings.dart';
import 'package:weather_app/Product/Utility/Extension/image_path_extension.dart';

class OnboardingProvider extends ChangeNotifier {
  List<OnboardingModel> onboardingModel = [
    OnboardingModel(
        image: ImagePath.cloud.toPath(), title: AppStrings.onboardingTitle1, subtitle: AppStrings.onboardingSubTitle1),
    OnboardingModel(
        image: ImagePath.sun.toPath(), title: AppStrings.onboardingTitle2, subtitle: AppStrings.onboardingSubTitle2),
    OnboardingModel(
        image: ImagePath.rain.toPath(), title: AppStrings.onboardingTitle3, subtitle: AppStrings.onboardingSubTitle3),
    OnboardingModel(
        image: ImagePath.suncloud.toPath(),
        title: AppStrings.onboardingTitle3,
        subtitle: AppStrings.onboardingSubTitle3)
  ];
  int currentIndex = 0;
  double value = 0.25;
  bool isLast = false;
  final PageController pageController = PageController();
  void nextPage() {
    currentIndex++;
    value = value + 0.25;
    print(currentIndex);
    pageController.animateToPage(currentIndex, duration: const Duration(seconds: 1), curve: Curves.decelerate);
    if (currentIndex == onboardingModel.length - 1) {
      isLast = true;
    }
    notifyListeners();
  }
}
