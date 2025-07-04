import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/device_infomation_utils.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gson/gson.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sodium_libs/sodium_libs.dart';

import '../../navigator/routes.dart';
import '../../navigator/screen_navigator.dart';

part 'login_screen_view_model.g.dart';

class LoginScreenViewModel = LoginScreenViewModelBase with _$LoginScreenViewModel;

abstract class LoginScreenViewModelBase with Store {
  LoginScreenViewModelBase();

  @observable String username = '';
  @computed bool get isEnableButton => _isInputValid(username);
  @observable bool isUsernameEmpty = true;
  bool isRequestLogin = false;

  @observable String version="";
  @observable String buildnumber="";
  @observable String successMessage = '';
  double? lastedLat = 0;
  double? lastedLon = 0;
  String? stationName = "";
  String? stationAddr = "";
  String? _clientPublicKey;
  String? _clientSecretKey;
  String? _serverPublicKey;
  String? thaidState;
  String? thaidHost;
  String? thaidPoliceID= "";
  String? thaidStatus= "";
  String? thaidMessage= "";
  final LocalAuthentication auth = LocalAuthentication();



  @action
  Future<void> login(String username) async {
    StringUtils.log("===> xxxxxxxxxxxxxx>>login");
    if (!_isInputValid(username)) {
      return;
    }

    if(AppConstant.isMockUser && username=="TESTUSER"){
      status = ActionStatus.success;
    }else{
      //TODO: Check Keys availble?
      final isUsernameAndKeysAvailable = await KeyUtils.isUsernameAndKeysAvailable();
      StringUtils.log("===> Login isUsernameAndKeysAvailable: $isUsernameAndKeysAvailable");

      if(isUsernameAndKeysAvailable){
        await _checkActivateDevice();

      }else{
        await KeyUtils.clearAll();
        await KeyUtils.saveUsername(username);
        isRequestLogin = false;
        status = ActionStatus.success;
      }
    }
  }

