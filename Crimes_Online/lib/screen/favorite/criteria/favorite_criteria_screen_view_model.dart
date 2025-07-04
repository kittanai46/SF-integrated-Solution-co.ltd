import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';

import '../../../util/string_utils.dart';

part 'favorite_criteria_screen_view_model.g.dart';

class FavoriteCriteriaScreenViewModel = FavoriteCriteriaScreenViewModelBase
    with _$FavoriteCriteriaScreenViewModel;

abstract class FavoriteCriteriaScreenViewModelBase with Store {
  @observable
  bool isEnableButton = false;
  @observable
  FavoriteDto favoriteDto = FavoriteDto(
    title: '',
    category: '',
    choices: [],
    innerDbs: [],
    outerDbs: [],
  );

  UserDto? userDto;
  String searchType = '';
  ParamScope scope = ParamScope();

  FavoriteCriteriaScreenViewModelBase() {}

  // @computed
  // bool get isEnableButton => _isInputValid();
  void _refreshEnableButton() {
    switch (searchType) {
      case AppConstant.kSearchPerson:
        {
          scope.hasInputPid = (scope.pid.isNotEmpty && scope.pid.length == 13);
          scope.hasInputPasId =
              scope.pasId.isNotEmpty && scope.nation.isNotEmpty;
          scope.hasInputNames =
              (scope.firstName.isNotEmpty && scope.lastName.isNotEmpty);
          scope.hasInputWorkerId = scope.workerId.isNotEmpty;
          scope.hasInputPassportNo = scope.passportNo.isNotEmpty;
          // scope.hasInputPidPlt1 = (scope.pid.isNotEmpty && scope.pid.length==13)  && scope.pltcode1.isNotEmpty;
          scope.hasInputPidPlt1 =
              (scope.pid.isNotEmpty && scope.pid.length == 13);
          scope.hasInputNamesPlt1 =
              (scope.firstName.isNotEmpty && scope.lastName.isNotEmpty) &&
                  scope.pltcode1.isNotEmpty;
          // scope.hasInputPidPlt2 = (scope.pid.isNotEmpty && scope.pid.length==13)  && scope.pltcode2.isNotEmpty;
          scope.hasInputPidPlt2 =
              (scope.pid.isNotEmpty && scope.pid.length == 13);
          scope.hasInputNamesPlt2 =
              (scope.firstName.isNotEmpty && scope.lastName.isNotEmpty) &&
                  scope.pltcode2.isNotEmpty;

          scope.hasInputImg = (scope.base64Image?.isNotEmpty ?? false);

          scope.hasInputGunReg = scope.gunReg.isNotEmpty;
          scope.hasInputAlienNo = scope.alienNo.isNotEmpty;
          
          isEnableButton = favoriteDto.choices != null &&
              favoriteDto.choices!.length > 0 &&
              (scope.hasInputPid ||
                  scope.hasInputPasId ||
                  scope.hasInputNames ||
                  scope.hasInputWorkerId ||
                  scope.hasInputPassportNo ||
                  scope.hasInputPidPlt1 ||
                  scope.hasInputNamesPlt1 ||
                  scope.hasInputPidPlt2 ||
                  scope.hasInputNamesPlt2 ||
                  scope.hasInputImg ||
                  scope.hasInputGunReg||
                  scope.hasInputAlienNo);
        }
        break;
      case AppConstant.kSearchCar:
        {
          scope.hasInputFullNoPlate = scope.proviceTc.isNotEmpty &&
              scope.intitialNo.isNotEmpty &&
              scope.number.isNotEmpty; //&& scope.status.isNotEmpty;
          scope.hasInputFullEngineNo =
              scope.engineNo.isNotEmpty; // && scope.status.isNotEmpty;
          //scope.hasInputPlateProv = scope.plate1Vh.isNotEmpty && scope.plate2Vh.isNotEmpty && scope.provcode.isNotEmpty && scope.vhtype.isNotEmpty;
          scope.hasInputPlateProv = scope.proviceTc.isNotEmpty &&
              scope.intitialNo.isNotEmpty &&
              scope.number.isNotEmpty &&
              scope.vhtype.isNotEmpty;
          scope.hasInputNumBody =
              scope.numbody.isNotEmpty && scope.brncode.isNotEmpty;
          scope.hasInputPlateTicket = (scope.plate1Tf.isNotEmpty &&
                  scope.plate2Tf.isNotEmpty &&
                  scope.plate3Tf.isNotEmpty) ||
              scope.ticketId.isNotEmpty;
          //scope.hasInputPlate = scope.intitialNo.isNotEmpty && scope.number.isNotEmpty && scope.provcode.isNotEmpty;
          scope.hasInputLicenseNumber = scope.licensenumber.isNotEmpty;

          isEnableButton = favoriteDto.choices != null &&
              favoriteDto.choices!.length > 0 &&
              (scope.hasInputFullNoPlate ||
                  scope.hasInputFullEngineNo ||
                  scope.hasInputPlateProv ||
                  scope.hasInputNumBody ||
                  scope.hasInputPlateTicket ||
                  scope.hasInputLicenseNumber);
        }
        break;
      case AppConstant.kSearchWeapon:
        {}
        break;
      case AppConstant.kSearchInfo:
        {
          scope.hasInputFullcaseNo = scope.orgCode.isNotEmpty &&
              scope.crimeCaseYear.isNotEmpty &&
              scope.crimeCaseNo.isNotEmpty;

          isEnableButton = favoriteDto.choices != null &&
              favoriteDto.choices!.length > 0 &&
              scope.hasInputFullcaseNo;
        }
        break;
      case AppConstant.kSearchFirm:
        {}
        break;
      case AppConstant.kSearchAsset:
        {}
        break;
    }
  }

