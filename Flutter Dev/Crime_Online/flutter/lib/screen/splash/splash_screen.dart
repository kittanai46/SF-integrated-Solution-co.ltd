import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crimes/config/app_constant.dart';
import 'package:crimes/main.dart';
import 'package:crimes/navigator/routes.dart';
import 'package:crimes/navigator/screen_navigator.dart';
import 'package:crimes/resource/app_color.dart';
import 'package:crimes/resource/app_image.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/resource/styles.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/status/status_screen.dart';
import 'package:crimes/screen/create_pin/create_pin_screen.dart';
import 'package:crimes/screen/splash/splash_screen_view_model.dart';
import 'package:crimes/screen/verify_pin/verify_pin_screen.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:crimes/widget/custom_decoration.dart';
import 'package:crimes/widget/restart_widget.dart';
import 'package:crimes/widget/status_aware_container.dart';
import 'package:crimes/widget/status_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:store_redirect/store_redirect.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  SplashScreenViewModel _viewModel = SplashScreenViewModel();
  @override
  void initState(){
    //_checkThaID();
    _checkInternet();
    super.initState();
    _viewModel.getVersionInfo();

  }

  Future<void> _checkThaID() async {
    String thaidresult = await KeyUtils.getThaidResult();
    StringUtils.log("thaidresult: ===> ${thaidresult}");
    if(thaidresult=="ok") {
      StringUtils.log("Open From ThaiD");
      await _viewModel.getThaiIDScope();
      if(_viewModel.status == ActionStatus.success && _viewModel.thaidStatus=="success") {

      }else{
        StringUtils.log("get Scope Failed!!");
        await KeyUtils.saveThaidResult("none");
        showDialog(
            context: context,
            builder: (context) => Scaffold(
                backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
                body: Center(
                  child: StatusPopup(
                      title: "ระบบแจ้งเตือน",
                      description: _viewModel.thaidMessage,
                      buttonText: AppMessage.ok,
                      onPress: () {
                        ScreenNavigator.navigateReplaceTo(Routes.splash);
                      }
                  ),
                )
            )
        );
      }
    }else{
      StringUtils.log("ThaiD Not Found!!");
    }
  }


  Future<void> _checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // var hasConnection = await DataConnectionChecker().hasConnection;
    StringUtils.log('connectivityResult: ${connectivityResult}');
    // StringUtils.log('hasConnection: ${hasConnection}');
    if (connectivityResult != ConnectivityResult.none /*&& hasConnection*/) {
      _checkVersion();
    } else {
      showDialog(
          context: context,
          builder: (context) =>
              Scaffold(
                  backgroundColor: Colors.black.withAlpha(
                      AppConstant.alphaDialog),
                  body: Center(
                    child: StatusPopup(
                        title: AppMessage.titleNoInternet,
                        buttonText: AppMessage.ok,
                        onPress: () async {
                          Navigator.of(context).pop();

                          //Delay 3 seconds then retry check
                          await Future.delayed(Duration(seconds: 3));
                          _checkInternet();
                        }
                    ),
                  )
              )
      );
    }
  }

  Future<void> _checkVersion() async {
    // String imei = await ImeiPlugin.getImei();
    // StringUtils.log('imei: ${imei}');
    // List<String> multiImei = await ImeiPlugin.getImeiMulti(); //for double-triple SIM phones
    // for(int i=0; i<multiImei.length; i++) {
    //   StringUtils.log('multiImei[${i}]: ${multiImei[i]}');
    // }
    // String uuid = await ImeiPlugin.getId();
    // StringUtils.log('uuid: ${uuid}');

    await _viewModel.checkVersion();
    if(_viewModel.status == ActionStatus.success) {
      StringUtils.log("_viewModel.resultCheckVersion ${_viewModel.resultCheckVersion}");
      if(_viewModel.resultCheckVersion == "latest_updated"){
        StringUtils.log("latest_updated");
        _next();
      }else if(_viewModel.resultCheckVersion == "have_update"){
        showDialog(
            context: context,
            builder: (context) => Scaffold(
                backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
                body: Center(
                  child: StatusPopup(
                      title: "ระบบแจ้งเตือน",
                      description: _viewModel.messageCheckVersion,
                      cancelText: AppMessage.cancel,
                      onCancel: () {
                        Navigator.of(context).pop();
                        _next();
                      },
                      buttonText: AppMessage.ok,
                      onPress: () {
                        Navigator.of(context).pop();
                        _openStore();
                      }
                  ),
                )
            )
        );
      }else if(_viewModel.resultCheckVersion == "force_update"){
        showDialog(
            context: context,
            builder: (context) => Scaffold(
                backgroundColor: Colors.black.withAlpha(AppConstant.alphaDialog),
                body: Center(
                  child: StatusPopup(
                      title: "ระบบแจ้งเตือน",
                      description: _viewModel.messageCheckVersion,
                      buttonText: AppMessage.ok,
                      onPress: () {
                        Navigator.of(context).pop();
                        _openStore();
                      }
                  ),
                )
            )
        );
      }else if(_viewModel.resultCheckVersion == "new_version") {
        AppConstant.isMockUser = true;
        ScreenNavigator.navigateReplaceTo(Routes.login);
      }
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
  }


  Future<void> _checkPermission() async {
    PermissionStatus _cameraStatus = await Permission.camera.status;
    PermissionStatus _photosStatus = await Permission.photos.status;
    PermissionStatus _storageStatus = await Permission.storage.status;
    PermissionStatus _locationStatus = await Permission.location.status;
    PermissionStatus _microphoneStatus = await Permission.microphone.status;

    List<Permission> _permissions = [];
    if(!_cameraStatus.isGranted){
      _permissions.add(Permission.camera);
    }
    if(!_photosStatus.isGranted){
      _permissions.add(Permission.photos);
    }
    if(!_storageStatus.isGranted){
      _permissions.add(Permission.storage);
    }
    if(!_locationStatus.isGranted){
      _permissions.add(Permission.location);
    }
    if(!_microphoneStatus.isGranted){
      _permissions.add(Permission.microphone);
    }

    if(_permissions.length > 0){
      await _permissions.request();
      await _checkPermission();
    }else{
      _next();
    }
  }

  Future<void> _next() async{
    await KeyUtils.checkFirstTimeInstalled();
    _checkKeys();
  }

  Future<void> _openStore() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      await StoreRedirect.redirect(androidAppId: packageInfo.packageName, iOSAppId: _viewModel.appStoreIdCheckVersion);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _checkKeys() async {
    StringUtils.log("===> START _checkKeys <===");

    bool isUsernameAndKeysAvailable = await KeyUtils.isUsernameAndKeysAvailable();
    if(!isUsernameAndKeysAvailable) {
      StringUtils.log("Error Keys Notfound");
      _clearKeysAndLogin();
      return;
    }

    await _viewModel.checkAuthenticate();

    if(_viewModel.status == ActionStatus.success) {

      final isLogin = await KeyUtils.isLogin();
      if(isLogin){
        ScreenNavigator.navigateReplaceTo(Routes.verifyPin, param: VerifyPinScreenParam(false));
      }else{
        ScreenNavigator.navigateReplaceTo(Routes.login);
      }
    }else if(_viewModel.status == ActionStatus.error){
      _handleError();
    }
  }

  Future<void> _clearKeysAndLogin() async {
    //TODO: Alert user and Clear keys then redirect to Login
    await KeyUtils.clearAll();
    await Future.delayed(Duration(seconds: 1));
    ScreenNavigator.navigateReplaceTo(Routes.login);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: _scaffoldKey,
      body: Observer(
          builder: (_) => StatusAwareContainer(
            _viewModel.status,
            showError: _viewModel.showError,
            idle: _buildLayout(),
            loading: Container(),
            error: Stack(children: [
              _buildError(),
            ]),
            onRetry: () => {},
          )));

  Widget _buildLayout() => Container(
    decoration: getBg(),
    child: Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w),
              child: Image.asset(AppImage.logo_splash, fit: BoxFit.contain,),
            ),
          ),
        ),
        Text(
          'ศูนย์เทคโนโลยีสารสนเทศกลาง',
          textAlign: TextAlign.center,
          style: TextStyles.body.copyWith(color: AppColor.blue_text_medium),
        ),
        SizedBox(height: 8.h,),
        Text(
          'สำนักงานเทคโนโลยีสารสนเทศและการสื่อสาร สำนักงานตำรวจแห่งชาติ',
          textAlign: TextAlign.center,
          style: TextStyles.xSmall.copyWith(color: AppColor.blue_text_medium),
        ),
        Text(
          'Track Step: '+_viewModel.track,
          textAlign: TextAlign.center,
          style: TextStyles.xxSmall.copyWith(color: AppColor.blue_text_medium),
        ),
        SizedBox(height: 32.h,),
        Container(
            padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 0),
            child: new SizedBox(
              height: 16,
              child: new FittedBox(
                child: new Text("CRIMES Online ver. "+_viewModel.version+"("+_viewModel.buildnumber+")",
                  style: TextStyles.xxSmall.copyWith(color: AppColor.blue_text_light),
                ),
              ),
            )
        ),
        SizedBox(height: 15.h),
      ],
    ),
    
    
  );

  Widget _buildError() => StatusPopup(
    title: _viewModel.errorTitle != null ? _viewModel.errorTitle : '',
    description: _viewModel.errorMessage != null ? _viewModel.errorMessage : '',
    buttonText: AppMessage.ok,
    onPress: () => closeApp(),
  );

  void _handleError(){

    if(_viewModel.openLogin){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleChangePhone,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
          onConfirm: () => ScreenNavigator.navigateReplaceTo(Routes.login),
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitSMS){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitSMS,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openWaitAdmin){
      ScreenNavigator.replaceEntireStackRoute(MaterialPageRoute(
        builder: (context) => StatusScreen(
          image: AppImage.ic_status_pending,
          title: AppMessage.titleWaitAdmin,
          message: _viewModel.errorMessage,
          confirmButtonText: AppMessage.ok,
        ),
        fullscreenDialog: true,
      ));
    }else if(_viewModel.openRegisterPin){
      ScreenNavigator.replaceEntireStackTo(Routes.createPin, param: CreatePinScreenParam(false));
    }else if(_viewModel.openRegisterBiometrics){
      ScreenNavigator.replaceEntireStackTo(Routes.registerBiometrics);
    }else if(_viewModel.openVerifyPin){
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
                      ScreenNavigator.navigateReplaceTo(Routes.verifyPin, param: VerifyPinScreenParam(false));
                    }
                ),
              )
          )
      );
    }else if(_viewModel.openLoginDelay) {
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
                      ScreenNavigator.navigateReplaceTo(Routes.login);
                    }
                ),
              )
          )
      );
    }
  }

}
