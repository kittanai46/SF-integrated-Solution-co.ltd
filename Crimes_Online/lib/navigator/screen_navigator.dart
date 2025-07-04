import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/favorite/criteria/favorite_criteria_screen.dart';
import 'package:crimes/screen/favorite/db/favorite_db_screen.dart';
import 'package:crimes/screen/favorite/list/favorite_list_screen.dart';
import 'package:crimes/screen/favorite/title/favorite_title_screen.dart';
import 'package:crimes/screen/login/login_screen.dart';
import 'package:crimes/screen/main/main_screen.dart';
import 'package:crimes/screen/notification/detail/notification_detail_screen.dart';
import 'package:crimes/screen/notification/list/notification_list_screen.dart';
import 'package:crimes/screen/permission/permission_screen.dart';
import 'package:crimes/screen/pre_scanqr/pre_scanqr_screen.dart';
import 'package:crimes/screen/register_biometrics/register_biometrics_screen.dart';
import 'package:crimes/screen/scanqr/scanqr_screen.dart';
import 'package:crimes/screen/scanqr/scanqr_login_screen.dart';
import 'package:crimes/screen/search/criteria/search_criteria_screen.dart';
import 'package:crimes/screen/search/db/search_db_screen.dart';
import 'package:crimes/screen/search/detail/search_detail_screen.dart';
import 'package:crimes/screen/search/pdf/search_pdf_screen.dart';
import 'package:crimes/screen/search/result/search_result_screen.dart';
import 'package:crimes/screen/search/scanner/camera_page.dart';
import 'package:crimes/screen/splash/splash_screen.dart';
import 'package:crimes/screen/term/term_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/screen/verify_pin_passcode/verify_pin_passcode_screen.dart';
import 'package:flutter/material.dart';
import 'package:crimes/navigator/navigation_parameter.dart';
import 'package:crimes/navigator/routes.dart';

final GlobalKey<NavigatorState> globalNavKey = GlobalKey();

// TODO(dew): no static
class ScreenNavigator {
  static Future<dynamic> navigateTo(String route, {NavigationParameter? param, bool animation = true}) async{
    await Future.delayed(Duration(milliseconds: 100));
    final destination = widgetForRoute(route, param: param);
    if(animation)
      return globalNavKey.currentState!.push(MaterialPageRoute(builder: (context) => destination));
    else
      return globalNavKey.currentState!.push(PageRouteBuilder(pageBuilder: (context, animation1, animation2) => destination, transitionDuration: Duration(seconds: 0)));
  }

  static Future<dynamic> navigateRoute(MaterialPageRoute<dynamic> route) async{
    await Future.delayed(Duration(milliseconds: 100));
    return globalNavKey.currentState!.push(route);
  }

  static Future<dynamic> navigateReplaceTo(String route, {NavigationParameter? param, bool animation = true}) async{
    await Future.delayed(Duration(milliseconds: 100));
    final destination = widgetForRoute(route, param: param);
    if(animation)
      return globalNavKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context) => destination));
    else
      return globalNavKey.currentState!.pushReplacement(PageRouteBuilder(pageBuilder: (context, animation1, animation2) => destination, transitionDuration: Duration(seconds: 0)));
  }

  static Future<dynamic> navigateReplaceRoute(MaterialPageRoute<dynamic> route) async{
    return globalNavKey.currentState!.pushReplacement(route);
  }

  static void pop([dynamic? result]) => globalNavKey.currentState!.pop(result);

  static void replaceEntireStackTo(String route, {NavigationParameter? param}) {
    final destination = widgetForRoute(route, param: param);
    final newRoute = MaterialPageRoute(builder: (context) => destination);
    bool clearAllPreviousRoutesPredicate(_) => false;
    globalNavKey.currentState!.pushAndRemoveUntil(newRoute, clearAllPreviousRoutesPredicate);
  }

  static void replaceEntireStackRoute(MaterialPageRoute route) {
    bool clearAllPreviousRoutesPredicate(_) => false;
    globalNavKey.currentState!.pushAndRemoveUntil(route, clearAllPreviousRoutesPredicate);
  }

  static Widget widgetForRoute(String route, {dynamic? param}) {
    // Please keep this list sorted alphabetically.
    switch (route) {
      case Routes.splash:
        return SplashScreen();
      case Routes.verifyPin:
        return VerifyPinScreen(param);

      case Routes.verifyPinPasscode:
        return VerifyPinPasscodeScreen(param);

      case Routes.login:
        return LoginScreen();
      case Routes.preScanQR:
        return PreScanQRScreen(param);
      case Routes.scanQR:
        return ScanQRScreen(param);
      // case Routes.fillOTP:
      //   return FillOtpScreen();
      case Routes.createPin:
        return CreatePinScreen(param);
      case Routes.registerBiometrics:
        return RegisterBiometricsScreen();
      case Routes.term:
        return TermScreen(param);

      case Routes.main:
        return MainScreen(param);

      case Routes.searchCriteria:
        return SearchCriteriaScreen(param);
      case Routes.searchDB:
        return SearchDBScreen(param);
      case Routes.searchResult:
        return SearchResultScreen(param);
      case Routes.searchDetail:
        return SearchDetailScreen(param);
      case Routes.searchPdf:
        return SearchPdfScreen(param);

      case Routes.notificationList:
        return NotificationListScreen(param);
      case Routes.notificationDetail:
        return NotificationDetailScreen(param);

      case Routes.favoriteCriteria:
        return FavoriteCriteriaScreen(param);
      case Routes.favoriteDB:
        return FavoriteDBScreen(param);
      case Routes.favoriteTitle:
        return FavoriteTitleScreen(param);
      case Routes.favoriteList:
        return FavoriteListScreen(param);

      case Routes.permission:
        return PermissionScreen(param);
      case Routes.camera:
        return CameraPage(param);
      case Routes.scanQRLogin:
        return ScanQRLoginScreen(param);


      default:
        throw Exception('Unknown Route $route');
    }
  }
}
