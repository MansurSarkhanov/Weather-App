import 'package:flutter/material.dart';

enum ImagePath {
  cloud,
  sun,
  suncloud,
  rain,
  splash,
}

extension ImagePathExtension on ImagePath {
  String toPath() {
    return 'assets/Images/im_$name.png';
  }

  Widget toImage() {
    return Image.asset(toPath());
  }
}
