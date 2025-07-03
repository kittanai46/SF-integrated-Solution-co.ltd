import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:flutter/material.dart';

BoxDecoration getBg() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColor.bg_top, AppColor.bg_bottom],
    ),
    image: DecorationImage(
      image: AssetImage(AppImage.bg),
      fit: BoxFit.cover,
    ),
  );
}

BoxDecoration getBgBiometric() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColor.bg_top, AppColor.bg_bottom],
    ),
    image: DecorationImage(
      image: AssetImage(AppImage.bg_biometrics),
      fit: BoxFit.cover,
    ),
  );
}