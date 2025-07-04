import 'dart:async';

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

part 'verify_pin_screen_view_model.g.dart';

class VerifyPinScreenViewModel = VerifyPinScreenViewModelBase with _$VerifyPinScreenViewModel;

abstract class VerifyPinScreenViewModelBase with Store {


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
      // TODO: Fix MockUser
      _mockUser();
      status = ActionStatus.success;

    }else{
      status = ActionStatus.inProgress;
      try {
        await ApiClient().verifyPin(pin);
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
  }

  void _mockUser() {
    userDto = UserDto();
    userDto?.policeId = "TESTUSER";
    userDto?.pid = "1234567890123";
    userDto?.firstname = "TEST";
    userDto?.lastname = "TEST";
    userDto?.rank = "TEST";
    userDto?.position = "TEST";
    userDto?.posOrg = "TEST";
    RoleSearchExternalDto mockRoleExternal = RoleSearchExternalDto();
    mockRoleExternal.flagBot = false;
    mockRoleExternal.flagBotEnd = '';
    mockRoleExternal.flagBotLock = false;
    mockRoleExternal.flagBotStart = '';
    mockRoleExternal.flagDbd = false;
    mockRoleExternal.flagPersonCorrection = false;
    mockRoleExternal.flagPersonCorrectionLock = false;
    mockRoleExternal.flagPersonCorrectionStart = '';
    mockRoleExternal.flagPersonDlt = false;
    mockRoleExternal.flagPersonDltEnd = '';
    mockRoleExternal.flagPersonDltLock = false;
    mockRoleExternal.flagPersonDltStart = '';
    mockRoleExternal.flagPersonDltDl = false;
    mockRoleExternal.flagPersonDltDlEnd = '';
    mockRoleExternal.flagPersonDltDlLock = false;
    mockRoleExternal.flagPersonDltDlStart = '';
    mockRoleExternal.flagPersonDltPl = false;
    mockRoleExternal.flagPersonDltPlEnd = '';
    mockRoleExternal.flagPersonDltPlStart = '';
    mockRoleExternal.flagPersonDocr = false;
    mockRoleExternal.flagPersonDocrEnd = '';
    mockRoleExternal.flagPersonDocrLock = false;
    mockRoleExternal.flagPersonDocrStart = '';
    mockRoleExternal.flagPersonDoe = false;
    mockRoleExternal.flagPersonDoeEnd = '';
    mockRoleExternal.flagPersonDoeLock = false;
    mockRoleExternal.flagPersonDoeStart = '';
    mockRoleExternal.flagPersonDopa = true;
    mockRoleExternal.flagPersonDopaEnd = '';
    mockRoleExternal.flagPersonDopaLock = false;
    mockRoleExternal.flagPersonDopaStart = '';
    mockRoleExternal.flagPersonDopaLinkage = false;
    mockRoleExternal.flagPersonDopaLinkageEnd = '';
    mockRoleExternal.flagPersonDopaLinkageLock = false;
    mockRoleExternal.flagPersonDopaLinkageStart = '';
    mockRoleExternal.flagPersonGun = false;
    mockRoleExternal.flagPersonGunEnd = '';
    mockRoleExternal.flagPersonGunLock = false;
    mockRoleExternal.flagPersonGunStart = '';
    //mockRoleExternal.flagPersonLinkage = false;
    mockRoleExternal.flagPersonNhso = false;
    mockRoleExternal.flagPersonNhsoEnd = '';
    mockRoleExternal.flagPersonNhsoLock = false;
    mockRoleExternal.flagPersonNhsoStart = '';
    mockRoleExternal.flagPersonPtm = false;
    mockRoleExternal.flagPersonPtmEnd = '';
    mockRoleExternal.flagPersonPtmLock = false;
    mockRoleExternal.flagPersonPtmStart = '';
    mockRoleExternal.flagPersonSso = false;
    mockRoleExternal.flagPersonSsoEnd = '';
    mockRoleExternal.flagPersonSsoLock = false;
    mockRoleExternal.flagPersonSsoStart = '';
    mockRoleExternal.flagPersonTm = false;
    mockRoleExternal.flagPersonTmEnd = '';
    mockRoleExternal.flagPersonTmLock = false;
    mockRoleExternal.flagPersonTmStart = '';
    mockRoleExternal.flagPersonTm61 = false;
    mockRoleExternal.flagPersonTm61End = '';
    mockRoleExternal.flagPersonTm61Lock = false;
    mockRoleExternal.flagPersonTm61Start = '';
    mockRoleExternal.flagPersonWarrant = false;
    mockRoleExternal.flagVerhicleDlt = true;
    mockRoleExternal.flagVerhiclePtm = false;
    mockRoleExternal.flagPersonPrisoner = false;
    userDto?.roleSearchExternal = mockRoleExternal;

    RoleSearchInternalDto mockRoleInternal = RoleSearchInternalDto();
    mockRoleInternal.flagPersonCc = false;
    mockRoleInternal.flagPersonTc = false;
    mockRoleInternal.flagPersonSs = false;
    mockRoleInternal.flagPersonWr = false;
    mockRoleInternal.flagVehicleCc = false;
    mockRoleInternal.flagVehicleTc = false;
    mockRoleInternal.flagVehicleLost = false;
    mockRoleInternal.flagWeaponCc = false;
    mockRoleInternal.flagWeaponSs = false;
    mockRoleInternal.flagWeaponLost = false;
    mockRoleInternal.flagAssetCc = false;
    mockRoleInternal.flagCrimecase = true;
    mockRoleInternal.flagTrafficcase = false;
    mockRoleInternal.flagCrimecaseWr = false;
    mockRoleInternal.flagCrimecaseLc = false;
    userDto?.roleSearchInternal = mockRoleInternal;
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

      authenticated = await auth.authenticate(
            localizedReason: 'Please authenticate',
      );
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

  bool openLogin = false;
  bool openWaitSMS = false;
  bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;
  // bool openVerifyPin = false;
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
            } else if (statusCode == 406) {
              // openVerifyPin = true;
              showError = true;
            } else if (statusCode == 407) {
              openLoginDelay = true;
            }else {
              showError = true;
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
