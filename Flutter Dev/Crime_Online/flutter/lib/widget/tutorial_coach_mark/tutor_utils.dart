import 'package:crimes/config/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorUtils{
  static Future<bool> getTutorHomeIsRead() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isRead = prefs.getBool(AppConstant.kIsReadTutorHome) ?? false;
      return isRead;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> saveTutorHomeIsRead(bool isRead) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return await prefs.setBool(AppConstant.kIsReadTutorHome, isRead);
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<bool> getTutorSPersonIsRead() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isRead = prefs.getBool(AppConstant.kIsReadTutorSearchPerson) ?? false;
      return isRead;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<void> saveTutorSPersonIsRead(bool isRead) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstant.kIsReadTutorSearchPerson, isRead);
    } on Exception catch (_) {
    }
  }

  static Future<void> clearAllRead() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstant.kIsReadTutorSearchPerson, false);
      await prefs.setBool(AppConstant.kIsReadTutorHome, false);
      print('clear all tutorial');
    } on Exception catch (_) {
    }
  }
}