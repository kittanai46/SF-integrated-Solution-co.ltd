import 'dart:convert';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/database.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';

part 'favorite_db_screen_view_model.g.dart';


class FavoriteDBScreenViewModel = FavoriteDBScreenViewModelBase with _$FavoriteDBScreenViewModel;

abstract class FavoriteDBScreenViewModelBase with Store {

  final int MAXIMUM = 4;

  @observable bool isEnableButton = false;
  @observable List<Database> innerDbs = [];
  @observable List<Database> outerDbs = [];
  @observable List<Database> selectDbArray = [];  // user เลือกฐานข้อมูลอะไรบ้าง
  @observable FavoriteDto favoriteDto = FavoriteDto();

  String? searchType;
  UserDto? userDto;
  ParamScope? paramScope;

  FavoriteDBScreenViewModelBase(){
  }

  // @computed
  // bool get isEnableButton => _isInputValid();
  void _refreshEnableButton() {
    isEnableButton = selectDbArray.length > 0;
  }

  @action
  void clearAll(){
    innerDbs = [];
    outerDbs = [];
    selectDbArray = [];
  }

  @action
  void confirmDB(){
    if(paramScope == null) return;

    List<String> inners = [];
    List<String> outers = [];

    for (int i = 0; i < selectDbArray.length; i++) {
      Database database = selectDbArray[i];
      final category = database.category;
      if(category == AppConstant.dbInnerPersonHasAya ||
          category == AppConstant.dbInnerPersonDoAya ||
          //category == AppConstant.dbInnerPersonHasTraffic ||
          category == AppConstant.dbInnerPersonDoTraffic ||
          category == AppConstant.dbInnerPersonWarrantCRD ||
          category == AppConstant.dbInnerPersonWarrantCourtCRD ||
          category == AppConstant.dbInnerPersonRedNotice ||
          category == AppConstant.dbInnerPersonFaceRec ||
          category == AppConstant.dbInnerCarAya ||
          category == AppConstant.dbInnerCarLost ||
          category == AppConstant.dbInnerCarWanted ||
          category == AppConstant.dbInnerCarTraffic ||
          category == AppConstant.dbInnerCarEmergency ||
          category == AppConstant.dbInnerInfoAya ||
          category == AppConstant.dbInnerInfoPersonSS ||
          category == AppConstant.dbInnerInfoTraffic ||
          category == AppConstant.dbInnerInfoPersonTC ||
          category == AppConstant.dbInnerInfoVehicleCc ||
          category == AppConstant.dbInnerInfoVehicleTc)
      {
        inners.add(category!);
      }else{
        outers.add(category!);
      }
    }

    favoriteDto.innerDbs = inners;
    favoriteDto.outerDbs = outers;
  }

  @action
  void getListDB() {
    innerDbs = [];
    outerDbs = [];

    _refreshSelectDbByFavorite();

    AllDatabase allDatabase = ApiClient().getListDB(searchType!, userDto!, paramScope!, true);

    List<Database> newInnerDbs = allDatabase.innerDbs!;


    if(newInnerDbs==null) newInnerDbs = [];

    for(int i=0; i<newInnerDbs.length; i++){
      Database newDbModel = newInnerDbs[i];
      bool found = false;
      for(int j=0; j<selectDbArray.length; j++){
        if(selectDbArray[j].category == newDbModel.category){
          found = true;
          break;
        }
      }
      newDbModel.checked = found;
      innerDbs.add(newDbModel);
    }

    List<Database> newOuterDbs = allDatabase.outerDbs!;
    if(newOuterDbs==null) newOuterDbs = [];

    for(int i=0; i<newOuterDbs.length; i++){
      Database newDbModel = newOuterDbs[i];
      bool found = false;
      for(int j=0; j<selectDbArray.length; j++){
        if(selectDbArray[j].category == newDbModel.category){
          found = true;
          break;
        }
      }
      newDbModel.checked = found;
      outerDbs.add(newDbModel);
    }

    StringUtils.log("-->>> search db innerDbs: ${innerDbs.length}");
    StringUtils.log("-->>> search db outerDbs: ${outerDbs.length}");
  }

