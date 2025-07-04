import 'dart:convert';
import 'dart:typed_data';

import 'package:crimes/config/app_constant.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileUtils{
  static Future<String?> getImageProfileBase64() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final file = prefs.getString(AppConstant.kFileProfile) ?? '';
      return file;
    } on Exception catch (_) {
      return '';
    }
  }

  static Future<void> saveImageProfile(String? base64File) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(base64File!=null) {
        await prefs.setString(AppConstant.kFileProfile, base64File);
      }else{
        await prefs.remove(AppConstant.kFileProfile);
      }
    } on Exception catch (_) {
    }
  }

  static MemoryImage imageFromBase64String(String base64String) {
    //return Image.memory(base64Decode(base64String));
    return MemoryImage(dataFromBase64String(base64String));
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}