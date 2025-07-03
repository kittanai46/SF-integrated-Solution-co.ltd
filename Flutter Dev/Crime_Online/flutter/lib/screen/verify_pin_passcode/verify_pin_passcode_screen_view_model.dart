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

part 'verify_pin_passcode_screen_view_model.g.dart';

class VerifyPinPasscodeScreenViewModel = VerifyPinPasscodeScreenViewModelBase with _$VerifyPinPasscodeScreenViewModel;

abstract class VerifyPinPasscodeScreenViewModelBase with Store {


  // ---- PIN ---------

  @observable String number1 = "";
  @observable String number2 = "";
  @observable String number3 = "";
  @observable String number4 = "";
  @observable String number5 = "";
  @observable String number6 = "";
  @observable bool fromSessionTimeout = false;

  UserDto? userDto;
  EulaDto? eulaDto;

  @action
  Future<void> select(String number) async{
    if(number1.isEmpty) number1 = number;
    else if(number2.isEmpty) number2 = number;
    else if(number3.isEmpty) number3 = number;
    else if(number4.isEmpty) number4 = number;
    else if(number5.isEmpty) number5 = number;
    else if(number6.isEmpty) {
      number6 = number;
      await _verifyPin("$number1$number2$number3$number4$number5$number6");
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
  }

  Future<void> _verifyPin(String pin) async {
    if (!_isInputValid(pin)) {
      return;
    }

    if(AppConstant.isMockUser){
      //TODO: MockUser
      // _mockUser();
      status = ActionStatus.success;

    }else{
      status = ActionStatus.inProgress;
      try {
        await ApiClient().verifyPinPasscode(pin);
        status = ActionStatus.success;
      } on Exception catch (obj) {
        await _handleException(obj);
      }
    }
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


  // --- BIOMETRICS ----

  final LocalAuthentication auth = LocalAuthentication();
  bool hasBiometrics = false;
  @observable bool isEnableBiometrics = false; 

  @action
  Future<void> refreshBiometrics() async {
    if(AppConstant.isMockUser){
      isEnableBiometrics = false;
    }else{
      hasBiometrics = await checkBiometricsAvailable();
      final isBiometricsTokenAvailable = await KeyUtils.isBiometricsTokenAvailable();
      String biometricsToken = await KeyUtils.getBiometricsToken();
      if(biometricsToken == null) biometricsToken = '';

      if(hasBiometrics && isBiometricsTokenAvailable && biometricsToken != AppConstant.tempBiometrics){
        isEnableBiometrics = true;
      }else{
        isEnableBiometrics = false;
      }
    }
  }

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

  @action
  Future<void> authenBiometrics() async {
    status = ActionStatus.idle;
    bool authenticated = false;
    try {
      // authenticated = await auth.authenticateWithBiometrics(
      //     localizedReason: 'Please authenticate',
      //     useErrorDialogs: true,
      //     stickyAuth: true);
      authenticated = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      StringUtils.log('${e.message}');
    }

    StringUtils.log("authenticated: $authenticated");

    if(authenticated) {
      await _verifyBiometricToken();
    }
  }

  Future<void> _verifyBiometricToken() async{
    final biometricsToken = await KeyUtils.getBiometricsToken();

    status = ActionStatus.inProgress;
    try {
      await ApiClient().verifyBiometrics(biometricsToken);
      await KeyUtils.saveLogin(true);

      final eulaResponse = await ApiClient().getEula();
      final listEulaDto = eulaResponse.listEulaDto;
      if(listEulaDto!=null && listEulaDto.data!=null && listEulaDto.data!.length>0){
        eulaDto = listEulaDto.data![0];
      }

      final _getUserResponse = await ApiClient().getUser();
      userDto = _getUserResponse.user;
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }


  // ----- COMMON --------

  @observable ActionStatus status = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  // bool openLogin = false;
  // bool openWaitSMS = false;
  // bool openWaitAdmin = false;
  // bool openRegisterPin = false;
  // bool openRegisterBiometrics = false;
  // bool openVerifyPinPasscode = false;

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

          if(statusCode>=400 && statusCode<500) {
            final responseDto = CommonResponseDto.fromJson(
                gsonDecode(response.data.toString()));
            errorTitle = AppMessage.error;
            errorMessage = responseDto.message;

            if (statusCode == 400) {
              showError = true;
            } /*else if (statusCode == 401) {
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
              // openVerifyPinPasscode = true;
              showError = true;
            }*/
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
