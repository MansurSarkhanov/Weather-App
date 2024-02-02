import 'package:flutter/material.dart';

enum IconPath { hum, sun, moon, sunrise, check }

extension IconPathExtension on IconPath {
  String toPath() {
    return "assets/Icons/ic_$name.png";
  }

  Widget toImage() {
    return Image.asset(
      toPath(),
      width: 20,
    );
  }
}
