import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:camera/camera.dart';
import 'package:crimes/app.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/restart_widget.dart';
import 'package:crimes/widget/tutorial_coach_mark/tutor_utils.dart';
import 'package:event_bus/event_bus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:minimize_app/minimize_app.dart';
import 'package:sodium_libs/sodium_libs.dart';

List<CameraDescription> cameras = [];
EventBus eventBus = EventBus();

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');

  // if(flutterLocalNotificationsPlugin==null){
  //   await _initLocalNotification();
  // }
  //
  // RemoteNotification? notification = message.notification;
  // AndroidNotification? android = message.notification?.android;
  // if (notification != null && android != null) {
  //   flutterLocalNotificationsPlugin!.show(
  //       notification.hashCode,
  //       notification.title,
  //       notification.body,
  //       NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           channel!.id,
  //           channel!.name,
  //           channel!.description,
  //           icon: 'ic_notification',
  //         ),
  //       ));
  // }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin
? flutterLocalNotificationsPlugin;

late Sodium sodium;
Future<void> initApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _lockScreenPortraitOrientation();

  await Firebase.initializeApp();
  sodium = await SodiumInit.init();

  if(Platform.isIOS){
    await FirebaseMessaging.instance.requestPermission(
        criticalAlert: true,
        provisional: false,
        sound: true,
        badge: true,
        alert: true);

    FlutterAppBadger.removeBadge();
  }

  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await LineSDK.instance.setup(AppConstant.lineChannelId);

  await _initLocalNotification();

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance
      .setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  try {
    // await FlutterDownloader.initialize(
    //     debug: true // optional: set false to disable printing logs to console
    // );
    cameras = await availableCameras();

  } on CameraException catch (e) {
    // StringUtils.log(e.description);
  }
}

Future<void> _initLocalNotification() async{
  channel = const AndroidNotificationChannel(
    '1001', // id
    'CRIMES', // title
    //'', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin!
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel!);
}

Future<void> _lockScreenPortraitOrientation() =>
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


Future<void> main() async {
  if(Foundation.kReleaseMode || Foundation.kProfileMode){
    AppConstant.isDebug = false;
  } else {
    AppConstant.isDebug = true;
  }

  await initApplication();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(RestartWidget(
    child: MainApplication(),
  ));
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        final isValidHost = [AppConstant.host].contains(host);
        return isValidHost;
      });
  }
}

Future<void> closeApp() async {
  if(Platform.isIOS){
    // MinimizeApp.minimizeApp();
    await Future.delayed(Duration(seconds: 1));
    exit(0);
  }else{
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', true);
  }
}

List<RemoteMessage> oldMessages = [];
bool checkDuplicateMessage(RemoteMessage newMessage){
  String newId = newMessage.data['id'];

  bool found = false;
  for(int i=0; i<oldMessages.length; i++){
    final oldMessage = oldMessages[i];
    String oldId = oldMessage.data['id'];

    if(newId == oldId){
      found = true;
      break;
    }
  }
  if(!found){
    oldMessages.add(newMessage);
  }
  return found;
}