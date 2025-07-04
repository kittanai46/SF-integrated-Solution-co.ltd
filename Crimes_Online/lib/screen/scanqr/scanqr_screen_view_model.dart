import 'dart:convert';
import 'dart:io';

import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/common/api_request_exception.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/device_infomation_utils.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:gson/gson.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sodium_libs/sodium_libs.dart';


part 'scanqr_screen_view_model.g.dart';

class ScanQRScreenViewModel = ScanQRScreenViewModelBase with _$ScanQRScreenViewModel;

abstract class ScanQRScreenViewModelBase with Store {
  ScanQRScreenViewModelBase();

  final LocalAuthentication auth = LocalAuthentication();

  String? username;
  @observable String barcode = '';

  String? _clientPublicKey;
  String? _clientSecretKey;
  String? _serverPublicKey;

  String pushToken = 'TEST';
  @observable String successMessage = '';

  @action
  Future<void> requestLoginScanQR(String barcode) async {
    if(barcode.isEmpty || barcode=='-1') return;

    if(status == ActionStatus.inProgress) return;
    status = ActionStatus.inProgress;
    try {
      //Generate Key
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

      final response = await ApiClient().loginScanQR(
          username!,
          barcode,
          deviceInfo.deviceUdid!,
          deviceInfo.deviceName!,
          deviceInfo.brand!,
          pushToken,
          osName,
          deviceInfo.osVersion!,
          deviceInfo.buildNumber!,
          deviceInfo.manufacturer!,
          deviceInfo.model!,
          _clientPublicKey!,
          hasFingerprint
      );

      _serverPublicKey = response.key;
      successMessage = response.message!;
      StringUtils.log("-- serverPublicKey: $_serverPublicKey");

      await KeyUtils.saveUsername(username!);
      await KeyUtils.saveKeys(_clientPublicKey!, _clientSecretKey!, _serverPublicKey!);

      status = ActionStatus.success;

    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  @action
  Future<bool> requestLoginScanQRCRIMES(String barcode) async {
    bool result = false;
    if(barcode.isEmpty || barcode=='-1') return result;

    if(status == ActionStatus.inProgress) return result;
    status = ActionStatus.inProgress;
    try {
      // //Generate Key
      // KeyPair keyPair = await KeyUtils.generateKeyPair();
      // _clientPublicKey = Base64Encoder().convert(keyPair.pk);
      // _clientSecretKey = Base64Encoder().convert(keyPair.sk);
      // StringUtils.log("-- clientPublicKey: $_clientPublicKey");
      // StringUtils.log("-- clientSecretKey: $_clientSecretKey");

      final deviceInfo = await DeviceInformationUtils.getDeviceIdentifier();

      // String osName = '';
      // if(Platform.isIOS){
      //   osName = 'ios';
      // }else{
      //   osName = 'android';
      // }

      final response = await ApiClient().scanQrLoginCRIMES(
          barcode,
      );

      StringUtils.log('LoginQR response.status: ${response.status}');
      if(response.status!.isNotEmpty && response.status=='success'){
        status = ActionStatus.success;
        successMessage = response.message!;
      }else{
        status = ActionStatus.error;
        errorMessage = response.message!;
      }

    } on Exception catch (obj) {
      await _handleException(obj);
    }

    return result;
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
  bool openGPSDisabled = false;
  bool openVerifyPin = false;

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

          final responseDto = CommonResponseDto.fromJson(
              gsonDecode(response!.data.toString()));
          errorTitle = 'การ Scan QR Code ไม่สำเร็จ'; //AppMessage.error;
          errorMessage = responseDto.message;
          openLogin = true;

          final statusCode = response.statusCode!;
          if(statusCode == 400) {
            showError = true;
          }
          if(statusCode == 401) {
            await KeyUtils.clearAll();
            openLogin = true;
          }else if(statusCode == 402){
            openWaitSMS = true;
          }else if(statusCode == 403){
            openWaitAdmin = true;
          }else if(statusCode == 404){
            openRegisterPin = true;
          }else if(statusCode == 405){
            openRegisterBiometrics = true;
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

  // Future<void> _handleException(Object obj) async{
  //   switch (obj.runtimeType) {
  //     case DioError:
  //       final type = (obj as DioError).type;
  //       if(type == DioErrorType.connectTimeout){
  //         showError = true;
  //         errorTitle = AppMessage.error;
  //         errorMessage = AppMessage.connectedTimeout;
  //
  //       }else {
  //         final response = (obj as DioError).response;
  //         final statusCode = response!.statusCode!;
  //
  //         if(statusCode>=400 && statusCode<500){
  //           final responseDto = CommonResponseDto.fromJson(
  //               gsonDecode(response.data.toString()));
  //           errorTitle = AppMessage.error;
  //           errorMessage = responseDto.message;
  //
  //           if (statusCode == 400) {
  //             showError = true;
  //           } else if (statusCode == 401) {
  //             await KeyUtils.clearAll();
  //             openLogin = true;
  //           } else if (statusCode == 402) {
  //             openWaitSMS = true;
  //           } else if (statusCode == 403) {
  //             openWaitAdmin = true;
  //           } else if (statusCode == 404) {
  //             openRegisterPin = true;
  //           } else if (statusCode == 405) {
  //             openRegisterBiometrics = true;
  //           } else if (statusCode == 406) {
  //             openVerifyPin = true;
  //           }
  //         }else {
  //           showError = true;
  //           errorTitle = AppMessage.error;
  //           errorMessage = AppMessage.pleaseTryAgain;
  //         }
  //       }
  //
  //       break;
  //     default:
  //       showError = true;
  //       errorTitle = AppMessage.error;
  //       errorMessage = AppMessage.pleaseTryAgain;
  //       break;
  //   }
  //   status = ActionStatus.error;
  // }

}
