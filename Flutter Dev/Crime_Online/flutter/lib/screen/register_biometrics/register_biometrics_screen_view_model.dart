import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/eula_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:gson/gson.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';

part 'register_biometrics_screen_view_model.g.dart';

class RegisterBiometricsScreenViewModel = RegisterBiometricsScreenViewModelBase with _$RegisterBiometricsScreenViewModel;

abstract class RegisterBiometricsScreenViewModelBase with Store {
  RegisterBiometricsScreenViewModelBase();

  final LocalAuthentication auth = LocalAuthentication();
  UserDto? userDto;
  EulaDto? eulaDto;

  @action
  Future<void> authenticate() async {
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

    if(authenticated) {
      await _registerBiometricToken();
    }
  }

  Future<void> _registerBiometricToken() async{
    final biometricsToken = KeyUtils.createCryptoRandomString();

    status = ActionStatus.inProgress;
    try {
      await ApiClient().registerBiometrics(biometricsToken);
      await KeyUtils.saveBiometricsToken(biometricsToken);

      final eulaResponse = await ApiClient().getEula();
      final listEulaDto = eulaResponse.listEulaDto;
      if(listEulaDto!=null && listEulaDto.data!=null && listEulaDto.data!.length>0){
        eulaDto = listEulaDto.data![0];
      }

      final response = await ApiClient().getUser();
      userDto = response.user;
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  @action
  Future<void> skipRegisterBiometric() async {
    final biometricsToken = AppConstant.tempBiometrics;

    status = ActionStatus.inProgress;
    try {
      await ApiClient().registerBiometrics(biometricsToken);
      await KeyUtils.saveBiometricsToken(biometricsToken);

      final eulaResponse = await ApiClient().getEula();
      final listEulaDto = eulaResponse.listEulaDto;
      if(listEulaDto!=null && listEulaDto.data!=null && listEulaDto.data!.length>0){
        eulaDto = listEulaDto.data![0];
      }

      final response = await ApiClient().getUser();
      userDto = response.user;
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }


  // ----- COMMON ------------

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
          final statusCode = response!.statusCode!;

          if(statusCode>=400 && statusCode<500) {
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