  @action
  void setType(String type) {
    scope.resetAllInput();

    searchType = type;
    switch (searchType) {
      case AppConstant.kSearchPerson:
        {
          // ------------ INNER --------------
          if (userDto!.roleSearchInternal!.flagPersonSs!) {
            scope.showInputPid = true;
            scope.showInputPasId = true;
            scope.showInputNames = true;
          }
          if (userDto!.roleSearchInternal!.flagPersonTc!) {
            scope.showInputPid = true;
            scope.showInputPasId = true;
            scope.showInputNames = true;
          }
          if (userDto!.roleSearchInternal!.flagPersonWr!) {
            scope.showInputPid = true;
            scope.showInputNames = true;
          }

          // ------------ OUTER --------------
          if (userDto!.roleSearchExternal!.flagPersonDopa!) {
            scope.showInputPid = true;
            scope.showInputNames = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonDoe!) {
            scope.showInputWorkerId = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonDopaLinkage!) {
            scope.showInputPid = true;
            scope.showInputNames = true;
            scope.showInputGunReg = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonDlt!) {
            scope.showInputPid = true;
            scope.showInputNames = true;
            scope.showInputPidPlt1 = true;
            scope.showInputNamesPlt1 = true;
            scope.showInputPidPlt2 = true;
            scope.showInputNamesPlt2 = true;
            scope.showInputPassportNo = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonSso!) {
            scope.showInputPid = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonNhso!) {
            scope.showInputPid = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonTm!) {
            scope.showInputPid = true;
            scope.showInputNames = true;
            scope.showInputPassportNo = true;
            scope.showInputAlienNo = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonPtm!) {
            scope.showInputPid = true;
            scope.showInputNames = true;
          }
          if (userDto!.roleSearchExternal!.flagPersonGun!) {
            scope.showInputPid = true;
          }

          // scope.showInputCrimes = true;
          // scope.showInputCivil = true;
          // scope.showInputForeign = true;
          // scope.showInputCar = true;
          // scope.showInputSocial = true;
          // scope.showInputImmigration = true;
        }
        break;
      case AppConstant.kSearchCar:
        {
          // ------------ INNER --------------
          if (userDto!.roleSearchInternal!.flagVehicleCc!) {
            scope.showInputFullNoPlate = true;
            scope.showInputFullEngineNo = true;
            scope.showInputLicenseNumber = true;
          }
          if (userDto!.roleSearchInternal!.flagVehicleTc!) {
            scope.showInputFullNoPlate = true;
            scope.showInputFullEngineNo = true;
          }

          // ------------ OUTER --------------
          if (userDto!.roleSearchExternal!.flagVerhicleDlt!) {
            scope.showInputPlateProv = true;
            scope.showInputNumBody = true;
          }
          if (userDto!.roleSearchExternal!.flagVerhiclePtm!) {
            scope.showInputPlateTicket = true;
          }

          // scope.showInputTraffic = true;
        }
        break;
      case AppConstant.kSearchWeapon:
        {}
        break;
      case AppConstant.kSearchInfo:
        {
          // ------------ INNER --------------
          if (userDto!.roleSearchInternal!.flagCrimecase! ||
              userDto!.roleSearchInternal!.flagPersonSs! ||
              userDto!.roleSearchInternal!.flagTrafficcase! ||
              userDto!.roleSearchInternal!.flagPersonTc! ||
              userDto!.roleSearchInternal!.flagVehicleCc! ||
              userDto!.roleSearchInternal!.flagVehicleTc!) {
            scope.showInputFullcaseNo = true;
          }
        }
        break;
      case AppConstant.kSearchFirm:
        {}
        break;
      case AppConstant.kSearchAsset:
        {}
        break;
    }

    _refreshEditFavorite();
  }

