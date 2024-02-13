import 'package:flutter/material.dart';

enum IconPath { hum, sun, moon, sunrise, check, drop }

extension IconPathExtension on IconPath {
  String toPath() {
    return "assets/Icons/ic_$name.png";
  }

  Widget toImage([double? width]) {
    return Image.asset(
      toPath(),
      width: width ?? 20,
    );
  }
}
