import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart';
import 'package:crimes/extension/string_ext.dart';

extension ImageExt on Image {
  static bool isSvgFile(String filePath) {
    final String ext = extension(filePath);
    return ext.compareNoCaseWith('.svg');
  }

  static Widget buildImage(String imagePath, {
    Color? color,
    double opacity = 1.0,
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
  }) { 
    final bool isIconSvg = isSvgFile(imagePath);
    return isIconSvg ? SvgPicture.asset(
      imagePath,
      color: color?.withOpacity(opacity),
      fit: fit,
      width: width,
      height: height,
    ) : Image.asset(
      imagePath,
      color: color?.withOpacity(opacity),
      fit: fit,
      width: width,
      height: height,
    );
  }
}
