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

part 'pre_scanqr_screen_view_model.g.dart';

class PreScanQRScreenViewModel = PreScanQRScreenViewModelBase with _$PreScanQRScreenViewModel;

abstract class PreScanQRScreenViewModelBase with Store {
  PreScanQRScreenViewModelBase();

  String? username;

  @observable String version="";
  @observable String buildnumber="";

  @action
  Future<void> getVersionInfo() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildnumber=packageInfo.buildNumber;
    print("get version => "+version+" "+buildnumber);
  }

  // ---- COMMON ------

  @observable ActionStatus status = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  bool openLogin = false;

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

          // final statusCode = response!.statusCode!;
          // if(statusCode == 400) {
          //   showError = true;
          // }
          // if(statusCode == 401) {
          //   await KeyUtils.clearAll();
          //   openLogin = true;
          // }else if(statusCode == 402){
          //   openWaitSMS = true;
          // }else if(statusCode == 403){
          //   openWaitAdmin = true;
          // }else if(statusCode == 404){
          //   openRegisterPin = true;
          // }else if(statusCode == 405){
          //   openRegisterBiometrics = true;
          // }
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
