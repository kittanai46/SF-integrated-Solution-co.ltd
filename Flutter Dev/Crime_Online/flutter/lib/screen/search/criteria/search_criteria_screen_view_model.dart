import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/policestation_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:crimes/screen/search/param_scope.dart';

part 'search_criteria_screen_view_model.g.dart';

class SearchCriteriaScreenViewModel = SearchCriteriaScreenViewModelBase with _$SearchCriteriaScreenViewModel;

abstract class SearchCriteriaScreenViewModelBase with Store {

  SearchCriteriaScreenViewModelBase(){
  }
  
  UserDto? userDto;
  List<String> listPoliceStationName = [];
  List<String> listPoliceStationID = [];
  
  @observable String searchType = '';
  @observable String title = '';
  @observable ParamScope scope = ParamScope();
  @observable FavoriteDto favoriteDto = FavoriteDto();

  @action
  void setType(String type) {
    scope.resetAllInput();

    searchType = type;
    switch (searchType) {
      case AppConstant.kSearchPerson: {
        title = AppMessage.searchPerson;

        // ------------ INNER --------------
        if(userDto!=null && userDto!.roleSearchInternal!.flagPersonSs!){
          scope.showInputPid = true;
          scope.showInputPasId = true;
          scope.showInputNames = true;
        }
        if(userDto!=null && userDto!.roleSearchInternal!.flagPersonTc!){
          scope.showInputPid = true;
          scope.showInputPasId = true;
          scope.showInputNames = true;
        }
        if(userDto!=null && userDto!.roleSearchInternal!.flagPersonWr!){
          scope.showInputPid = true;
          scope.showInputNames = true;
        }

        // ------------ OUTER --------------
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonDopa!){
          scope.showInputPid = true;
          scope.showInputNames = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonDoe!){
          scope.showInputWorkerId = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonDopaLinkage!){
          scope.showInputPid = true;
          scope.showInputNames = true;
          scope.showInputGunReg = true;

        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonDlt!){
          scope.showInputPid = true;
          scope.showInputNames = true;
          scope.showInputPidPlt1 = true;
          scope.showInputNamesPlt1 = true;
          scope.showInputPidPlt2 = true;
          scope.showInputNamesPlt2 = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonSso!){
          scope.showInputPid = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonNhso!){
          scope.showInputPid = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonTm!){
          scope.showInputPid = true;
          scope.showInputNames = true;
          scope.showInputPassportNo = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonPtm!){
          scope.showInputPid = true;
          scope.showInputNames = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagPersonGun!){
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
      case AppConstant.kSearchCar: {
        title = AppMessage.searchCar;

        // ------------ INNER --------------
        if(userDto!=null && userDto!.roleSearchInternal!.flagVehicleCc!){
          scope.showInputFullNoPlate = true;
          scope.showInputFullEngineNo = true;
          scope.showInputLicenseNumber = true;
        }
        if(userDto!=null && userDto!.roleSearchInternal!.flagVehicleTc!){
          scope.showInputFullNoPlate = true;
          scope.showInputFullEngineNo = true;
        }

        // ------------ OUTER --------------
        if(userDto!=null && userDto!.roleSearchExternal!.flagVerhicleDlt!){
          scope.showInputPlateProv = true;
          scope.showInputNumBody = true;
        }
        if(userDto!=null && userDto!.roleSearchExternal!.flagVerhiclePtm!){
          scope.showInputPlateTicket = true;
        }

        // scope.showInputTraffic = true;
      }
        break;
      case AppConstant.kSearchWeapon: {
        title = AppMessage.searchWeapon;
      }
        break;
      case AppConstant.kSearchInfo: {
        title = AppMessage.searchInfo;

        // ------------ INNER --------------
        if(userDto!=null && (userDto!.roleSearchInternal!.flagCrimecase!
            || userDto!.roleSearchInternal!.flagPersonSs!
            || userDto!.roleSearchInternal!.flagTrafficcase!
            || userDto!.roleSearchInternal!.flagPersonTc!
            || userDto!.roleSearchInternal!.flagVehicleCc!
            || userDto!.roleSearchInternal!.flagVehicleTc!)
        ){
          scope.showInputFullcaseNo = true;
        }

      }
        break;
      case AppConstant.kSearchFirm: {
        title = AppMessage.searchDBD;
      }
        break;
      case AppConstant.kSearchAsset: {
        title = AppMessage.searchAsset;
      }
        break;
    }
  }

  // TODO: Must check which params has complied to any API
  @observable bool isEnableButton = false;
  @action
  void refreshEnableButton() {

    isEnableButton = false;
    switch (searchType) {
      case AppConstant.kSearchPerson: {

        scope.hasInputPid = (scope.pid.isNotEmpty && scope.pid.length==13);
        scope.hasInputPasId = scope.pasId.isNotEmpty && scope.nation.isNotEmpty;
        scope.hasInputNames = (scope.firstName.isNotEmpty && scope.lastName.isNotEmpty);
        scope.hasInputWorkerId = scope.workerId.isNotEmpty;
        scope.hasInputPassportNo = scope.passportNo.isNotEmpty;
        // scope.hasInputPidPlt1 = (scope.pid.isNotEmpty && scope.pid.length==13)  && scope.pltcode1.isNotEmpty;
        scope.hasInputPidPlt1 = (scope.pid.isNotEmpty && scope.pid.length==13);
        scope.hasInputNamesPlt1 = (scope.firstName.isNotEmpty && scope.lastName.isNotEmpty)  && scope.pltcode1.isNotEmpty;
        // scope.hasInputPidPlt2 = (scope.pid.isNotEmpty && scope.pid.length==13)  && scope.pltcode2.isNotEmpty;
        scope.hasInputPidPlt2 = (scope.pid.isNotEmpty && scope.pid.length==13);
        scope.hasInputNamesPlt2 = (scope.firstName.isNotEmpty && scope.lastName.isNotEmpty)  && scope.pltcode2.isNotEmpty;

        scope.hasInputImg = (scope.base64Image?.isNotEmpty ?? false);

        StringUtils.log("scope.hasInputPid :"+scope.hasInputPid.toString());
        StringUtils.log("scope.hasInputImg :"+scope.hasInputImg.toString());
        // StringUtils.log("scope.base64Image :"+ scope.base64Image.toString());

        scope.hasInputGunReg = scope.gunReg.isNotEmpty;

        StringUtils.log("scope.hasInputGunReg :"+scope.gunReg.toString());

        isEnableButton = scope.hasInputPid || scope.hasInputPasId || scope.hasInputNames || scope.hasInputWorkerId || scope.hasInputPassportNo || scope.hasInputPidPlt1 || scope.hasInputNamesPlt1 || scope.hasInputPidPlt2 || scope.hasInputNamesPlt2 || scope.hasInputImg || scope.hasInputGunReg;

      }
      break;
      case AppConstant.kSearchCar: {

        scope.hasInputFullNoPlate = scope.proviceTc.isNotEmpty && scope.intitialNo.isNotEmpty && scope.number.isNotEmpty; //&& scope.status.isNotEmpty;
        scope.hasInputFullEngineNo = scope.engineNo.isNotEmpty;// && scope.status.isNotEmpty;
        scope.hasInputPlateProv = scope.plate1Vh.isNotEmpty && scope.plate2Vh.isNotEmpty && scope.provcode.isNotEmpty && scope.vhtype.isNotEmpty;
        scope.hasInputNumBody = scope.numbody.isNotEmpty && scope.brncode.isNotEmpty;
        scope.hasInputPlateTicket = (scope.plate1Tf.isNotEmpty && scope.plate2Tf.isNotEmpty && scope.plate3Tf.isNotEmpty) || scope.ticketId.isNotEmpty;
        scope.hasInputPlate = scope.plate1Vh.isNotEmpty && scope.plate2Vh.isNotEmpty && scope.provcode.isNotEmpty;
        scope.hasInputLicenseNumber = scope.licensenumber.isNotEmpty;

        isEnableButton = scope.hasInputFullNoPlate || scope.hasInputFullEngineNo || scope.hasInputPlateProv || scope.hasInputNumBody || scope.hasInputPlateTicket || scope.hasInputPlate || scope.hasInputLicenseNumber;
      }
      break;
      case AppConstant.kSearchWeapon: {

      }
      break;
      case AppConstant.kSearchInfo: {
        scope.hasInputFullcaseNo = scope.orgCode.isNotEmpty && scope.crimeCaseYear.isNotEmpty && scope.crimeCaseNo.isNotEmpty;

        isEnableButton = scope.hasInputFullcaseNo;
      }
      break;
      case AppConstant.kSearchFirm: {

      }
      break;
      case AppConstant.kSearchAsset: {

      }
      break;
    }
  }


  // --- Setters ---

  // Common
  @action
  void setPid(String _pid) {
    scope.pid = _pid;
    refreshEnableButton();
  }
  @action
  void setFirstName(String _firstName) {
    scope.firstName = _firstName;
    refreshEnableButton();
  }
  @action
  void setLastName(String _lastName) {
    scope.lastName = _lastName;
    refreshEnableButton();
  }

  // Crimecase, Trafficcase, Warrant
  @action
  void setOrgCode(String _orgCode) {
    scope.orgCode = _orgCode;
    refreshEnableButton();
  }
  @action
  void setCrimeCaseYear(String _crimeCaseYear) {
    scope.crimeCaseYear = _crimeCaseYear;
    refreshEnableButton();
  }
  @action
  void setCrimeCaseNo(String _crimeCaseNo) {
    scope.crimeCaseNo = _crimeCaseNo;
    refreshEnableButton();
  }
  @action
  void setPasId(String _pasId) {
    scope.pasId = _pasId;
    scope.passportNo = _pasId;
    refreshEnableButton();
  }
  @action
  void setNation(String _nation) {
    scope.nation = _nation;
    refreshEnableButton();
  }
  @action
  void setGunReg(String _gunReg) {
    scope.gunReg = _gunReg;
    refreshEnableButton();
  }
  @action
  void setProviceTc(String _proviceTc) {
    scope.proviceTc = _proviceTc;
    refreshEnableButton();
  }
  @action
  void setIntitialNo(String intitialNo) {
    scope.intitialNo = intitialNo;
    scope.plate1Tf = intitialNo;
    scope.plate1Vh = intitialNo;
    refreshEnableButton();
  }
  @action
  void setNumber(String number) {
    scope.number = number;
    scope.plate2Vh = number;
    scope.plate2Tf = number;
    refreshEnableButton();
  }
  @action
  void setStatus(String status) {
    scope.status = status;
    refreshEnableButton();
  }
  @action
  void setEngineNo(String engineNo) {
    scope.engineNo = engineNo;
    refreshEnableButton();
  }
  @action
  void setLicenseNumber(String licenseNumber) {
    scope.licensenumber = licenseNumber;
    refreshEnableButton();
  }
  @action
  void setProviceWr(String proviceWr) {
    scope.proviceWr = proviceWr;
    refreshEnableButton();
  }
  @action
  void setTambonWr(String tambonWr) {
    scope.tambonWr = tambonWr;
    refreshEnableButton();
  }
  @action
  void setAmphurWr(String amphurWr) {
    scope.amphurWr = amphurWr;
    refreshEnableButton();
  }
  @action
  void setCharge(String charge) {
    scope.charge = charge;
    refreshEnableButton();
  }
  @action
  void setCourt(String court) {
    scope.court = court;
    refreshEnableButton();
  }

  // Foreign
  @action
  void setWorkerId(String workerId) {
    scope.workerId = workerId;
    refreshEnableButton();
  }

  // Car
  @action
  void setPltcode1(String pltcode1) {
    scope.pltcode1 = pltcode1;
    refreshEnableButton();
  }
  @action
  void setPltcode2(String pltcode2) {
    scope.pltcode2 = pltcode2;
    refreshEnableButton();
  }
  @action
  void setPlate1Vh(String plate1Vh) {
    scope.plate1Vh = plate1Vh;
    scope.plate1Tf = plate1Vh;
    scope.intitialNo = plate1Vh;
    refreshEnableButton();
  }
  @action
  void setPlate2Vh(String plate2Vh) {
    scope.plate2Vh = plate2Vh;
    scope.plate2Tf = plate2Vh;
    scope.number=plate2Vh;
    refreshEnableButton();
  }
  @action
  void setProvcode(String provcode) {
    scope.provcode = provcode;
    scope.plate3Tf = provcode;
    refreshEnableButton();
  }
  @action
  void setVhtype(String vhtype) {
    scope.vhtype = vhtype;
    refreshEnableButton();
  }
  @action
  void setNumbody(String numbody) {
    scope.numbody = numbody;
    refreshEnableButton();
  }
  @action
  void setBrncode(String brncode) {
    scope.brncode = brncode;
    refreshEnableButton();
  }

  // Social
  @action
  void setAccno(String accno) {
    scope.accno = accno;
    refreshEnableButton();
  }
  @action
  void setAccbranch(String accbranch) {
    scope.accbranch = accbranch;
    refreshEnableButton();
  }

  // Immigration, ForeignHouse
  @action
  void setPassportNoo(String passportNo) {
    scope.passportNo = passportNo;
    scope.pasId = passportNo;
    refreshEnableButton();
  }
  @action
  void setTmrunno(String tmrunno) {
    scope.tmrunno = tmrunno;
    refreshEnableButton();
  }

  // Traffic
  @action
  void setPlate1Tf(String plate1Tf) {
    scope.plate1Tf = plate1Tf;
    scope.plate1Vh = plate1Tf;
    scope.intitialNo = plate1Tf;
    refreshEnableButton();
  }
  @action
  void setPlate2Tf(String plate2Tf) {
    scope.plate2Tf = plate2Tf;
    scope.plate2Vh = plate2Tf;
    scope.number = plate2Tf;
    refreshEnableButton();
  }
  @action
  void setPlate3Tf(String plate3Tf) {
    scope.plate3Tf = plate3Tf;
    scope.provcode = plate3Tf;
    refreshEnableButton();
  }
  @action
  void setTicketId(String ticketId) {
    scope.ticketId = ticketId;
    refreshEnableButton();
  }
  @action
  void setProvinceByIndex(int index) {
    scope.provcode = AppConstant.provCodeValues[index];
    scope.plate3Tf = AppConstant.provCodeValues[index];
    scope.proviceTc= AppConstant.proviceTcValues[index];
    refreshEnableButton();
  }

  void setPoliceStationList(ListPoliceStationDto listPol){
    listPoliceStationName = [];
    listPoliceStationID = [];
    for(int i = 0;i<listPol.data!.length;i++){
      listPoliceStationName.add(listPol.data!.elementAt(i).org_name!);
      listPoliceStationID.add(listPol.data!.elementAt(i).org_code!);
    }
  }

  // @observable
  String? base64Image;

  @action
  void setBase64Image(String? value) {
    base64Image = value;
    scope.base64Image = base64Image!;
    refreshEnableButton();
  }

  // ---------- COMMON ----------

  @observable ActionStatus screenStatus = ActionStatus.idle;
  @observable String errorTitle = '';
  @observable String? errorMessage = '';
  @observable bool showError = false;

  bool openLogin = false;
  bool openWaitSMS = false;
  bool openWaitAdmin = false;
  bool openRegisterPin = false;
  bool openRegisterBiometrics = false;
  bool openVerifyPin = false;

  @action
  void resetStatus() {
    screenStatus = ActionStatus.idle;
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
    screenStatus = ActionStatus.error;
  }

}
