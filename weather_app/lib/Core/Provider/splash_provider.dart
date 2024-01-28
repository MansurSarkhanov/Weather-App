import 'package:flutter/material.dart';

class SplashProvider extends ChangeNotifier {
  bool isSplash = true;

  Future<void> checkSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    isSplash = false;
    notifyListeners();
  }
}
