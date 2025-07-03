import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';

part 'favorite_title_screen_view_model.g.dart';


class FavoriteTitleScreenViewModel = FavoriteTitleScreenViewModelBase with _$FavoriteTitleScreenViewModel;

abstract class FavoriteTitleScreenViewModelBase with Store {

  @observable bool isEnableButton = false;
  @observable List<String> titleDBs = [];

  UserDto? userDto;
  FavoriteDto favoriteDto = FavoriteDto();
  int editIndex = -1;

  FavoriteTitleScreenViewModelBase(){
  }

  // @computed
  // bool get isEnableButton => _isInputValid();
  void _refreshEnableButton() {
    isEnableButton = favoriteDto.title!=null && favoriteDto.title!.length > 0;
  }

  @action
  void setTitle(String title) {
    favoriteDto.title = title;
    _refreshEnableButton();
  }

  @action
  void setFavorite(FavoriteDto favorite){
    favoriteDto = favorite;

    List<String> innerDbs = favoriteDto.innerDbs!=null ? favoriteDto.innerDbs!:[];
    List<String> outerDbs = favoriteDto.outerDbs!=null ? favoriteDto.outerDbs!:[];

    titleDBs.clear();
    for(int i=0; i<innerDbs.length; i++){
      String title = _getDBTitle(innerDbs[i]);
      titleDBs.add(title);
    }
    for(int i=0; i<outerDbs.length; i++){
      String title = _getDBTitle(outerDbs[i]);
      titleDBs.add(title);
    }
  }

  String _getDBTitle(String dbName) {
    String title = "";
    switch(dbName) {

    // Person Inner
      case AppConstant.dbInnerPersonHasAya: title = AppConstant.msInnerPersonHasAya; break;
      case AppConstant.dbInnerPersonDoAya: title = AppConstant.msInnerPersonDoAya; break;
      // case AppConstant.dbInnerPersonHasTraffic: title = AppConstant.msInnerPersonHasTraffic; break;
      case AppConstant.dbInnerPersonDoTraffic: title = AppConstant.msInnerPersonDoTraffic; break;
      case AppConstant.dbInnerPersonWarrantCRD: title = AppConstant.msInnerPersonWarrantCRD; break;
      case AppConstant.dbInnerPersonWarrantCourtCRD: title = AppConstant.msInnerPersonWarrantCourtCRD; break;
      case AppConstant.dbInnerPersonRedNotice: title = AppConstant.msInnerPersonRedNotice; break;
      case AppConstant.dbInnerPersonFaceRec: title = AppConstant.msInnerPersonFaceRec; break;

    // Person Outer
      case AppConstant.dbOuterPersonLinkage: title = AppConstant.msOuterPersonLinkage; break;
      case AppConstant.dbOuterPersonCivil: title = AppConstant.msOuterPersonCivil; break;
      case AppConstant.dbOuterPersonForeign: title = AppConstant.msOuterPersonForeign; break;
      case AppConstant.dbOuterPersonCarLicense: title = AppConstant.msOuterPersonCarLicense; break;
      case AppConstant.dbOuterPersonBusLicense: title = AppConstant.msOuterPersonBusLicense; break;
      case AppConstant.dbOuterPersonCar: title = AppConstant.msOuterPersonCar; break;
      case AppConstant.dbOuterPersonSocialEmployee: title = AppConstant.msOuterPersonSocialEmployee; break;
      case AppConstant.dbOuterPersonSocialHospital: title = AppConstant.msOuterPersonSocialHospital; break;
      case AppConstant.dbOuterPersonSocialEmployer: title = AppConstant.msOuterPersonSocialEmployer; break;
      case AppConstant.dbOuterPersonHealth: title = AppConstant.msOuterPersonHealth; break;
      case AppConstant.dbOuterPersonImmigration: title = AppConstant.msOuterPersonImmigration; break;
      case AppConstant.dbOuterPersonExtension: title = AppConstant.msOuterPersonExtension; break;
      case AppConstant.dbOuterPersonForeignHouse: title = AppConstant.msOuterPersonForeignHouse; break;
      case AppConstant.dbOuterPersonTraffic: title = AppConstant.msOuterPersonTraffic; break;
      case AppConstant.dbOuterPersonP4: title = AppConstant.msOuterPersonP4; break;
      case AppConstant.dbOuterPersonPrisoner: title = AppConstant.msOuterPersonPrisoner; break;
      case AppConstant.dbOuterPersonAlien: title = AppConstant.msOuterPersonAlien; break;
      case AppConstant.dbOuterPersonWorker: title = AppConstant.msOuterPersonWorker; break;
      case AppConstant.dbOuterPersonNonThai: title = AppConstant.msOuterPersonNonThai; break;
      case AppConstant.dbOuterPersonNoRegis: title = AppConstant.msOuterPersonNoRegis; break;

    // Car Inner
      case AppConstant.dbInnerCarAya: title = AppConstant.msInnerCarAya; break;
      case AppConstant.dbInnerCarLost: title = AppConstant.msInnerCarLost; break;
      // case AppConstant.dbInnerCarWanted: title = AppConstant.msInnerCarWanted; break;
      case AppConstant.dbInnerCarTraffic: title = AppConstant.msInnerCarTraffic; break;
      case AppConstant.dbInnerCarEmergency: title = AppConstant.msInnerCarEmergency; break;
    // Car Outer
      case AppConstant.dbOuterCarCar: title = AppConstant.msOuterCarCar; break;
      case AppConstant.dbOuterCarTraffic: title = AppConstant.msOuterCarTraffic; break;

    // Info Inner
      case AppConstant.dbInnerInfoAya: title = AppConstant.msInnerInfoAya; break;
      case AppConstant.dbInnerInfoPersonSS: title = AppConstant.msInnerInfoPersonSS; break;
      case AppConstant.dbInnerInfoTraffic: title = AppConstant.msInnerInfoTraffic; break;
      case AppConstant.dbInnerInfoPersonTC: title = AppConstant.msInnerInfoPersonTC; break;
      case AppConstant.dbInnerInfoVehicleCc: title = AppConstant.msInnerInfoVehicleCc; break;
      case AppConstant.dbInnerInfoVehicleTc: title = AppConstant.msInnerInfoVehicleTc; break;

    }
    return title;
  }

  @action
  Future<void> requestAddFavorite() async {
    if(!isEnableButton) return;

    List<FavoriteDto> favoriteList = await KeyUtils.getFavoriteList();
    if(editIndex == -1){
      // Case: Add
      if(favoriteList.length == 10) return;

      favoriteList.add(favoriteDto);
    }else if(editIndex == -2){
      // Case: Edit default
      favoriteList[0] = favoriteDto;
    }else{
      // Case: Edit normal
      favoriteList[editIndex+1] = favoriteDto;
    }

    status = ActionStatus.inProgress;
    try {
      await ApiClient().updateFavorite(favoriteList);
      final _getUserResponse = await ApiClient().getUser();
      userDto = _getUserResponse.user;
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  // ---------- COMMON ----------

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