  void _refreshSelectDbByFavorite(){
    selectDbArray.clear();
    for(int i=0; i<favoriteDto.innerDbs!.length; i++){
      String category = favoriteDto.innerDbs![i];
      String title = '';
      switch(category){
        case AppConstant.dbInnerPersonDoAya: title = AppConstant.msInnerPersonDoAya; break;
        case AppConstant.dbInnerPersonDoTraffic: title = AppConstant.msInnerPersonDoTraffic; break;
        case AppConstant.dbInnerPersonHasAya: title = AppConstant.msInnerPersonHasAya; break;
        // case AppConstant.dbInnerPersonHasTraffic: title = AppConstant.msInnerPersonHasTraffic; break;
        case AppConstant.dbInnerPersonWarrantCRD: title = AppConstant.msInnerPersonWarrantCRD; break;
        case AppConstant.dbInnerPersonWarrantCourtCRD: title = AppConstant.msInnerPersonWarrantCourtCRD; break;
        case AppConstant.dbInnerPersonRedNotice: title = AppConstant.msInnerPersonRedNotice; break;
        case AppConstant.dbInnerPersonFaceRec: title = AppConstant.msInnerPersonFaceRec; break;

        case AppConstant.dbInnerCarAya: title = AppConstant.msInnerCarAya; break;
        case AppConstant.dbInnerCarLost: title = AppConstant.msInnerCarLost; break;
        // case AppConstant.dbInnerCarWanted: title = AppConstant.msInnerCarWanted; break;
        case AppConstant.dbInnerCarTraffic: title = AppConstant.msInnerCarTraffic; break;
        case AppConstant.dbInnerCarEmergency: title = AppConstant.msInnerCarEmergency; break;

        case AppConstant.dbInnerInfoAya: title = AppConstant.msInnerInfoAya; break;
        case AppConstant.dbInnerInfoPersonSS: title = AppConstant.msInnerInfoPersonSS; break;
        case AppConstant.dbInnerInfoTraffic: title = AppConstant.msInnerInfoTraffic; break;
        case AppConstant.dbInnerInfoPersonTC: title = AppConstant.msInnerInfoPersonTC; break;
        case AppConstant.dbInnerInfoVehicleCc: title = AppConstant.msInnerInfoVehicleCc; break;
        case AppConstant.dbInnerInfoVehicleTc: title = AppConstant.msInnerInfoVehicleTc; break;
      }
      final db = Database(title: title, category: category, checked: true);
      selectDbArray.add(db);
    }
    for(int i=0; i<favoriteDto.outerDbs!.length; i++){
      String category = favoriteDto.outerDbs![i];
      String title = '';
      switch(category){
        case AppConstant.dbOuterPersonLinkage: title = AppConstant.msOuterPersonLinkage; break;
        case AppConstant.dbOuterPersonCivil: title = AppConstant.msOuterPersonCivil; break;
        case AppConstant.dbOuterPersonForeign: title = AppConstant.msOuterPersonForeign; break;
        case AppConstant.dbOuterPersonCarLicense: title = AppConstant.msOuterPersonCarLicense; break;
        case AppConstant.dbOuterPersonBusLicense: title = AppConstant.msOuterPersonBusLicense; break;
        case AppConstant.dbOuterPersonCar: title = AppConstant.msOuterPersonCar; break;
        case AppConstant.dbOuterPersonSocialEmployee: title = AppConstant.msOuterPersonSocialEmployee; break;
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

        case AppConstant.dbOuterCarCar: title = AppConstant.msOuterCarCar; break;
        case AppConstant.dbOuterCarTraffic: title = AppConstant.msOuterCarTraffic; break;
      }
      final db = Database(title: title, category: category, checked: true);
      selectDbArray.add(db);
    }

    _refreshEnableButton();
  }

  @action
  void selectItem(int index, bool isInnerDb){
    if(isInnerDb){
      final db = innerDbs[index];
      bool isAdd = !db.checked;
      String? dbName = db.title;
      if(isAdd){
        //Check maximum
        if(selectDbArray.length < MAXIMUM){
          selectDbArray.add(db);
          innerDbs[index].checked = isAdd;
        }
      }else {
        int foundIndex = -1;
        for(int i=0; i<selectDbArray.length; i++) {
          String? oldDbName = selectDbArray[i].title;
          if(oldDbName == dbName){
            foundIndex = i;
            break;
          }
        }
        selectDbArray.removeAt(foundIndex);
        innerDbs[index].checked = isAdd;
      }
    }else {
      final db = outerDbs[index];
      bool isAdd = !db.checked;
      String? dbName = db.title;

      StringUtils.log("---> outerDbs.length: ${outerDbs.length}");
      StringUtils.log("---> index: ${index}");
      StringUtils.log("---> dbName: ${dbName}");

      if(isAdd){
        //Check maximum
        if(selectDbArray.length < MAXIMUM){
          selectDbArray.add(db);
          outerDbs[index].checked = isAdd;
        }
      }else {
        int foundIndex = -1;
        for(int i=0; i<selectDbArray.length; i++) {
          String? oldDbName = selectDbArray[i].title;

          if(oldDbName == dbName){
            foundIndex = i;
            break;
          }
        }
        StringUtils.log("---> selectDbArray: ${selectDbArray}");
        StringUtils.log("---> foundIndex: ${foundIndex}");

        selectDbArray.removeAt(foundIndex);
        outerDbs[index].checked = isAdd;
      }
    }

    _refreshEnableButton();
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