  void _refreshEditFavorite() {
    final choices = favoriteDto.choices != null ? favoriteDto.choices : [];
    final mockValue = '1234567890123';
    for (int i = 0; i < choices!.length; i++) {
      final value = choices[i];
      switch (value) {
        case AppConstant.showFormIdCard:
          scope.pid = mockValue;
          break;
        case AppConstant.showFormFirstName:
          scope.firstName = mockValue;
          break;
        case AppConstant.showFormLastName:
          scope.lastName = mockValue;
          break;
        case AppConstant.showFormWorkerId:
          scope.workerId = mockValue;
          break;
        case AppConstant.showFormPasId:
          scope.pasId = mockValue;
          break;
        case AppConstant.showFormNation:
          scope.nation = mockValue;
          break;
        case AppConstant.showFormGunReg:
          scope.gunReg = mockValue;
          break;
        case AppConstant.showFormAlienNo:
          scope.alienNo = mockValue;
          break;
        case AppConstant.showFormProviceTc:
          scope.proviceTc = mockValue;
          break;
        case AppConstant.showFormIntitialNo:
          scope.intitialNo = mockValue;
          break;
        case AppConstant.showFormNumber:
          scope.number = mockValue;
          break;
        case AppConstant.showFormStatus:
          scope.status = mockValue;
          break;
        case AppConstant.showFormEngineNo:
          scope.engineNo = mockValue;
          break;
        case AppConstant.showFormPltcode1:
          scope.pltcode1 = mockValue;
          break;
        case AppConstant.showFormPltcode2:
          scope.pltcode2 = mockValue;
          break;
        case AppConstant.showFormPlate1Vh:
          scope.plate1Vh = mockValue;
          break;
        case AppConstant.showFormPlate2Vh:
          scope.plate2Vh = mockValue;
          break;
        case AppConstant.showFormProvcode:
          scope.provcode = mockValue;
          break;
        case AppConstant.showFormVhtype:
          scope.vhtype = mockValue;
          break;
        case AppConstant.showFormNumbody:
          scope.numbody = mockValue;
          break;
        case AppConstant.showFormBrncode:
          scope.brncode = mockValue;
          break;
        case AppConstant.showFormLicenseNumber:
          scope.licensenumber = mockValue;
          break;
        case AppConstant.showFormTicketId:
          scope.ticketId = mockValue;
          break;
        case AppConstant.showFormOrgCode:
          scope.orgCode = mockValue;
          break;
        case AppConstant.showFormCrimeCaseYear:
          scope.crimeCaseYear = mockValue;
          break;
        case AppConstant.showFormCrimeCaseNo:
          scope.crimeCaseNo = mockValue;
          break;
      }
    }
    _refreshEnableButton();
  }

