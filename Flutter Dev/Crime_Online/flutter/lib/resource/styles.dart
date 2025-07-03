import 'package:flutter/material.dart';
import 'package:crimes/resource/fonts.dart';

class FontSizes {

  static double scale = 1;

  static double get xxTitle => 32 * scale;

  static double get xTitle => 24 * scale;

  static double get title => 20 * scale;

  static double get xBody => 18 * scale;

  static double get body => 16 * scale;

  static double get small => 14 * scale;

  static double get xSmall => 12 * scale;

  static double get xxSmall => 10 * scale;

  static double get xxxSmall => 8 * scale;


}

class TextStyles {
  
  static TextStyle get _font => TextStyle(fontFamily: Fonts.fontSukhumvit, color: Colors.black);

  /// XXTitle

  static TextStyle get xxTitle => _font.copyWith(fontSize: FontSizes.xxTitle, fontWeight: FontWeight.w400);

  static TextStyle get xxTitleSemi => xxTitle.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get xxTitleBold => xxTitle.copyWith(fontWeight: FontWeight.w700);

  
  /// XTitle

  static TextStyle get xTitle => _font.copyWith(fontSize: FontSizes.xTitle, fontWeight: FontWeight.w400);

  static TextStyle get xTitleSemi => xTitle.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get xTitleBold => xTitle.copyWith(fontWeight: FontWeight.w700);

  /// Title

  static TextStyle get title => _font.copyWith(fontSize: FontSizes.title, fontWeight: FontWeight.w400);

  static TextStyle get titleSemi => title.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get titleBold => title.copyWith(fontWeight: FontWeight.w700);

  /// XBody

  static TextStyle get xBody => _font.copyWith(fontSize: FontSizes.xBody, fontWeight: FontWeight.w400);

  static TextStyle get xBodySemi => xBody.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get xBodyBold => xBody.copyWith(fontWeight: FontWeight.w700);
  

  /// Body

  static TextStyle get body => _font.copyWith(fontSize: FontSizes.body, fontWeight: FontWeight.w400);

  static TextStyle get bodySemi => body.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get bodyBold => body.copyWith(fontWeight: FontWeight.w700);


  /// Small

  static TextStyle get small => _font.copyWith(fontSize: FontSizes.small, fontWeight: FontWeight.w400);

  static TextStyle get smallSemi => small.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get smallBold => small.copyWith(fontWeight: FontWeight.w700);


  /// XSmall

  static TextStyle get xSmall => _font.copyWith(fontSize: FontSizes.xSmall, fontWeight: FontWeight.w400);

  static TextStyle get xSmallSemi => xSmall.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get xSmallBold => xSmall.copyWith(fontWeight: FontWeight.w700);


  /// XXSmall

  static TextStyle get xxSmall => _font.copyWith(fontSize: FontSizes.xxSmall, fontWeight: FontWeight.w400);

  static TextStyle get xxSmallSemi => xxSmall.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get xxSmallBold => xxSmall.copyWith(fontWeight: FontWeight.w700);

  /// XXXSmall

  static TextStyle get xxxSmall => _font.copyWith(fontSize: FontSizes.xxxSmall, fontWeight: FontWeight.w400);

  static TextStyle get xxxSmallSemi => xxxSmall.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get xxxSmallBold => xxxSmall.copyWith(fontWeight: FontWeight.w700);
}
