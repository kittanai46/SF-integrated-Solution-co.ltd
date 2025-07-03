import 'dart:async';
import 'dart:io';

import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/client/service_api.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../navigator/routes.dart';
import '../../navigator/screen_navigator.dart';

part 'splash_screen_view_model.g.dart';

class SplashScreenViewModel = SplashScreenViewModelBase with _$SplashScreenViewModel;

abstract class SplashScreenViewModelBase with Store {
  SplashScreenViewModelBase();

  String resultCheckVersion = '';
  String messageCheckVersion = '';
  String appStoreIdCheckVersion = '';

  String version="";
  String buildnumber="";
  String? thaidState;
  String? thaidPoliceID= "";
  String? thaidStatus= "";
  String? thaidMessage= "";

  @observable String track = "";

  @action
  Future<void> checkVersion() async{
    track = "checkVersion-1";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    String platform = '';
    if(Platform.isIOS){
      platform = 'ios';
    }else{
      platform = 'android';
    }

    StringUtils.log(">>> version: ${version}");
    StringUtils.log(">>> platform: ${platform}");

    status = ActionStatus.inProgress;
    try {
      track = "checkVersion-2";
      final response = await ApiClient().checkVersion(version, platform);
      track = "checkVersion-3";
      StringUtils.log("response: ${response.result}");
      StringUtils.log("response: ${response.message}");
      StringUtils.log("response: ${response.appStoreId}");
      resultCheckVersion = response.result!;    //force_update
      messageCheckVersion = response.message!;  //ระบบมีการปรับปรุง
      appStoreIdCheckVersion = response.appStoreId!;
      status = ActionStatus.success;
    } on Exception catch (obj) {
      track = "checkVersion-4";
      await _handleException(obj);
      track = "checkVersion-5";
    }
  }



  @action
  Future<void> checkAuthenticate() async{
    track = "checkAuthenticate-1";
    final username = await KeyUtils.getUsername();

    status = ActionStatus.inProgress;
    try {
      track = "checkAuthenticate-2";
      await ApiClient().checkActivateDevice(username);  //Check Authenticate api
      track = "checkAuthenticate-3";
      status = ActionStatus.success;
    } on Exception catch (obj) {
      track = "checkAuthenticate-4";
      await _handleException(obj);
      track = "checkAuthenticate-2";
    }
  }

  Future<void> getVersionInfo() async{
    // status = ActionStatus.inProgress;
    track = "getVersionInfo-1";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    track = "getVersionInfo-2";
    version = packageInfo.version;
    buildnumber=packageInfo.buildNumber;
    print("get version => "+version+" "+buildnumber);
  }
  // ---- COMMON ---------------

  @observable ActionStatus status = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  bool openLogin = false;
  bool openWaitSMS = false;
  bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;
  bool openVerifyPin = false;
  bool openLoginDelay = false;

  @action
  void resetStatus() {
    status = ActionStatus.idle;
    showError = false;
  }

  Future<void> _handleException(Object obj) async{
    track = "_handleException-1";
    switch (obj.runtimeType) {
      case DioError:
        final type = (obj as DioError).type;
        if(type == DioErrorType.connectionTimeout
             || type == DioErrorType.sendTimeout
             || type == DioErrorType.receiveTimeout
             || type == DioErrorType.cancel
             || type == DioErrorType.unknown
        ){
          track = "_handleException-2";
          showError = true;
          errorTitle = AppMessage.error;
          errorMessage = AppMessage.connectedTimeout;

        }else {
          track = "_handleException-3";
          final response = obj.response;
          final statusCode = response!.statusCode!;

          if(statusCode>=400 && statusCode<500){
            track = "_handleException-4";
            final responseDto = CommonResponseDto.fromJson(
                gsonDecode(response.data.toString()));
            errorTitle = AppMessage.error;
            errorMessage = responseDto.message;

            if (statusCode == 400) {
              track = "_handleException-5";
              showError = true;
            } else if (statusCode == 401) {
              track = "_handleException-6";
              await KeyUtils.clearAll();
              openLogin = true;
            } else if (statusCode == 402) {
              track = "_handleException-7";
              openWaitSMS = true;
            } else if (statusCode == 403) {
              track = "_handleException-8";
              openWaitAdmin = true;
            } else if (statusCode == 404) {
              track = "_handleException-9";
              openRegisterPin = true;
            } else if (statusCode == 405) {
              track = "_handleException-10";
              openRegisterBiometrics = true;
            } else if (statusCode == 406) {
              track = "_handleException-11";
              openVerifyPin = true;
            } else if (statusCode == 407) {
              track = "_handleException-12";
              openLoginDelay = true;
            }else{
              track = "_handleException-13";
              showError = true;
            }
          }else {
            track = "_handleException-14";
            showError = true;
            errorTitle = AppMessage.error;
            errorMessage = AppMessage.pleaseTryAgain;
          }
        }

        break;
      default:
        showError = true;
        errorTitle = AppMessage.error;
        errorMessage = AppMessage.pleaseTryAgain;
        break;
    }
    status = ActionStatus.error;
  }

  @action
  Future<void> getThaiIDScope() async {
    track = "getThaiIDScope-1";
    final thaidstate = await KeyUtils.getThaidState();
    status = ActionStatus.inProgress;
    try {
      track = "getThaiIDScope-2";
      final response = await ApiClient().getThaIDScope(thaidstate); //Check Authenticate api
      track = "getThaiIDScope-3";
      thaidPoliceID = response.thaidPoliceID;
      thaidStatus = response.thaidStatus;
      thaidMessage = response.thaidMessage;
      StringUtils.log("thaidPoliceID " + thaidPoliceID!);
      StringUtils.log("thaidStatus " + thaidStatus!);
      StringUtils.log("thaidMessage " + thaidMessage!);
      KeyUtils.saveUsername(thaidPoliceID!);
      status = ActionStatus.success;
    } on Exception catch (obj) {
      thaidPoliceID = "";
      thaidStatus = "";
      thaidMessage = "";
      track = "getThaiIDScope-4";
      await _handleException(obj);
      track = "getThaiIDScope-5";
    }
  }

}
