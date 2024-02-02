import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:weather_app/Core/Models/onboarding_model.dart';
import 'package:weather_app/Core/Service/Local/shared_service.dart';

import '../../Feature/Presentation/Screens/home_page.dart';
import '../DI/injection.dart';

class OnboardingProvider extends ChangeNotifier {
  final _sharedPrefs = getIt.get<SharedPrefsService>();
  final PageController pageController = PageController();

  int currentIndex = 0;
  double value = 0.25;
  bool isLast = false;
  bool isSave = false;

  void nextPage(BuildContext context) {
    currentIndex++;
    value = value + 0.25;
    pageController.animateToPage(currentIndex, duration: const Duration(seconds: 1), curve: Curves.decelerate);
    if (currentIndex == onboardingModel.length - 1) {
      isLast = true;
    }
    if (currentIndex == onboardingModel.length) {
      saveOnboarding();
      context.route.navigateToPage(const HomePage());
    }
    notifyListeners();
  }

  void saveOnboarding() {
    isSave = true;
    if (isSave) {
      _sharedPrefs.setBool('finish', isSave);
    }
  }

  Future<void> readCheckPage() async {
    isSave = await _sharedPrefs.getBool('finish');
    notifyListeners();
    print(isSave);
  }
}
