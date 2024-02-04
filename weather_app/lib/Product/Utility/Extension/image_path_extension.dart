import 'package:flutter/material.dart';

enum ImagePath {
  cloud,
  sun,
  suncloud,
  rain,
  splash,
  homesun, airquality, dropline, forecast

}

extension ImagePathExtension on ImagePath {
  String toPath() {
    return 'assets/Images/im_$name.png';
  }

  Widget toImage(double? width) {
    return Image.asset(
      toPath(),
      width: width,
    );
  }
}
