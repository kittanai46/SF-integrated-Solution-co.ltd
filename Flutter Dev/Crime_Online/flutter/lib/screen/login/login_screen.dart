import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/service_api.dart';
import 'package:crimes/data/entity/refresh_event.dart';
import 'package:crimes/main.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/pre_scanqr/pre_scanqr_screen.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/login/login_screen_view_model.dart';
import 'package:crimes/screen/scanqr/scanqr_screen.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_button.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/restart_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginScreenViewModel _viewModel = LoginScreenViewModel();
  TextEditingController _tcUsername = TextEditingController();

  @override
  void initState() {
    if (AppConstant.isMockUser) {
      _viewModel.username = "TESTUSER";
      _tcUsername.text = "TESTUSER";
    }
    //_checkThaID();
    super.initState();
    _viewModel.getVersionInfo();
    _askAppTracking();

    eventBus.on<OnThaiDEvent>().listen((event) {
      if (!_isDispose) _handleOnThaiDEvent(event);
    });
  }

  bool _isDispose = false;
  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }

  Future<void> _askAppTracking() async {
    try {
      if (await AppTrackingTransparency.trackingAuthorizationStatus ==
          TrackingStatus.notDetermined) {
        await AppTrackingTransparency.requestTrackingAuthorization();

        // // Show a custom explainer dialog before the system dialog
        // if (await showCustomTrackingDialog(context)) {
        //   // Wait for dialog popping animation
        //   await Future.delayed(const Duration(milliseconds: 200));
        //   // Request system's tracking authorization dialog
        //   await AppTrackingTransparency.requestTrackingAuthorization();
        // }
      }
    } on PlatformException {
      // Unexpected exception was thrown
    }
  }

  Future<void> _login() async {
    StringUtils.log("_login");
    FocusScope.of(context).unfocus();
    String username = _tcUsername.text.trim();
    if (username == null || username.isEmpty) return;

    if (username == "CR0001") {
      await _mockKeys();
      ScreenNavigator.navigateReplaceTo(Routes.verifyPin,
          param: VerifyPinScreenParam(false));
    } else {
      await _viewModel.login(username);

      if (AppConstant.isMockUser) {
        if (_viewModel.status == ActionStatus.success) {
          ScreenNavigator.navigateReplaceTo(Routes.verifyPin,
              param: VerifyPinScreenParam(false));
        }
      } else {
        if (_viewModel.status == ActionStatus.success) {
          if (_viewModel.isRequestLogin) {
            ScreenNavigator.navigateReplaceTo(Routes.verifyPin,
                param: VerifyPinScreenParam(false));
          } else {
            // ScreenNavigator.navigateTo(Routes.preScanQR,
            //     param: PreScanQRScreenParam(_viewModel.username));
            _showUserNotFoundDialog();
          }
        } else if (_viewModel.status == ActionStatus.error) {
          _handleError();
        }
      }
    }
  }

  void _showUserNotFoundDialog() {
    showDialog(
      context: context,
      builder: (context) => Scaffold(
        backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
        body: Center(
          child: StatusPopup(
            title: AppMessage.error,
            description: "ไม่พบข้อมูลผู้ใช้งาน\nที่ลงทะเบียนกับอุปกรณ์นี้\nกรุณาลงทะเบียนใหม่ด้วย ThaID",
            buttonText: AppMessage.regisThaID,
            onPress: () {
              Navigator.of(context).pop(); // ปิด Dialog เมื่อกด "ตกลง"
              _generateThaIDState(); // ดำเนินการลงทะเบียนใหม่
            },

            // description: "ไม่พบข้อมูลผู้ใช้งาน\nที่ลงทะเบียนกับอุปกรณ์นี้\nกรุณากดปุ่ม 'ตกลง'\nเพื่อลงทะเบียนด้วย ThaID",
            // cancelText: AppMessage.cancel,
            // onCancel: () {
            //   Navigator.of(context).pop(); // ปิด Dialog เมื่อกด "ยกเลิก"
            // },
            // buttonText: AppMessage.ok,
            // onPress: () {
            //   Navigator.of(context).pop(); // ปิด Dialog เมื่อกด "ตกลง"
            //   _generateThaIDState(); // ดำเนินการลงทะเบียนใหม่
            // },

          ),
        ),
      ),
    );
  }

  Future<void> _mockKeys() async {
    StringUtils.log("===> START _mockKeys <===");
    String username = 'CR0001';
    String cookie =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJDUklNRVMiLCJTRVNTSU9OIjoiSzN4RmxCbGxUZzY2WjFhS3dJZEs4enJpbSIsImp0aSI6IkphSEpqSWwxZ1h0akFEWVdZRGo1RkdpWEUifQ.j9QsYGXYtvvCAtJWFMfhBBvA59HKYZv09QhemRA6fKG6DK4xThgiK7-J7c8hdoJtZM6YGPUFUfnYyPlDG1TnWg';
    String clientPublicKey = 'K8Z9B2FZMmEfZb2FaKcZGfJN6ayo6rhuoE7J8LCP6WU=';
    String clientSecretKey = 'Ejj1u2gJSdVHNXOad2v8KglwshU0HytBW5JUHcTZqtM=';
    String serverPublicKey = 'Smktw2kk90o70pvgiMV2b04Gy6c1VP45uf3tOBh/UQg=';
    String biometricsToken = AppConstant
        .tempBiometrics; //'_jKxRy180x7RGsQmtx4rgHZSvZW-DgGLMWDzIBn9cdw=';
    try {
      await FlutterSecureStorage()
          .write(key: AppConstant.kIsLogin, value: "true");
      await FlutterSecureStorage()
          .write(key: AppConstant.kUsername, value: username);
      await FlutterSecureStorage()
          .write(key: AppConstant.kCookie, value: cookie);
      await FlutterSecureStorage()
          .write(key: AppConstant.kClientPublicKey, value: clientPublicKey);
      await FlutterSecureStorage()
          .write(key: AppConstant.kClientSecretKey, value: clientSecretKey);
      await FlutterSecureStorage()
          .write(key: AppConstant.kServerPublicKey, value: serverPublicKey);
      await FlutterSecureStorage()
          .write(key: AppConstant.kBiometricToken, value: biometricsToken);
    } on Exception catch (_) {
      StringUtils.log("===> ERROR _mockKeys <===");
    }
    StringUtils.log("===> END _mockKeys <===");
  }

  Future<void> _getNearestPoliceStation() async {
    await _viewModel.getNearestPoliceStation();
    if (_viewModel.status == ActionStatus.success &&
        _viewModel.lastedLat != null &&
        _viewModel.lastedLon != null) {
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    showImg: true,
                    title: '${_viewModel.stationName}',
                    description:
                        'ที่อยู่: ${_viewModel.stationAddr}\n\nสถานีตำรวจใกล้ฉัน',
                    cancelText: AppMessage.cancel,
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: AppMessage.map,
                    onPress: () async {
                      Navigator.of(context).pop();
                      await MapLauncher.showMarker(
                        mapType:
                            Platform.isIOS ? MapType.apple : MapType.google,
                        coords: Coords(
                            _viewModel.lastedLat!, _viewModel.lastedLon!),
                        title: _viewModel.stationName ?? "",
                      );
                    }),
              )));
    } else if (_viewModel.status == ActionStatus.error) {
      _handleError();
    }
  }

  Future<void> _generateThaIDState() async {
    await _viewModel.generateThaIDState();
    if (_viewModel.status == ActionStatus.success) {
      KeyUtils.saveThaidState(_viewModel.thaidState!);
      _openExternalLink(
          //AppConstant.thaIDhost + "&state=" + _viewModel.thaidState!);
          _viewModel.thaidHost! + _viewModel.thaidState!);
    } else if (_viewModel.status == ActionStatus.error) {
      _handleError();
    }
  }

  Future<void> _handleOnThaiDEvent(OnThaiDEvent event) async {
    StringUtils.log("do _handleOnThaiDEvent");
    String state = event.state;
    String code = event.code;
    StringUtils.log("do _handleOnThaiDEvent code = "+code);
    StringUtils.log("do _handleOnThaiDEvent state = "+state);
    String sessionstate = await KeyUtils.getThaidState();
    StringUtils.log("do _handleOnThaiDEvent sessionstate = "+sessionstate);
    if(state == sessionstate ){
      StringUtils.log("do _handleOnThaiDEvent sessionstate = state");

    }else{
      StringUtils.log("do _handleOnThaiDEvent sessionstate is not match");
    }

    await _viewModel.regisThaiIDCrimesOnline(code,state);
    if (_viewModel.status == ActionStatus.success &&
        _viewModel.thaidStatus == "success") {
      StringUtils.log("Regis OK!!");
      //await KeyUtils.saveThaidResult("none");
      //ScreenNavigator.navigateReplaceTo(Routes.splash);
      ScreenNavigator.navigateReplaceRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_success,
          title: _viewModel.successMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    } else {
      StringUtils.log("Regis Failed!!");
      //await KeyUtils.saveThaidResult("none");
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor:
              Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    title: "ระบบแจ้งเตือน",
                    description: _viewModel.errorMessage,
                    buttonText: AppMessage.ok,
                    onPress: () {
                      ScreenNavigator.navigateReplaceTo(Routes.splash);
                    }),
              )));
    }
  }

  Future<void> _getResponsiblePoliceStation() async {
    await _viewModel.getResponsiblePoliceStation();
    if (_viewModel.status == ActionStatus.success &&
        _viewModel.lastedLat != null &&
        _viewModel.lastedLon != null) {
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    showImg: true,
                    title: '${_viewModel.stationName}',
                    description:
                        'ที่อยู่: ${_viewModel.stationAddr}\n\nสถานีตำรวจในพื้นที่ความรับผิดชอบ ณ ตำแหน่งปัจจุบันของฉัน',
                    cancelText: AppMessage.cancel,
                    onCancel: () {
                      Navigator.of(context).pop();
                    },
                    buttonText: AppMessage.map,
                    onPress: () async {
                      Navigator.of(context).pop();
                      await MapLauncher.showMarker(
                        mapType:
                            Platform.isIOS ? MapType.apple : MapType.google,
                        coords: Coords(
                            _viewModel.lastedLat!, _viewModel.lastedLon!),
                        title: _viewModel.stationName ?? "",
                      );
                    }),
              )));
    } else if (_viewModel.status == ActionStatus.error) {
      _handleError();
    }
  }

  Future<void> _checkPermissionLocation() async {
    PermissionStatus locationStatus = await Permission.location.status;
    StringUtils.log(
        '_checkPermissionLocation - locationStatus: ${locationStatus}');

    List<Permission> _permissions = [];
    if (!locationStatus.isGranted) {
      _permissions.add(Permission.location);
    }

    if (_permissions.length > 0) {
      if (locationStatus.isPermanentlyDenied) {
        _askOpenSettingLocation(false);
      } else {
        _requestPermissionLocation(locationStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
        _getNearestPoliceStation();
      } else {
        _askOpenSettingLocation(true);
      }
    }
  }

  Future<void> _checkPermissionLocationResponsible() async {
    PermissionStatus locationStatus = await Permission.location.status;
    StringUtils.log(
        '_checkPermissionLocation - locationStatus: ${locationStatus}');

    List<Permission> _permissions = [];
    if (!locationStatus.isGranted) {
      _permissions.add(Permission.location);
    }

    if (_permissions.length > 0) {
      if (locationStatus.isPermanentlyDenied) {
        _askOpenSettingLocation(false);
      } else {
        _requestPermissionLocation(locationStatus, _permissions);
      }
    } else if (_permissions.length == 0) {
      if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
        _getResponsiblePoliceStation();
      } else {
        _askOpenSettingLocation(true);
      }
    }
  }

  Future<void> _requestPermissionLocation(
      PermissionStatus locationStatus, List<Permission> _permissions) async {
    Map<Permission, PermissionStatus> statuses = await _permissions.request();
    if (!locationStatus.isGranted) {
      locationStatus = statuses[Permission.location] as PermissionStatus;
    }
    StringUtils.log(
        '_requestPermissionLocation - locationStatus: ${locationStatus}');

    if (locationStatus.isPermanentlyDenied) {
      _askOpenSettingLocation(false);
    } else {
      await _checkPermissionLocation();
    }
  }

  void _askOpenSettingLocation(bool isLocationSetting) {
    showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: AppMessage.askPermissionLocation,
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    if (isLocationSetting) {
                      // Geolocator.openLocationSettings();
                      AppSettings.openAppSettings(type: AppSettingsType.location);
                    } else {
                      openAppSettings();
                    }
                  }),
            )));
  }

  // Future<void> _openThaiD() async {
  //   serviceapi.
  //   if (await canLaunch(extURL)) {
  //     await launch(extURL);
  //   }
  // }

  Future<void> _openExternalLink(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _checkThaID() async {
    String thaidresult = await KeyUtils.getThaidResult();
    StringUtils.log("thaidresult: ===> ${thaidresult}");
    if (thaidresult == "ok") {
      StringUtils.log("Open From ThaiD");
      //await _viewModel.getThaiIDScope();
      //if(_viewModel.status == ActionStatus.success && _viewModel.thaidStatus=="success") {
      // await _viewModel.regisThaiIDCrimesOnline("","");
      // if (_viewModel.status == ActionStatus.success &&
      //     _viewModel.thaidStatus == "success") {
      //   StringUtils.log("Regis OK!!");
      //   await KeyUtils.saveThaidResult("none");
      //   ScreenNavigator.navigateReplaceTo(Routes.splash);
      // } else {
      //   StringUtils.log("Regis Failed!!");
      //   await KeyUtils.saveThaidResult("none");
      //   showDialog(
      //       context: context,
      //       builder: (context) => Scaffold(
      //           backgroundColor:
      //               Colors.black.withAlpha(AppConstant.alphaDialog),
      //           body: Center(
      //             child: StatusPopup(
      //                 title: "ระบบแจ้งเตือน",
      //                 description: _viewModel.thaidMessage,
      //                 buttonText: AppMessage.ok,
      //                 onPress: () {
      //                   ScreenNavigator.navigateReplaceTo(Routes.splash);
      //                 }),
      //           )));
      // }

    } else {
      StringUtils.log("ThaiD Not Found!!");
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    String randomString =
        String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
    StringUtils.log("generateRandomString ==>" + randomString);
    return randomString;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
          key: _scaffoldKey,
          body: Observer(
              builder: (_) => StatusAwareContainer(
                    _viewModel.status,
                    showError: _viewModel.showError,
                    idle: _buildLayout(),
                    error: Stack(children: [
                      _buildError(),
                    ]),
                    onRetry: () => {},
                  ))));

  Widget _buildLayout() => Container(
        decoration: getBg(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [_buildScrollContent()],
        ),
      );

  Widget _buildScrollContent() => Expanded(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(30.w, 108.h, 30.w, 32.h),
                child: Image.asset(
                  AppImage.logo_splash,
                  fit: BoxFit.contain,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ยืนยันตัวตนเพื่อเข้าใช้งาน CRIMES Online',
                  textAlign: TextAlign.center,
                  style: TextStyles.small
                      .copyWith(color: AppColor.blue_text_light),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Theme(
                data:
                    Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: TextField(
                  maxLines: 1,
                  controller: _tcUsername,
                  textInputAction: TextInputAction.next,
                  style: TextStyles.body.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                    labelText: 'Username',
                    labelStyle: TextStyles.body.copyWith(
                      color: AppColor.grey_hint,
                    ),
                  ),
                  onChanged: (value) {
                    _viewModel.username = value;
                  },
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              PrimaryCustomButton(
                //"ถัดไป",
                "เข้าสู่ระบบ",
                isEnabled: _viewModel.isEnableButton,
                onPressed: () => _login(),
              ),
              SizedBox(
                height: 5.h,
              ),

              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),

                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset(AppImage.ic_info, fit: BoxFit.contain, width: 20.w,height: 20.h ,color: AppColor.blue_text_light),
                        //SizedBox(width: 2),
                        Text(
                          "---------------------------- OR ----------------------------",
                          style: TextStyles.xxSmall
                              .copyWith(color: AppColor.blue_text_light),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              PrimaryCustomButton(
                "ลงทะเบียนด้วย ThaID",
                onPressed: () =>
                    _generateThaIDState(), //_openExternalLink(AppConstant.thaIDhost+"&state="+generateRandomString(8)),
              ),
              SizedBox(
                height: 15.h,
              ),

              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: _checkPermissionLocation,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.ic_map_nearest,
                            fit: BoxFit.contain, width: 24.w, height: 24.h),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "ค้นหาสถานีตำรวจใกล้ฉัน",
                          style: TextStyles.xxSmall
                              .copyWith(color: AppColor.blue_text_light),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: _checkPermissionLocationResponsible,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppImage.ic_map_responsible,
                            fit: BoxFit.contain, width: 24.w, height: 24.h),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "ค้นหาสถานีตำรวจในพื้นที่ความรับผิดชอบ ณ ตำแหน่งปัจจุบันของฉัน",
                          style: TextStyles.xxSmall
                              .copyWith(color: AppColor.blue_text_light),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 15.h,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    _openExternalLink(
                        "https://www.crimespolice.com/portal/crimes-online-support/");
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.asset(AppImage.ic_info, fit: BoxFit.contain, width: 20.w,height: 20.h ,color: AppColor.blue_text_light),
                        //SizedBox(width: 2),
                        Text(
                          "App's support",
                          style: TextStyles.xxSmall
                              .copyWith(color: AppColor.blue_text_light),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // GestureDetector(
              //     onTap: (){
              //       _openExternalLink("https://www.crimespolice.com/portal/crimes-online-support/")
              //     },
              //   child: Container(
              //     padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
              //     child: Text("App's support",
              //       style: TextStyles.xxSmall.copyWith(color: AppColor.blue_text_light),
              //     ),
              //   ),
              // ),
              GestureDetector(
                //onTap: _checkPermissionLocation,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
                  child: Text(
                    "CRIMES Online ver. " +
                        _viewModel.version +
                        "(" +
                        _viewModel.buildnumber +
                        ")",
                    style: TextStyles.xxSmall
                        .copyWith(color: AppColor.blue_text_light),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ));

  Widget _buildError() => Container(
        color: Colors.black.withAlpha(AppConstant.alphaDialog),
        child: Center(
          child: StatusPopup(
            title: _viewModel.errorTitle,
            description: _viewModel.errorMessage,
            buttonText: AppMessage.ok,
            onPress: () => _viewModel.resetStatus(),
          ),
        ),
      );

  void _handleError() {
    // if(_viewModel.openLogin){
    //   ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       image: AppImage.ic_status_pending,
    //       title: AppMessage.titleChangePhone,
    //       message: AppMessage.messageChangePhone,
    //       confirmButtonText: AppMessage.ok,
    //       onConfirm: () => ScreenNavigator.navigateReplaceTo(Routes.login),
    //     ),
    //     fullscreenDialog: true,
    //   ));
    // }else
    if (_viewModel.openWaitSMS) {
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitSMS,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    } else if (_viewModel.openWaitAdmin) {
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitAdmin,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    } else if (_viewModel.openRegisterPin) {
      ScreenNavigator.replaceEntireStackTo(Routes.createPin,
          param: CreatePinScreenParam(false));
    } else if (_viewModel.openRegisterBiometrics) {
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    } else if (_viewModel.openVerifyPin) {
      showDialog(
          context: context,
          builder: (context) => Scaffold(
              backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
              body: Center(
                child: StatusPopup(
                    title: AppMessage.error,
                    description: _viewModel.errorMessage,
                    buttonText: AppMessage.ok,
                    onPress: () {
                      Navigator.of(context).pop();
                      ScreenNavigator.navigateReplaceTo(Routes.verifyPin,
                          param: VerifyPinScreenParam(false));
                    }),
              )));
    }
  }

  Future<bool> _onBack() async {
    bool goBack = false;
    await showDialog(
        context: context,
        builder: (context) => Scaffold(
            backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
            body: Center(
              child: StatusPopup(
                  title: AppMessage.titleExitApp,
                  cancelText: AppMessage.cancel,
                  onCancel: () {
                    Navigator.of(context).pop();
                    goBack = false;
                  },
                  buttonText: AppMessage.ok,
                  onPress: () {
                    Navigator.of(context).pop();
                    goBack = true;
                  }),
            )));
    if (goBack) await closeApp();
    return goBack;
  }
}
