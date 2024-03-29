import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Core/Provider/onboarding_provider.dart';
import 'package:weather_app/Core/Provider/splash_provider.dart';
import 'package:weather_app/Feature/Presentation/Screens/splash_page.dart';

mixin SplashMixin on State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashProvider>().checkSplash();
    context.read<OnboardingProvider>().readCheckPage();


  }
}
