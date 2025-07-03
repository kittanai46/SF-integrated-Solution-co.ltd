import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/eula_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:gson/gson.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'create_pin_screen_view_model.g.dart';

class CreatePinScreenViewModel = CreatePinScreenViewModelBase with _$CreatePinScreenViewModel;

abstract class CreatePinScreenViewModelBase with Store {

  final LocalAuthentication auth = LocalAuthentication();

  @observable String title = '';
  @observable String pin = '';
  @observable String number1 = "";
  @observable String number2 = "";
  @observable String number3 = "";
  @observable String number4 = "";
  @observable String number5 = "";
  @observable String number6 = "";

  @observable String version="";
  @observable String buildnumber="";

  UserDto? userDto;
  EulaDto? eulaDto;
  bool isChangePin = false;

  final String titleCreatePin = "ตั้งค่ารหัส PIN";
  final String titleConfirmPin = "ยืนยันรหัส PIN";
  String newPin = "";

  @action
  Future<void> select(String number) async{
    if(number1.isEmpty) number1 = number;
    else if(number2.isEmpty) number2 = number;
    else if(number3.isEmpty) number3 = number;
    else if(number4.isEmpty) number4 = number;
    else if(number5.isEmpty) number5 = number;
    else if(number6.isEmpty) {
      number6 = number;
      if(title == titleCreatePin){
        newPin = "$number1$number2$number3$number4$number5$number6";
        StringUtils.log("newPin1 : $newPin");

        title = titleConfirmPin;
        number1 = "";
        number2 = "";
        number3 = "";
        number4 = "";
        number5 = "";
        number6 = "";
        StringUtils.log("newPin2 : $newPin");

      }else if(title == titleConfirmPin){
        String confirmPin = "$number1$number2$number3$number4$number5$number6";
        if(newPin == confirmPin){
          if(!isChangePin) {
            await _createPin(confirmPin);
          }else {
            await _changePin(confirmPin);
          }
        }else {
          number1 = "";
          number2 = "";
          number3 = "";
          number4 = "";
          number5 = "";
          number6 = "";
          showError = true;
          status = ActionStatus.error;
          errorTitle = 'คุณกรอกรหัส PIN ผิด';
          errorMessage = 'กรุณาตรวจสอบและกรอกใหม่อีกครั้ง';
        }
      }
    }
  }

  @action
  delete(){
    if(number6.isNotEmpty) number6 = "";
    else if(number5.isNotEmpty) number5 = "";
    else if(number4.isNotEmpty) number4 = "";
    else if(number3.isNotEmpty) number3 = "";
    else if(number2.isNotEmpty) number2 = "";
    else if(number1.isNotEmpty) number1 = "";
    else if(title == titleConfirmPin){
      newPin = "";
      title = titleCreatePin;
    }
  }

  @action
  void resetTitle() {
    title = titleCreatePin;
  }

  Future<void> _createPin(String pin) async {
    if (!_isInputValid(pin)) {
      return;
    }

    status = ActionStatus.inProgress;
    try {
      await ApiClient().registerPin(pin);
      // TODO: Check device has biometric or not?
      final hasBiometrics = await checkBiometricsAvailable();
      if(!hasBiometrics) {
        // Not found biometrics => Handle by call api register biometrics with temp params.
        final biometricsToken = AppConstant.tempBiometrics;
        await ApiClient().registerBiometrics(biometricsToken);
        await KeyUtils.saveBiometricsToken(biometricsToken);

        final eulaResponse = await ApiClient().getEula();
        final listEulaDto = eulaResponse.listEulaDto;
        if(listEulaDto!=null && listEulaDto.data!=null && listEulaDto.data!.length>0){
          eulaDto = listEulaDto.data![0];
        }

        final _getUserResponse = await ApiClient().getUser();
        userDto = _getUserResponse.user;
      }

      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  Future<void> _changePin(String pin) async {
    if (!_isInputValid(pin)) {
      return;
    }

    status = ActionStatus.inProgress;
    try {
      await ApiClient().changePin(pin);
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  @action
  Future<bool> checkBiometricsAvailable() async {
    bool hasBiometrics = false;
    try {
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      if(canCheckBiometrics) {
        final listBiometrics = await auth.getAvailableBiometrics();
        if(listBiometrics.length > 0){
          hasBiometrics = true;
        }
      }

    } on PlatformException catch (e) {
      StringUtils.log('${e.message}');
    }

    return hasBiometrics;
  }

  bool _isInputValid(String pin) {
    if (pin == null || pin.isEmpty) {
      return false;
    }

    //TODO: Check otp format
    if(pin.length != 6) {
      return false;
    }

    return true;
  }


  Future<void> getVersionInfo() async{
    // status = ActionStatus.inProgress;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildnumber=packageInfo.buildNumber;
    print("get version => "+version+" "+buildnumber);
  }


  // ---- COMMON -------

  @observable ActionStatus status = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  bool openLogin = false;
  bool openWaitSMS = false;
  bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;

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
          int statusCode = response!.statusCode!;

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
            }
          }else{
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
