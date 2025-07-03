import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/entity/refresh_event.dart';
import 'package:crimes/main.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/restart_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:url_launcher/url_launcher.dart';

final botToastBuilder = BotToastInit();

class MainApplication extends StatelessWidget {
  Future<void> _handleFcm() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      StringUtils.log('onMessage !!');
      if (Platform.isIOS) FlutterAppBadger.removeBadge();
      // if(!checkDuplicateMessage(message)){
      eventBus
          .fire(ReceivePushNotiEvent(message, AppConstant.pushState_onMessage));
      // }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      StringUtils.log('onMessageOpenedApp !!');
      if (Platform.isIOS) FlutterAppBadger.removeBadge();
      // if(!checkDuplicateMessage(message)) {
      eventBus.fire(ReceivePushNotiEvent(
          message, AppConstant.pushState_onMessageOpenedApp));
      // }
    });
  }

  String? initialLink;
  StreamSubscription? _sub;
  BuildContext? _context;

  Future<Null> initUniLinks() async {
    try {
      initialLink = await getInitialLink();
      StringUtils.log(initialLink.toString());
      _sub = linkStream.listen((String? initialLink) {
        StringUtils.log(initialLink.toString());
        if (Platform.isIOS) {
          closeWebView();
        }
        Uri uri = Uri.parse(initialLink.toString());
        String? state  = uri.queryParameters["state"];
        String? code  = uri.queryParameters["code"];
        String? authen  = uri.queryParameters["authen"];

        if (initialLink != null && state!=null && code!=null && authen==null) {
          KeyUtils.saveThaidResult("ok");
          eventBus.fire(OnThaiDEvent(code,state));
        } else if (initialLink != null && state!=null && code!=null && authen != null) {
          KeyUtils.saveThaidResult("ok");
          eventBus.fire(OnThaiDLK2Event(code,state,authen));
        } else if (initialLink == null) {
          KeyUtils.saveThaidResult("none");
        } else {
          KeyUtils.saveThaidResult("error");
        }

        //RestartWidget.restartApp(_context!);
      }, onError: (err) {
        StringUtils.log(err.toString());
      });
    } on PlatformException {
      StringUtils.log('platfrom exception unilink');
    }
  }

  // @override
  // void dispose(){
  //   _sub?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    //CALL THE FUNCTION
    _context = context;
    initUniLinks();
    _handleFcm();
    return ScreenUtilInit(
      designSize: Size(414, 736),
      builder: (context, child) => MaterialApp(
        title: 'CRIMES',
        navigatorKey: globalNavKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColor.primaryColor,
          //accentColor: AppColor.accentColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreenNavigator.widgetForRoute(Routes.splash),
        builder: (BuildContext context, Widget? child) {
          child = botToastBuilder(context, child);
          return child;
        },
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ],
      ),
    );
  }
}
