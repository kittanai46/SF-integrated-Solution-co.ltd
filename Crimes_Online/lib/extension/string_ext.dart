
import 'package:flutter/material.dart';

extension CompareString on String {
  bool compareNoCaseWith(String str) => toLowerCase() == str.toLowerCase();
}

extension ColorParsing on String {
  // code format #RRGGBB
  Color hexStringToColor() => Color(int.parse(substring(1, 7), radix: 16) + 0xFF000000);
}