  Future<void> _checkActivateDevice() async {
    // Call api check login
    StringUtils.log("===> xxxxxxxxxxxxxx>>_checkActivateDevice");
    isRequestLogin = true;
    status = ActionStatus.inProgress;
    try {
      await ApiClient().checkActivateDevice(username);
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }
  bool _isInputValid(String username) {
    if (StringUtils.isNull(username)) {
      // isUsernameEmpty = true;
      return false;
    }
    // isUsernameEmpty = false;

    return true;
  }

  Future<void> getVersionInfo() async{
    StringUtils.log("===> xxxxxxxxxxxxxx>>getVersionInfo");
    // status = ActionStatus.inProgress;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildnumber=packageInfo.buildNumber;
    print("get version => "+version+" "+buildnumber);
  }

  @action
  Future<void> getNearestPoliceStation() async {
    try {
      status = ActionStatus.inProgress;
      Position position = await DeviceInformationUtils.determinePosition();

      final response = await ApiClient().getNearestPoliceStation('${position.latitude}', '${position.longitude}');
      if(response.lat!=null && response.lat!.isNotEmpty && response.lon!=null && response.lon!.isNotEmpty){
        lastedLat = double.tryParse(response.lat!);
        lastedLon = double.tryParse(response.lon!);
        stationName = response.name;
        stationAddr = response.address;
      }

      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }



  @action
  Future<void> getResponsiblePoliceStation() async {
    try {
      status = ActionStatus.inProgress;
      Position position = await DeviceInformationUtils.determinePosition();

      final response = await ApiClient().getResponsiblePoliceStation('${position.latitude}', '${position.longitude}');
      if(response.lat!=null && response.lat!.isNotEmpty && response.lon!=null && response.lon!.isNotEmpty){
        lastedLat = double.tryParse(response.lat!);
        lastedLon = double.tryParse(response.lon!);
        stationName = response.name;
        stationAddr = response.address;
      }

      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  @action
  Future<void> generateThaIDState() async {

    if(status == ActionStatus.inProgress) return;
    status = ActionStatus.inProgress;
    try {
      final response = await ApiClient().generateThaIDState();

      thaidState = response.thaidState;
      thaidHost = response.thaidHost;
      successMessage = response.message!;
      StringUtils.log("-- thaIDState: $thaidState");
      StringUtils.log("-- thaIDHost: $thaidHost");

      status = ActionStatus.success;

    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  @action
  Future<void> getThaiIDScope() async{
    final thaidstate = await KeyUtils.getThaidState();
    status = ActionStatus.inProgress;
    try {
      final response = await ApiClient().getThaIDScope(thaidstate);  //Check Authenticate api
      thaidPoliceID = response.thaidPoliceID;
      thaidStatus = response.thaidStatus;
      thaidMessage= response.thaidMessage;
      StringUtils.log("thaidPoliceID "+thaidPoliceID!);
      StringUtils.log("thaidStatus "+thaidStatus!);
      StringUtils.log("thaidMessage "+thaidMessage!);

      if(response.thaidStatus!.isNotEmpty && response.thaidStatus=='success'){
        status = ActionStatus.success;
        KeyUtils.saveUsername(thaidPoliceID!);
      }else{
        status = ActionStatus.error;
        errorMessage = response.thaidMessage!;
      }
    } on Exception catch (obj) {
      thaidPoliceID = "";
      thaidStatus = "";
      thaidMessage= "";
      await _handleException(obj);
    }
  }

  @action
  Future<void> regisThaiIDCrimesOnline(String thaidCode,String thaidState) async{
    status = ActionStatus.inProgress;
    try {
      KeyPair keyPair = await KeyUtils.generateKeyPair();
      _clientPublicKey = Base64Encoder().convert(keyPair.publicKey);
      _clientSecretKey = Base64Encoder().convert(keyPair.secretKey.extractBytes());
      StringUtils.log("-- clientPublicKey: $_clientPublicKey");
      StringUtils.log("-- clientSecretKey: $_clientSecretKey");

      final deviceInfo = await DeviceInformationUtils.getDeviceIdentifier();

      String hasFingerprint = "false";
      final canCheckBiometrics = await _checkBiometrics();
      if(canCheckBiometrics){
        final hasBiometrics = await _getAvailableBiometrics();
        if(hasBiometrics) hasFingerprint = "true";
      }

      String osName = '';
      if(Platform.isIOS){
        osName = 'ios';
      }else{
        osName = 'android';
      }

      final response = await ApiClient().regisThaIDCrimesOnline(
          deviceInfo.deviceUdid!,
          deviceInfo.deviceName!,
          deviceInfo.brand!,
          "TEST",
          osName,
          deviceInfo.osVersion!,
          deviceInfo.buildNumber!,
          deviceInfo.manufacturer!,
          deviceInfo.model!,
          _clientPublicKey!,
          hasFingerprint,
          thaidState,//Thaid State
          thaidCode,//Thaid Code
      );

      StringUtils.log('regisThaIDCrimesOnline response.status: ${response.status}');
      StringUtils.log('regisThaIDCrimesOnline response.Message: ${response.message}');
      if(response.status!.isNotEmpty && response.status=='success'){
        status = ActionStatus.success;
        successMessage = response.message!;
        _serverPublicKey = response.key;
        successMessage = response.message!;
        thaidStatus = response.status;
        thaidMessage=response.message;
        StringUtils.log("-- serverPublicKey: $_serverPublicKey");
        StringUtils.log("-- thaidPoliceID: "+response.thaidPoliceID!);
        await KeyUtils.saveUsername(response.thaidPoliceID!);
        await KeyUtils.saveKeys(_clientPublicKey!, _clientSecretKey!, _serverPublicKey!);
      }else{
        status = ActionStatus.error;
        errorMessage = response.message!;
      }

    } on Exception catch (obj) {
      thaidStatus = "";
      thaidMessage= "";
      await _handleException(obj);
    }
  }

  Future<bool> _checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      StringUtils.log('${e.message}');
    }
    return canCheckBiometrics;
  }

  Future<bool> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    bool isFingerPrintAvailable = false;
    bool isFaceIdAvailable = false;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();

      isFingerPrintAvailable = availableBiometrics.contains(BiometricType.fingerprint);
      isFaceIdAvailable = availableBiometrics.contains(BiometricType.face);

    } on PlatformException catch (e) {
      StringUtils.log('${e.message}');
    }
    return isFingerPrintAvailable || isFaceIdAvailable;
  }

  // ---- COMMON ------

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
    switch (obj.runtimeType) {
      case DioError:
        final type = (obj as DioError).type;
        if(type == DioErrorType.connectionTimeout){
          showError = true;
          errorTitle = AppMessage.error;
          errorMessage = AppMessage.connectedTimeout;

        }else {
          final response = (obj as DioError).response;
          final statusCode = response!.statusCode!;

          if(statusCode>=400 && statusCode<500){
            final responseDto = CommonResponseDto.fromJson(
                gsonDecode(response.data.toString()));
            errorTitle = AppMessage.error;
            errorMessage = responseDto.message;

            if (statusCode == 400) {
              showError = true;
            } else if (statusCode == 401) {
              await KeyUtils.clearAll();
              openLogin = true;
            } else if (statusCode == 402) {
              openWaitSMS = true;
            } else if (statusCode == 403) {
              openWaitAdmin = true;
            } else if (statusCode == 404) {
              openRegisterPin = true;
            } else if (statusCode == 405) {
              openRegisterBiometrics = true;
            } else if (statusCode == 406) {
              openVerifyPin = true;
            } else if (statusCode == 407) {
              showError = true;
              openLoginDelay = true;
              // Timer(Duration(seconds: 5), () {
              //   StringUtils.log('After 5 seconds');
              //   _logout();
              // });
            }
          }else {
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

}