  @action
  void selectItem(String value) {
    String mockValue = '';
    if (favoriteDto.choices != null && favoriteDto.choices!.contains(value)) {
      favoriteDto.choices!.remove(value);
      mockValue = '';
    } else {
      if (favoriteDto.choices != null) favoriteDto.choices!.add(value);
      mockValue = '1234567890123';
    }

    switch (value) {
      case AppConstant.showFormIdCard:
        scope.pid = mockValue;
        break;
      case AppConstant.showFormFirstName:
        scope.firstName = mockValue;
        break;
      case AppConstant.showFormLastName:
        scope.lastName = mockValue;
        break;
      case AppConstant.showFormWorkerId:
        scope.workerId = mockValue;
        break;
      case AppConstant.showFormPasId:
        scope.pasId = mockValue;
        break;
      case AppConstant.showFormNation:
        scope.nation = mockValue;
        break;
      case AppConstant.showFormGunReg:
        scope.gunReg = mockValue;
        break;
      case AppConstant.showFormAlienNo:
        scope.alienNo = mockValue;
        break;
      case AppConstant.showFormProviceTc:
        scope.proviceTc = mockValue;
        break;
      case AppConstant.showFormIntitialNo:
        scope.intitialNo = mockValue;
        break;
      case AppConstant.showFormNumber:
        scope.number = mockValue;
        break;
      case AppConstant.showFormStatus:
        scope.status = mockValue;
        break;
      case AppConstant.showFormEngineNo:
        scope.engineNo = mockValue;
        break;
      case AppConstant.showFormPltcode1:
        scope.pltcode1 = mockValue;
        break;
      case AppConstant.showFormPltcode2:
        scope.pltcode2 = mockValue;
        break;
      case AppConstant.showFormPlate1Vh:
        scope.plate1Vh = mockValue;
        break;
      case AppConstant.showFormPlate2Vh:
        scope.plate2Vh = mockValue;
        break;
      case AppConstant.showFormProvcode:
        scope.provcode = mockValue;
        break;
      case AppConstant.showFormVhtype:
        scope.vhtype = mockValue;
        break;
      case AppConstant.showFormNumbody:
        scope.numbody = mockValue;
        break;
      case AppConstant.showFormBrncode:
        scope.brncode = mockValue;
        break;
      case AppConstant.showFormLicenseNumber:
        scope.licensenumber = mockValue;
        break;
      case AppConstant.showFormTicketId:
        scope.ticketId = mockValue;
        break;
      case AppConstant.showFormOrgCode:
        scope.orgCode = mockValue;
        break;
      case AppConstant.showFormCrimeCaseYear:
        scope.crimeCaseYear = mockValue;
        break;
      case AppConstant.showFormCrimeCaseNo:
        scope.crimeCaseNo = mockValue;
        break;
    }

    _refreshEnableButton();
  }

  // ---------- COMMON ----------

  @observable
  ActionStatus status = ActionStatus.idle;
  @observable
  String errorTitle = '';
  @observable
  String? errorMessage = '';
  @observable
  bool showError = false;

  bool openLogin = false;
  bool openWaitSMS = false;
  bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;
  bool openVerifyPin = false;

  @action
  void resetStatus() {
    status = ActionStatus.idle;
    showError = false;
  }

  Future<void> _handleException(Object obj) async {
    switch (obj.runtimeType) {
      case DioError:
        final type = (obj as DioError).type;
        if (type == DioErrorType.connectionTimeout) {
          showError = true;
          errorTitle = AppMessage.error;
          errorMessage = AppMessage.connectedTimeout;
        } else {
          final response = (obj as DioError).response;
          final statusCode = response!.statusCode!;

          if (statusCode >= 400 && statusCode < 500) {
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
            }
          } else {
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
