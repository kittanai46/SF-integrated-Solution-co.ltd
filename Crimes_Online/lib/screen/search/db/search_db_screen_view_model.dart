import 'dart:convert';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/api_client.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/client/response/inner/crimecase/get_crimecase_person_response_dto.dart';
import 'package:crimes/data/client/response/inner/crimecase/get_crimecase_response_dto.dart';
import 'package:crimes/data/client/response/inner/crimecase/get_crimecase_vehicle_response_dto.dart';
import 'package:crimes/data/client/response/inner/emergencycar/emergency_car_response_dto.dart';
import 'package:crimes/data/client/response/inner/trafficcase/get_trafficcase_person_response_dto.dart';
import 'package:crimes/data/client/response/inner/trafficcase/get_trafficcase_response_dto.dart';
import 'package:crimes/data/client/response/inner/trafficcase/get_trafficcase_vehicle_response_dto.dart';
import 'package:crimes/data/client/response/inner/warrant/get_warrant_crd_response_dto.dart';
import 'package:crimes/data/client/response/outer/car/driver_license_info_response_dto.dart';
import 'package:crimes/data/client/response/outer/car/get_vehicle_info_response_dto.dart';
import 'package:crimes/data/client/response/inner/warrant/get_warrant_response_dto.dart';
import 'package:crimes/data/client/response/outer/cib/face_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/person_response_dto.dart';
import 'package:crimes/data/client/response/outer/foreign/worker_response_dto.dart';
import 'package:crimes/data/client/response/outer/foreignhouse/tm61_response_dto.dart';
import 'package:crimes/data/client/response/outer/health/health_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/imm_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/migwis_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/travel_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/alien_person_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/alien_worker_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/person_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/person_nonthai_response_dto.dart';
import 'package:crimes/data/client/response/outer/p4/gun_response_dto.dart';
import 'package:crimes/data/client/response/outer/prisoner/prisoner_response_dto.dart';
import 'package:crimes/data/client/response/outer/social/employer_response_dto.dart';
import 'package:crimes/data/client/response/outer/social/employment_response_dto.dart';
import 'package:crimes/data/client/response/outer/social/hospital_response_dto.dart';
import 'package:crimes/data/client/response/outer/traffic/ticket_response_dto.dart';
import 'package:crimes/data/client/response/outer/warrantcourt/get_warrantcourt_response_dto.dart';
import 'package:crimes/data/dto/inner/warrant/rednotice_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrant_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrantcrd_dto.dart';
import 'package:crimes/data/dto/outer/cib/face_dto.dart';
import 'package:crimes/data/dto/outer/civil/person_dto.dart';
import 'package:crimes/data/dto/outer/warrantcourt/warrantcourt_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/entity/database.dart';
import 'package:crimes/data/entity/group_result.dart';
import 'package:crimes/data/mapper/result_mapper.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/screen/search/db/search_db_screen.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gson/gson.dart';
import 'package:mobx/mobx.dart';
import 'package:crimes/screen/action_status.dart';
import 'package:geolocator/geolocator.dart';
import 'package:crimes/util/device_infomation_utils.dart';

import '../../../data/client/response/inner/warrant/get_rednotice_response_dto.dart';
import '../../../data/client/response/inner/warrant/get_warrantcourt_crd_response_dto.dart';
import '../../../data/client/response/outer/immigration/extension_response_dto.dart';
import '../../../data/client/response/outer/linkage/person_noregis_response_dto.dart';
import '../../../data/client/response/outer/rescue/car_ambulance_license_response_dto.dart';
import '../../../data/client/response/outer/rescue/car_flashing_light_license_response_dto.dart';
import '../../../data/client/response/outer/rescue/person_rescue_training_response_dto.dart';
import '../../../data/client/response/outer/rescue/person_rescue_volunteer_response_dto.dart';
import '../../../data/dto/inner/warrant/warrantcourtcrd_dto.dart';
import '../../../data/dto/outer/rescue/person_rescue_training_dto.dart';
import '../../../data/dto/outer/rescue/person_rescue_volunteer_dto.dart';

part 'search_db_screen_view_model.g.dart';

class SearchDBScreenViewModel = SearchDBScreenViewModelBase
    with _$SearchDBScreenViewModel;

abstract class SearchDBScreenViewModelBase with Store {
  final int MAXIMUM = 4;

  @observable
  String searchType = '';
  @observable
  String title = '';

  @observable
  bool isEnableFavButton = false;
  @observable
  bool isEnableButton = false;
  @observable
  List<Database> innerDbs = [];
  @observable
  List<Database> outerDbs = [];
  @observable
  List<Database> selectDbArray = []; // user เลือกฐานข้อมูลอะไรบ้าง
  @observable
  FavoriteDto favoriteDto = FavoriteDto();

  List<GroupResult> groupResultArray = [];
  UserDto? userDto;
  ParamScope paramScope = ParamScope();
  Position lastPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0); // initial with 0,0

  ApiClient _apiClient = ApiClient();
  SearchDBScreenViewModelBase() {}

  // @computed
  // bool get isEnableButton => _isInputValid();
  void _refreshEnableButton() {
    isEnableButton = selectDbArray.length > 0;
  }

  @action
  void clearAll() {
    innerDbs = [];
    outerDbs = [];
    selectDbArray = [];
  }

  @action
  void setType(String type) {
    searchType = type;
    switch (searchType) {
      case AppConstant.kSearchPerson:
        title = AppMessage.searchPerson;
        break;
      case AppConstant.kSearchCar:
        title = AppMessage.searchCar;
        break;
      case AppConstant.kSearchWeapon:
        title = AppMessage.searchWeapon;
        break;
      case AppConstant.kSearchInfo:
        title = AppMessage.searchInfo;
        break;
      case AppConstant.kSearchFirm:
        title = AppMessage.searchDBD;
        break;
      case AppConstant.kSearchAsset:
        title = AppMessage.searchAsset;
        break;
    }
  }

  @action
  Future<void> refreshCanAddFavorite() async {
    if (AppConstant.isMockUser) return;

    final favoriteList = await KeyUtils.getFavoriteList();
    isEnableFavButton = favoriteList.length < AppConstant.maxFavorite &&
        selectDbArray.length > 0;
  }

  @action
  Future<void> addFavorite(String title) async {
    if (paramScope == null) return;

    FavoriteDto newFavoriteDto = FavoriteDto();
    newFavoriteDto.title = title;
    newFavoriteDto.category = searchType;

    List<String> choices = [];
    List<String> inners = [];
    List<String> outers = [];

    if (paramScope.base64Image != null && paramScope.base64Image.isNotEmpty)
      choices.add(AppConstant.showFormImg);
    if (paramScope.pid != null && paramScope.pid.isNotEmpty)
      choices.add(AppConstant.showFormIdCard);
    if (paramScope.firstName != null && paramScope.firstName.isNotEmpty)
      choices.add(AppConstant.showFormFirstName);
    if (paramScope.lastName != null && paramScope.lastName.isNotEmpty)
      choices.add(AppConstant.showFormLastName);
    if (paramScope.workerId != null && paramScope.workerId.isNotEmpty)
      choices.add(AppConstant.showFormWorkerId);
    if ((paramScope.pasId != null && paramScope.pasId.isNotEmpty) ||
        (paramScope.passportNo != null && paramScope.passportNo.isNotEmpty))
      choices.add(AppConstant.showFormPasId);
    if (paramScope.nation != null && paramScope.nation.isNotEmpty)
      choices.add(AppConstant.showFormNation);
    if (paramScope.gunReg != null && paramScope.gunReg.isNotEmpty)
      choices.add(AppConstant.showFormGunReg);
    if (paramScope.proviceTc != null && paramScope.proviceTc.isNotEmpty)
      choices.add(AppConstant.showFormProviceTc);
    if (paramScope.intitialNo != null && paramScope.intitialNo.isNotEmpty)
      choices.add(AppConstant.showFormIntitialNo);
    if (paramScope.number != null && paramScope.number.isNotEmpty)
      choices.add(AppConstant.showFormNumber);
    if (paramScope.status != null && paramScope.status.isNotEmpty)
      choices.add(AppConstant.showFormStatus);
    if (paramScope.engineNo != null && paramScope.engineNo.isNotEmpty)
      choices.add(AppConstant.showFormEngineNo);
    if (paramScope.pltcode1 != null && paramScope.pltcode1.isNotEmpty)
      choices.add(AppConstant.showFormPltcode1);
    if (paramScope.pltcode2 != null && paramScope.pltcode2.isNotEmpty)
      choices.add(AppConstant.showFormPltcode2);
    if ((paramScope.plate1Vh != null && paramScope.plate1Vh.isNotEmpty) ||
        (paramScope.plate1Tf != null && paramScope.plate1Tf.isNotEmpty))
      choices.add(AppConstant.showFormPlate1Vh);
    if ((paramScope.plate2Vh != null && paramScope.plate2Vh.isNotEmpty) ||
        (paramScope.plate2Tf != null && paramScope.plate2Tf.isNotEmpty))
      choices.add(AppConstant.showFormPlate2Vh);
    if ((paramScope.provcode != null && paramScope.provcode.isNotEmpty) ||
        (paramScope.plate3Tf != null && paramScope.plate3Tf.isNotEmpty))
      choices.add(AppConstant.showFormProvcode);
    if (paramScope.vhtype != null && paramScope.vhtype.isNotEmpty)
      choices.add(AppConstant.showFormVhtype);
    if (paramScope.numbody != null && paramScope.numbody.isNotEmpty)
      choices.add(AppConstant.showFormNumbody);
    if (paramScope.brncode != null && paramScope.brncode.isNotEmpty)
      choices.add(AppConstant.showFormBrncode);
    if (paramScope.ticketId != null && paramScope.ticketId.isNotEmpty)
      choices.add(AppConstant.showFormTicketId);
    if (paramScope.orgCode != null && paramScope.orgCode.isNotEmpty)
      choices.add(AppConstant.showFormOrgCode);
    if (paramScope.crimeCaseYear != null && paramScope.crimeCaseYear.isNotEmpty)
      choices.add(AppConstant.showFormCrimeCaseYear);
    if (paramScope.crimeCaseNo != null && paramScope.crimeCaseNo.isNotEmpty)
      choices.add(AppConstant.showFormCrimeCaseNo);
    if (paramScope.licensenumber != null && paramScope.licensenumber.isNotEmpty)
      choices.add(AppConstant.showFormLicenseNumber);

    for (int i = 0; i < selectDbArray.length; i++) {
      Database database = selectDbArray[i];
      final category = database.category;
      if (category == AppConstant.dbInnerPersonHasAya ||
          category == AppConstant.dbInnerPersonDoAya ||
          // category == AppConstant.dbInnerPersonHasTraffic ||
          category == AppConstant.dbInnerPersonDoTraffic ||
          category == AppConstant.dbInnerPersonWarrantCRD ||
          category == AppConstant.dbInnerPersonWarrantCourtCRD ||
          category == AppConstant.dbInnerPersonRedNotice ||
          category == AppConstant.dbInnerPersonFaceRec ||
          category == AppConstant.dbInnerCarAya ||
          category == AppConstant.dbInnerCarTraffic ||
          category == AppConstant.dbInnerCarEmergency ||
          category == AppConstant.dbInnerInfoAya ||
          category == AppConstant.dbInnerInfoPersonSS ||
          category == AppConstant.dbInnerInfoTraffic ||
          category == AppConstant.dbInnerInfoPersonTC ||
          category == AppConstant.dbInnerInfoVehicleCc ||
          category == AppConstant.dbInnerInfoVehicleTc) {
        inners.add(category!);
      } else {
        outers.add(category!);
      }
    }

    newFavoriteDto.choices = choices;
    newFavoriteDto.innerDbs = inners;
    newFavoriteDto.outerDbs = outers;

    StringUtils.log("new favorite: ${jsonEncode(newFavoriteDto)}");
    await _requestAddFavorite(newFavoriteDto);
  }

  Future<void> _requestAddFavorite(FavoriteDto favoriteDto) async {
    List<FavoriteDto> favoriteList = await KeyUtils.getFavoriteList();
    if (favoriteList.length == 10) return;

    favoriteList.add(favoriteDto);
    status = ActionStatus.inProgress;
    try {
      await ApiClient().updateFavorite(favoriteList);
      final _getUserResponse = await ApiClient().getUser();
      userDto = _getUserResponse.user;
      await refreshCanAddFavorite();
      status = ActionStatus.success;
    } on Exception catch (obj) {
      await _handleException(obj);
    }
  }

  @action
  void getListDB() {
    innerDbs = [];
    outerDbs = [];

    _refreshSelectDbByFavorite();

    AllDatabase allDatabase =
        _apiClient.getListDB(searchType, userDto!, paramScope, false);

    List<Database> newInnerDbs = allDatabase.innerDbs!;

    if (newInnerDbs == null) newInnerDbs = [];

    for (int i = 0; i < newInnerDbs.length; i++) {
      Database newDbModel = newInnerDbs[i];
      bool found = false;
      for (int j = 0; j < selectDbArray.length; j++) {
        if (selectDbArray[j].category == newDbModel.category) {
          found = true;
          break;
        }
      }
      newDbModel.checked = found;
      innerDbs.add(newDbModel);
    }

    List<Database> newOuterDbs = allDatabase.outerDbs!;
    if (newOuterDbs == null) newOuterDbs = [];

    for (int i = 0; i < newOuterDbs.length; i++) {
      Database newDbModel = newOuterDbs[i];
      bool found = false;
      for (int j = 0; j < selectDbArray.length; j++) {
        if (selectDbArray[j].category == newDbModel.category) {
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

  void _refreshSelectDbByFavorite() {
    selectDbArray.clear();
    for (int i = 0; i < favoriteDto.innerDbs!.length; i++) {
      String category = favoriteDto.innerDbs![i];
      String title = '';
      switch (category) {
        case AppConstant.dbInnerPersonDoAya:
          title = AppConstant.msInnerPersonDoAya;
          break;
        case AppConstant.dbInnerPersonDoTraffic:
          title = AppConstant.msInnerPersonDoTraffic;
          break;
        case AppConstant.dbInnerPersonHasAya:
          title = AppConstant.msInnerPersonHasAya;
          break;
        // case AppConstant.dbInnerPersonHasTraffic: title = AppConstant.msInnerPersonHasTraffic; break;
        case AppConstant.dbInnerPersonWarrantCRD:
          title = AppConstant.msInnerPersonWarrantCRD;
          break;
        case AppConstant.dbInnerPersonWarrantCourtCRD:
          title = AppConstant.msInnerPersonWarrantCourtCRD;
          break;
        case AppConstant.dbInnerPersonRedNotice:
          title = AppConstant.msInnerPersonRedNotice;
          break;
        case AppConstant.dbInnerPersonFaceRec:
          title = AppConstant.msInnerPersonFaceRec;
          break;

        case AppConstant.dbInnerCarAya:
          title = AppConstant.msInnerCarAya;
          break;
        case AppConstant.dbInnerCarTraffic:
          title = AppConstant.msInnerCarTraffic;
          break;
        case AppConstant.dbInnerCarEmergency:
          title = AppConstant.msInnerCarEmergency;
          break;

        case AppConstant.dbInnerInfoAya:
          title = AppConstant.msInnerInfoAya;
          break;
        case AppConstant.dbInnerInfoPersonSS:
          title = AppConstant.msInnerInfoPersonSS;
          break;
        case AppConstant.dbInnerInfoTraffic:
          title = AppConstant.msInnerInfoTraffic;
          break;
        case AppConstant.dbInnerInfoPersonTC:
          title = AppConstant.msInnerInfoPersonTC;
          break;
        case AppConstant.dbInnerInfoVehicleCc:
          title = AppConstant.msInnerInfoVehicleCc;
          break;
        case AppConstant.dbInnerInfoVehicleTc:
          title = AppConstant.msInnerInfoVehicleTc;
          break;
      }
      final db = Database(title: title, category: category, checked: true);
      selectDbArray.add(db);
    }
    for (int i = 0; i < favoriteDto.outerDbs!.length; i++) {
      String category = favoriteDto.outerDbs![i];
      String title = '';
      switch (category) {
        case AppConstant.dbOuterPersonCivil:
          title = AppConstant.msOuterPersonCivil;
          break;
        case AppConstant.dbOuterPersonForeign:
          title = AppConstant.msOuterPersonForeign;
          break;
        case AppConstant.dbOuterPersonLinkage:
          title = AppConstant.msOuterPersonLinkage;
          break;
        case AppConstant.dbOuterPersonCarLicense:
          title = AppConstant.msOuterPersonCarLicense;
          break;
        case AppConstant.dbOuterPersonBusLicense:
          title = AppConstant.msOuterPersonBusLicense;
          break;
        case AppConstant.dbOuterPersonCar:
          title = AppConstant.msOuterPersonCar;
          break;
        case AppConstant.dbOuterPersonSocialEmployee:
          title = AppConstant.msOuterPersonSocialEmployee;
          break;
        case AppConstant.dbOuterPersonHealth:
          title = AppConstant.msOuterPersonHealth;
          break;
        case AppConstant.dbOuterPersonImmigration:
          title = AppConstant.msOuterPersonImmigration;
          break;
        case AppConstant.dbOuterPersonExtension:
          title = AppConstant.msOuterPersonExtension;
          break;
        case AppConstant.dbOuterPersonForeignHouse:
          title = AppConstant.msOuterPersonForeignHouse;
          break;
        case AppConstant.dbOuterPersonTraffic:
          title = AppConstant.msOuterPersonTraffic;
          break;
        case AppConstant.dbOuterPersonP4:
          title = AppConstant.msOuterPersonP4;
          break;
        case AppConstant.dbOuterPersonPrisoner:
          title = AppConstant.msOuterPersonPrisoner;
          break;

        //MockUp Rescue
        // case AppConstant.dbOuterPersonRescueVolunteer: title = AppConstant.msOuterPersonRescueVolunteer; break;
        // case AppConstant.dbOuterPersonRescueTraining: title = AppConstant.msOuterPersonRescueTraining; break;

        case AppConstant.dbOuterCarCar:
          title = AppConstant.msOuterCarCar;
          break;
        case AppConstant.dbOuterCarTraffic:
          title = AppConstant.msOuterCarTraffic;
          break;

        // case AppConstant.dbOuterCarAmbulanceLicense: title = AppConstant.msOuterCarAmbulanceLicense; break;
        // case AppConstant.dbOuterCarFlashingLightLicense: title = AppConstant.msOuterCarFlashingLightLicense; break;
      }
      final db = Database(title: title, category: category, checked: true);
      selectDbArray.add(db);
    }

    _refreshEnableButton();
  }

  @action
  void selectItem(int index, bool isInnerDb) {
    if (isInnerDb) {
      final db = innerDbs[index];
      bool isAdd = !db.checked;
      String dbName = db.title!;
      if (isAdd) {
        //Check maximum
        if (selectDbArray.length < MAXIMUM) {
          selectDbArray.add(db);
          innerDbs[index].checked = isAdd;
        }
      } else {
        int foundIndex = -1;
        for (int i = 0; i < selectDbArray.length; i++) {
          String oldDbName = selectDbArray[i].title!;
          if (oldDbName == dbName) {
            foundIndex = i;
            break;
          }
        }
        selectDbArray.removeAt(foundIndex);
        innerDbs[index].checked = isAdd;
      }
    } else {
      final db = outerDbs[index];
      bool isAdd = !db.checked;
      String dbName = db.title!;
      if (isAdd) {
        //Check maximum
        if (selectDbArray.length < MAXIMUM) {
          selectDbArray.add(db);
          outerDbs[index].checked = isAdd;
        }
      } else {
        int foundIndex = -1;
        for (int i = 0; i < selectDbArray.length; i++) {
          String oldDbName = selectDbArray[i].title!;
          if (oldDbName == dbName) {
            foundIndex = i;
            break;
          }
        }
        selectDbArray.removeAt(foundIndex);
        outerDbs[index].checked = isAdd;
      }
    }

    _refreshEnableButton();
    refreshCanAddFavorite();
  }

  List<Database> queueDbArray = [];

  @action
  Future<void> search() async {
    status = ActionStatus.inProgress;

    if (!AppConstant.isMockUser) {
      openGPSDisabled = false;
      groupResultArray = [];

      try {
        lastPosition = await DeviceInformationUtils.determinePosition();
      } catch (e) {
        StringUtils.log("determinePosition Error " + e.toString());
        openGPSDisabled = true;
        status = ActionStatus.error;
      }

      if (openGPSDisabled == false) {
        StringUtils.log("lat :" + lastPosition.latitude.toString());
        StringUtils.log("lon :" + lastPosition.longitude.toString());
        // Refresh queue
        groupResultArray = [];
        queueDbArray.clear();
        for (int i = 0; i < selectDbArray.length; i++) {
          Database database = selectDbArray[i];
          queueDbArray.add(database);
        }
        await nextQueue();
        if (status != ActionStatus.error) {
          status = ActionStatus.success;
        }
      }
    } else {
      groupResultArray = [];
      queueDbArray.clear();
      for (int i = 0; i < selectDbArray.length; i++) {
        Database database = selectDbArray[i];
        queueDbArray.add(database);
      }

      // Pop first
      Database database = queueDbArray[0];
      queueDbArray.removeAt(0);
      String category = database.category!;

      GroupResult groupResult = GroupResult();
      groupResult.category = category;

      if (category == AppConstant.dbOuterPersonCivil) {
        List<PersonDto> listPerson = [];
        PersonDto personDto = PersonDto();
        personDto.pID = '1234567890123';
        personDto.title = 'TEST';
        personDto.firstName = 'TEST';
        personDto.lastName = 'TEST';
        personDto.birthdate = 'TEST';
        personDto.gender = 'TEST';
        personDto.age = 'TEST';
        personDto.moveInDate = 'TEST';
        personDto.peopleStatus = 'TEST';
        personDto.nationality = 'TEST';
        personDto.houseOwnerStatus = 'TEST';
        personDto.fatherPID = 'TEST';
        personDto.fatherName = 'TEST';
        personDto.fatherNationality = 'TEST';
        personDto.motherPID = 'TEST';
        personDto.motherName = 'TEST';
        personDto.motherNationality = 'TEST';
        personDto.houseID = 'TEST';
        personDto.houseNumber = 'TEST';
        personDto.moo = 'TEST';
        personDto.alley = 'TEST';
        personDto.soi = 'TEST';
        personDto.road = 'TEST';
        personDto.tambon = 'TEST';
        personDto.amphur = 'TEST';
        personDto.province = 'TEST';
        personDto.changedNationalityStatus = 'TEST';
        personDto.changedNationalityDate = 'TEST';
        personDto.address = 'TEST';
        listPerson.add(personDto);

        groupResult.resultArray = ResultMapper().mapPerson(listPerson);
        groupResult.title = AppConstant.msOuterPersonCivil;
        groupResultArray.add(groupResult);
      }

      status = ActionStatus.success;
    }
  }

  Future<void> nextQueue() async {
    // Pop first
    Database database = queueDbArray[0];
    queueDbArray.removeAt(0);

    String category = database.category!;

    try {
      var response;

      // ---------- REQUEST INNER ----------------

      /// REQUEST - INNER - case AppConstant.kSearchPerson:

      // CrimeCase Person
      if (category == AppConstant.dbInnerPersonDoAya) {
        // 3 สืบค้นผู้กระทาความผิดในคดีอาญา
        if (paramScope.hasInputPid) {
          response = await ApiClient().getCrimeCasePersonByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputPasId) {
          response = await ApiClient().getCrimeCasePersonByPasId(
              paramScope.pasId,
              paramScope.nation,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getCrimeCasePersonByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        } /*else if (paramScope.hasInputFullcaseNo) {
            response = await ApiClient().getCrimeCasePersonByFullcaseNo(paramScope.orgCode, paramScope.crimeCaseYear, paramScope.crimeCaseNo);
          }*/
      }

      // TrafficCase Person
      else if (category == AppConstant.dbInnerPersonDoTraffic) {
        // 6 สืบค้นผู้กระทาความผิดในคดีจราจร
        if (paramScope.hasInputPid) {
          response = await ApiClient().getTrafficCasePersonByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputPasId) {
          response = await ApiClient().getTrafficCasePersonByPasId(
              paramScope.pasId,
              paramScope.nation,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getTrafficCasePersonByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        } /*else if (paramScope.hasInputFullcaseNo) {
            response = await ApiClient().getTrafficCasePersonByFullcaseNo(paramScope.orgCode, paramScope.crimeCaseYear, paramScope.crimeCaseNo);
          }*/
      }

      // Warrant
      else if (category == AppConstant.dbInnerPersonHasAya) {
        // 8 สืบค้นหมายจับ
        if (paramScope.hasInputPid) {
          response = await ApiClient().getWarrantByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getWarrantByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputWrAddress) {
          response = await ApiClient().getWarrantByAddress(
              paramScope.proviceWr,
              paramScope.amphurWr,
              paramScope.tambonWr,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputCourt) {
          response = await ApiClient().getWarrantByCourt(
              paramScope.court, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputOrgCode) {
          response = await ApiClient().getWarrantByOrgCode(paramScope.orgCode,
              lastPosition.latitude, lastPosition.longitude);
        }
      }

      // Warrant
      // else if(category == AppConstant.dbInnerPersonHasTraffic) {
      //   // 8 สืบค้นหมายจับ
      //   if (paramScope.hasInputPid) {
      //     response = await ApiClient().getWarrantPolisByPid(paramScope.pid, lastPosition.latitude, lastPosition.longitude);
      //   } else if (paramScope.hasInputNames) {
      //     response = await ApiClient().getWarrantPolisByName(paramScope.firstName, paramScope.lastName, lastPosition.latitude, lastPosition.longitude);
      //   } else if (paramScope.hasInputWrAddress) {
      //     response = await ApiClient().getWarrantPolisByAddress(paramScope.proviceWr, paramScope.amphurWr, paramScope.tambonWr, lastPosition.latitude, lastPosition.longitude);
      //   } else if (paramScope.hasInputCourt) {
      //     response = await ApiClient().getWarrantPolisByCourt(paramScope.court, lastPosition.latitude, lastPosition.longitude);
      //   } else if (paramScope.hasInputOrgCode) {
      //     response = await ApiClient().getWarrantPolisByOrgCode(paramScope.orgCode, lastPosition.latitude, lastPosition.longitude);
      //   }
      // }

      // WarrantCRD
      else if (category == AppConstant.dbInnerPersonWarrantCRD) {
        // 8 สืบค้นหมายจับ
        if (paramScope.hasInputPid) {
          response = await ApiClient().getWarrantCRDByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getWarrantCRDByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputWrAddress) {
          response = await ApiClient().getWarrantCRDByAddress(
              paramScope.proviceWr,
              paramScope.amphurWr,
              paramScope.tambonWr,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputCourt) {
          response = await ApiClient().getWarrantCRDByCourt(
              paramScope.court, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputOrgCode) {
          response = await ApiClient().getWarrantCRDByOrgCode(
              paramScope.orgCode,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // WarrantCourtCRD
      else if (category == AppConstant.dbInnerPersonWarrantCourtCRD) {
        // 8 สืบค้นหมายจับ
        if (paramScope.hasInputPid) {
          response = await ApiClient().getWarrantCourtCRDByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getWarrantCourtCRDByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // RedNotice
      else if (category == AppConstant.dbInnerPersonRedNotice) {
        if (paramScope.hasInputNames) {
          response = await ApiClient().getRedNoticeByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // FaceRec
      else if (category == AppConstant.dbInnerPersonFaceRec) {
        if (paramScope.hasInputImg) {
          response = await ApiClient().getPersonByFace(paramScope.base64Image,
              lastPosition.latitude, lastPosition.longitude);
        }
      }

      /// REQUEST - INNER - case AppConstant.kSearchCar:

      // CrimeCase Vehicle
      // 0 = เกี่ยวกับคดี
      // 1 = สกัดจับ
      // 2 = หาย
      else if (category == AppConstant.dbInnerCarAya) {
        if (paramScope.hasInputFullNoPlate) {
          response = await ApiClient().getCrimeCaseVehicleByFullNoPlate(
              paramScope.proviceTc,
              paramScope.intitialNo,
              paramScope.number,
              '0',
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputFullEngineNo) {
          response = await ApiClient().getCrimeCaseVehicleByFullEngineNo(
              paramScope.engineNo,
              '0',
              lastPosition.latitude,
              lastPosition.longitude);
        } /*else if (paramScope.hasInputFullcaseNo) {
            response = await ApiClient().getCrimeCaseVehicleByFullcaseNo(paramScope.orgCode, paramScope.crimeCaseYear, paramScope.crimeCaseNo);
          }*/
      }

      // TrafficCase Vehicle
      else if (category == AppConstant.dbInnerCarTraffic) {
        if (paramScope.hasInputFullNoPlate) {
          response = await ApiClient().getTrafficCaseVehicleByFullNoPlate(
              paramScope.proviceTc,
              paramScope.intitialNo,
              paramScope.number,
              '0',
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputFullEngineNo) {
          response = await ApiClient().getTrafficCaseVehicleByFullEngineNo(
              paramScope.engineNo,
              '0',
              lastPosition.latitude,
              lastPosition.longitude);
        } /*else if (paramScope.hasInputFullcaseNo) {
            response = await ApiClient().getTrafficCaseVehicleByFullcaseNo(paramScope.orgCode, paramScope.crimeCaseYear, paramScope.crimeCaseNo);
          }*/
      } else if (category == AppConstant.dbInnerCarLost) {
        if (paramScope.hasInputFullNoPlate) {
          response = await ApiClient().getCrimeCaseVehicleByFullNoPlate(
              paramScope.proviceTc,
              paramScope.intitialNo,
              paramScope.number,
              '2',
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputFullEngineNo) {
          response = await ApiClient().getCrimeCaseVehicleByFullEngineNo(
              paramScope.engineNo,
              '2',
              lastPosition.latitude,
              lastPosition.longitude);
        } /*else if (paramScope.hasInputFullcaseNo) {
            response = await ApiClient().getCrimeCaseVehicleByFullcaseNo(paramScope.orgCode, paramScope.crimeCaseYear, paramScope.crimeCaseNo);
          }*/
      } else if (category == AppConstant.dbInnerCarWanted) {
        if (paramScope.hasInputFullNoPlate) {
          response = await ApiClient().getCrimeCaseVehicleByFullNoPlate(
              paramScope.proviceTc,
              paramScope.intitialNo,
              paramScope.number,
              '1',
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputFullEngineNo) {
          response = await ApiClient().getCrimeCaseVehicleByFullEngineNo(
              paramScope.engineNo,
              '1',
              lastPosition.latitude,
              lastPosition.longitude);
        } /*else if (paramScope.hasInputFullcaseNo) {
            response = await ApiClient().getCrimeCaseVehicleByFullcaseNo(paramScope.orgCode, paramScope.crimeCaseYear, paramScope.crimeCaseNo);
          }*/
      } else if (category == AppConstant.dbInnerCarEmergency) {
        if (paramScope.hasInputPlate) {
          response = await ApiClient().getEmergencyCarByPlate(
              paramScope.intitialNo,
              paramScope.number,
              paramScope.provcode,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputLicenseNumber) {
          response = await ApiClient().getEmergencyCarByLicenseNumber(
              paramScope.licensenumber,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      /// REQUEST - INNER - case AppConstant.kSearchInfo:

      // CrimeCase
      if (category == AppConstant.dbInnerInfoAya) {
        if (paramScope.hasInputFullcaseNo) {
          response = await ApiClient().getCrimeCaseByFullcaseNo(
              paramScope.orgCode,
              paramScope.crimeCaseYear,
              paramScope.crimeCaseNo,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      if (category == AppConstant.dbInnerInfoPersonSS) {
        if (paramScope.hasInputFullcaseNo) {
          response = await ApiClient().getCrimeCasePersonByFullcaseNo(
              paramScope.orgCode,
              paramScope.crimeCaseYear,
              paramScope.crimeCaseNo,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // TrafficCase
      else if (category == AppConstant.dbInnerInfoTraffic) {
        if (paramScope.hasInputFullcaseNo) {
          response = await ApiClient().getTrafficCaseByFullcaseNo(
              paramScope.orgCode,
              paramScope.crimeCaseYear,
              paramScope.crimeCaseNo,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      } else if (category == AppConstant.dbInnerInfoPersonTC) {
        if (paramScope.hasInputFullcaseNo) {
          response = await ApiClient().getTrafficCasePersonByFullcaseNo(
              paramScope.orgCode,
              paramScope.crimeCaseYear,
              paramScope.crimeCaseNo,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      } else if (category == AppConstant.dbInnerInfoVehicleCc) {
        if (paramScope.hasInputFullcaseNo) {
          response = await ApiClient().getCrimeCaseVehicleByFullcaseNo(
              paramScope.orgCode,
              paramScope.crimeCaseYear,
              paramScope.crimeCaseNo,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      } else if (category == AppConstant.dbInnerInfoVehicleTc) {
        if (paramScope.hasInputFullcaseNo) {
          response = await ApiClient().getTrafficCaseVehicleByFullcaseNo(
              paramScope.orgCode,
              paramScope.crimeCaseYear,
              paramScope.crimeCaseNo,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // ---------- REQUEST OUTER ----------------

      /// REQUEST - OUTER - case AppConstant.kSearchPerson:

      // Person
      else if (category == AppConstant.dbOuterPersonCivil) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getPersonDetailByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getPersonDetailByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // Worker
      else if (category == AppConstant.dbOuterPersonForeign) {
        if (paramScope.hasInputWorkerId) {
          response = await ApiClient().getForeignWorkerDetailByWorkerId(
              paramScope.workerId,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // PersonLk
      else if (category == AppConstant.dbOuterPersonLinkage) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getPersonInfoByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getPersonInfoByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // DriverLicenceInfo
      else if (category == AppConstant.dbOuterPersonCarLicense) {
        if (paramScope.hasInputPidPlt1) {
          response = await ApiClient().getDriverLicenceInfoByPid(
              paramScope.pid,
              paramScope.pltcode1,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNamesPlt1) {
          response = await ApiClient().getDriverLicenceInfoByName(
              paramScope.firstName,
              paramScope.lastName,
              paramScope.pltcode1,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // DriverLicenceInfo
      else if (category == AppConstant.dbOuterPersonBusLicense) {
        if (paramScope.hasInputPidPlt2) {
          response = await ApiClient().getPublicLicenceInfoByPid(
              paramScope.pid,
              paramScope.pltcode2,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNamesPlt2) {
          response = await ApiClient().getPublicLicenceInfoByName(
              paramScope.firstName,
              paramScope.lastName,
              paramScope.pltcode2,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // VehicleInfo
      else if (category == AppConstant.dbOuterPersonCar) {
        // กรมขนส่ง - ยานพาหนะ
        if (paramScope.hasInputPid) {
          response = await ApiClient().getVehicleInfoByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getVehicleInfoByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputPlateProv) {
          response = await ApiClient().getVehicleInfoByPlate(
              paramScope.plate1Vh,
              paramScope.plate2Vh,
              paramScope.provcode,
              paramScope.vhtype,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNumBody) {
          response = await ApiClient().getVehicleInfoByNumBody(
              paramScope.numbody,
              paramScope.brncode,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputPassportNo) {
          response = await ApiClient().getVehicleInfoByPassport(
              paramScope.passportNo,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // Employee Employment
      else if (category == AppConstant.dbOuterPersonSocialEmployee) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getEmployeeEmploymentByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        }
      }

      // Hospital
      // else if(category == AppConstant.dbOuterPersonSocialHospital) {
      //   if(paramScope.hasInputPid) {
      //     response = await ApiClient().getSelectHospitalPid(paramScope.pid);
      //   }
      // }
      //
      // // Employer
      // else if(category == AppConstant.dbOuterPersonSocialEmployer) {
      //   if(paramScope.hasInputAcc) {
      //     response = await ApiClient().getEmployerDetail(paramScope.accno, paramScope.accbranch);
      //   }
      // }

      // Health
      else if (category == AppConstant.dbOuterPersonHealth) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getHealthInsuranceByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        }
      }

      // Travel
      // else if(category == AppConstant.dbOuterPersonImmigration) {
      //   if(paramScope.hasInputPassportNo) {
      //     response = await ApiClient().getTravelDetailByPassport(paramScope.passportNo, lastPosition.latitude, lastPosition.longitude);
      //   } else if(paramScope.hasInputPid) {
      //     response = await ApiClient().getTravelDetailByPid(paramScope.pid, lastPosition.latitude, lastPosition.longitude);
      //   }
      //   // if(paramScope.hasInputTmRunNo) {
      //   //   response = await ApiClient().getTravelDetailByTmRunno(paramScope.tmrunno);
      //   // }
      // }

      // Immigration
      else if (category == AppConstant.dbOuterPersonImmigration) {
        if (paramScope.hasInputPassportNo) {
          response = await ApiClient().getImmigrationByPassport(
              paramScope.passportNo,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getImmigrationByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // Extension
      else if (category == AppConstant.dbOuterPersonExtension) {
        if (paramScope.hasInputPassportNo) {
          response = await ApiClient().getExtensionByPassport(
              paramScope.passportNo,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getExtensionByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }
      // Migwis
      else if (category == AppConstant.dbOuterPersonMigwis) {
        if (paramScope.hasInputAlienNo) {
          response = await ApiClient().searchMigwisByAlienNo(
              paramScope.alienNo,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().searchMigwisByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // Tm61
      else if (category == AppConstant.dbOuterPersonForeignHouse) {
        if (paramScope.hasInputPassportNo) {
          response = await ApiClient().getTm61DetailByPassport(
              paramScope.passportNo,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getTm61DetailByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // PersonTraffic
      else if (category == AppConstant.dbOuterPersonTraffic) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getAllTickeList(paramScope.pid, "", "",
              "", "", lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getAllTickeListByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // Gun
      else if (category == AppConstant.dbOuterPersonP4) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getGunDetailByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        }
        if (paramScope.hasInputGunReg) {
          response = await ApiClient().getGunInfo(
              paramScope.gunReg, lastPosition.latitude, lastPosition.longitude);
        }
      }

      // prisoner
      else if (category == AppConstant.dbOuterPersonPrisoner) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getPrisonerByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getPrisonerByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // PersonForeign
      else if (category == AppConstant.dbOuterPersonAlien) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getForeignPersonInfoByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        }
      }

      // PersonWorker
      else if (category == AppConstant.dbOuterPersonWorker) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getForeignWorkerInfoByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        }
      }

      // PersonNonThai
      else if (category == AppConstant.dbOuterPersonNonThai) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getPersonNonThaiInfoByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        }
      }

      // PersonNoRegis
      else if (category == AppConstant.dbOuterPersonNoRegis) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getPersonNoRegisInfoByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        }
      }

      //warrant court
      else if (category == AppConstant.dbOuterPersonWarrantCourt) {
        if (paramScope.hasInputPid) {
          response = await ApiClient().getWarrantCourtByPid(
              paramScope.pid, lastPosition.latitude, lastPosition.longitude);
        } else if (paramScope.hasInputNames) {
          response = await ApiClient().getWarrantCourtByName(
              paramScope.firstName,
              paramScope.lastName,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // TODO: New API
      // else if(category == AppConstant.dbOuterPersonRescueVolunteer) {
      //   // ข้อมูลอาสาสมัครกู้ภัย
      //   if (paramScope.hasInputPid) {
      //     response = await ApiClient().getPersonRvByPid(paramScope.pid, lastPosition.latitude, lastPosition.longitude);
      //   }else if (paramScope.hasInputNames) {
      //     response = await ApiClient().getPersonRvByName(
      //         paramScope.firstName, paramScope.lastName,
      //         lastPosition.latitude, lastPosition.longitude);
      //   }
      // }

      // TODO: New API
      // else if(category == AppConstant.dbOuterPersonRescueTraining) {
      //   // ตรวจสอบการฝึกอบรมกู้ภัย
      //   if (paramScope.hasInputPid) {
      //     response = await ApiClient().getPersonRtByPid(paramScope.pid, lastPosition.latitude, lastPosition.longitude);
      //   }else if (paramScope.hasInputNames) {
      //     response = await ApiClient().getPersonRtByName(
      //         paramScope.firstName, paramScope.lastName,
      //         lastPosition.latitude, lastPosition.longitude);
      //   }
      // }

      /// REQUEST - OUTER - case AppConstant.kSearchCar:

      else if (category == AppConstant.dbOuterCarCar) {
        if (paramScope.hasInputPlateProv) {
          response = await ApiClient().getVehicleInfoByPlate(
              paramScope.plate1Vh,
              paramScope.plate2Vh,
              paramScope.provcode,
              paramScope.vhtype,
              lastPosition.latitude,
              lastPosition.longitude);
        } else if (paramScope.hasInputNumBody) {
          response = await ApiClient().getVehicleInfoByNumBody(
              paramScope.numbody,
              paramScope.brncode,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // Ticket
      else if (category == AppConstant.dbOuterCarTraffic) {
        if (paramScope.hasInputPlateTicket) {
          if (paramScope.plate1Tf == null) paramScope.plate1Tf = "";
          if (paramScope.plate2Tf == null) paramScope.plate2Tf = "";
          if (paramScope.plate3Tf == null) paramScope.plate3Tf = "";
          if (paramScope.ticketId == null) paramScope.ticketId = "";
          response = await ApiClient().getAllTickeList(
              "",
              paramScope.plate1Tf,
              paramScope.plate2Tf,
              paramScope.plate3Tf,
              paramScope.ticketId,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // TODO: New API
      else if (category == AppConstant.dbOuterCarFlashingLightLicense) {
        // ข้อมูลอาสาสมัครกู้ภัย
        if (paramScope.hasInputPlate) {
          response = await ApiClient().getCarFllByPlate(
              paramScope.plate1Vh,
              paramScope.plate2Vh,
              paramScope.provcode,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      // TODO: New API
      else if (category == AppConstant.dbOuterCarAmbulanceLicense) {
        // ข้อมูลอาสาสมัครกู้ภัย
        if (paramScope.hasInputPlate) {
          response = await ApiClient().getCarAmlByPlate(
              paramScope.plate1Vh,
              paramScope.plate2Vh,
              paramScope.provcode,
              lastPosition.latitude,
              lastPosition.longitude);
        }
      }

      /// REQUEST - OUTER - case AppConstant.kSearchInfo:

      if (response != null) {
        GroupResult groupResult = GroupResult();
        groupResult.category = category;

        // -------- RESPONSE INNER ---------

        /// RESPONSE - INNER - case AppConstant.kSearchPerson:

        // CrimeCase Person
        if (category == AppConstant.dbInnerPersonDoAya) {
          final crimeCasePersonResponse =
              response as GetCrimeCasePersonResponseDto;
          if (crimeCasePersonResponse != null) {
            if (crimeCasePersonResponse.status == AppConstant.statusSuccess) {
              final listCrimeCasePerson =
                  crimeCasePersonResponse.listCrimeCasePerson!.data;
              groupResult.resultArray =
                  ResultMapper().mapCrimeCasePerson(listCrimeCasePerson);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = crimeCasePersonResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerPersonDoAya;
          groupResultArray.add(groupResult);
        }

        // TrafficCase Person
        else if (category == AppConstant.dbInnerPersonDoTraffic) {
          final trafficCasePersonResponse =
              response as GetTrafficCasePersonResponseDto;
          if (trafficCasePersonResponse != null) {
            if (trafficCasePersonResponse.status == AppConstant.statusSuccess) {
              final listTrafficCasePerson =
                  trafficCasePersonResponse.listTrafficCasePerson!.data;
              groupResult.resultArray = ResultMapper().mapTrafficCasePerson(
                  listTrafficCasePerson, paramScope.pid, paramScope.pasId);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = trafficCasePersonResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerPersonDoTraffic;
          groupResultArray.add(groupResult);
        }

        // Warrant
        else if (category == AppConstant.dbInnerPersonHasAya) {
          final warrantResponse = response as GetWarrantResponseDto;
          if (warrantResponse != null) {
            if (warrantResponse.status == AppConstant.statusSuccess) {
              final listWarrant = warrantResponse.listWarrant!.data;

              //TODO: Filter only caseType == 'คดีอาญา'
              List<WarrantDto> filterListWarrant = [];
              for (int i = 0; i < listWarrant!.length; i++) {
                final warrant = listWarrant[i];
                //if(warrant.caseType.contains('อาญา')){
                filterListWarrant.add(warrant);
                //}
              }

              groupResult.resultArray =
                  ResultMapper().mapWarrant(filterListWarrant);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = warrantResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerPersonHasAya;
          groupResultArray.add(groupResult);
        }

        // Warrant
        // else if(category == AppConstant.dbInnerPersonHasTraffic) {
        //   final warrantResponse = response as GetWarrantResponseDto;
        //   if(warrantResponse!=null){
        //     if(warrantResponse.status == AppConstant.statusSuccess){
        //       final listWarrant = warrantResponse.listWarrant!.data;
        //
        //       //TODO: Filter only caseType != 'คดีอาญา'
        //       List<WarrantDto> filterListWarrant = [];
        //       for(int i=0; i<listWarrant!.length; i++){
        //         final warrant = listWarrant[i];
        //         //if(!warrant.caseType.contains('อาญา')){
        //         filterListWarrant.add(warrant);
        //         //
        //         // }
        //       }
        //
        //       groupResult.resultArray = ResultMapper().mapWarrant(filterListWarrant);
        //     }else{
        //       groupResult.resultArray = [];
        //       groupResult.errorMessage = warrantResponse.message;
        //     }
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msInnerPersonHasTraffic;
        //   groupResultArray.add(groupResult);
        // }

        // WarrantCRD
        else if (category == AppConstant.dbInnerPersonWarrantCRD) {
          final warrantCRDResponse = response as GetWarrantCRDResponseDto;
          if (warrantCRDResponse != null) {
            if (warrantCRDResponse.status == AppConstant.statusSuccess) {
              final listWarrant = warrantCRDResponse.listWarrant!.data;

              //TODO: Filter only caseType != 'คดีอาญา'
              List<WarrantCRDDto> filterListWarrant = [];
              for (int i = 0; i < listWarrant!.length; i++) {
                final warrant = listWarrant[i];
                //if(!warrant.caseType.contains('อาญา')){
                filterListWarrant.add(warrant);
                //
                // }
              }

              groupResult.resultArray =
                  ResultMapper().mapWarrantCRD(filterListWarrant);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = warrantCRDResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerPersonWarrantCRD;
          groupResultArray.add(groupResult);
        }

        // WarrantCourtCRD
        else if (category == AppConstant.dbInnerPersonWarrantCourtCRD) {
          final warrantCourtCRDResponse =
              response as GetWarrantCourtCRDResponseDto;
          if (warrantCourtCRDResponse != null) {
            if (warrantCourtCRDResponse.status == AppConstant.statusSuccess) {
              final listWarrant = warrantCourtCRDResponse.listWarrant!.data;

              List<WarrantCourtCRDDto> filterListWarrant = [];
              for (int i = 0; i < listWarrant!.length; i++) {
                final warrant = listWarrant[i];
                //if(!warrant.caseType.contains('อาญา')){
                filterListWarrant.add(warrant);
                //
                // }
              }

              groupResult.resultArray =
                  ResultMapper().mapWarrantCourtCRD(filterListWarrant);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = warrantCourtCRDResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerPersonWarrantCourtCRD;
          groupResultArray.add(groupResult);
        }

        // RedNotice
        else if (category == AppConstant.dbInnerPersonRedNotice) {
          final redNoticeResponse = response as GetRedNoticeResponseDto;
          if (redNoticeResponse != null) {
            if (redNoticeResponse.status == AppConstant.statusSuccess) {
              final listWarrant = redNoticeResponse.listWarrant!.data;

              List<RedNoticeDto> filterListWarrant = [];
              for (int i = 0; i < listWarrant!.length; i++) {
                final warrant = listWarrant[i];
                //if(!warrant.caseType.contains('อาญา')){
                filterListWarrant.add(warrant);
                //
                // }
              }
              groupResult.resultArray =
                  ResultMapper().mapRedNotice(filterListWarrant);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = redNoticeResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerPersonRedNotice;
          groupResultArray.add(groupResult);
        }

        // FaceRec
        else if (category == AppConstant.dbInnerPersonFaceRec) {
          final faceResponse = response as FaceResponseDto;
          if (faceResponse != null) {
            if (faceResponse.status == AppConstant.statusSuccess) {
              final listDate = faceResponse.listFaceDto!.data;

              List<FaceDto> filterListDate = [];
              for (int i = 0; i < listDate!.length; i++) {
                final warrant = listDate[i];
                filterListDate.add(warrant);
              }
              groupResult.resultArray =
                  ResultMapper().mapFaceRec(filterListDate);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = faceResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerPersonFaceRec;
          groupResultArray.add(groupResult);
        }

        /// RESPONSE - INNER - case AppConstant.kSearchCar:

        // CrimeCase Vehicle
        else if (category == AppConstant.dbInnerCarAya) {
          final crimeCaseVehicleResponse =
              response as GetCrimeCaseVehicleResponseDto;
          if (crimeCaseVehicleResponse != null) {
            if (crimeCaseVehicleResponse.status == AppConstant.statusSuccess) {
              final listCrimeCaseVehicle =
                  crimeCaseVehicleResponse.listCrimeCaseVehicle!.data;
              groupResult.resultArray =
                  ResultMapper().mapCrimeCaseVehicle(listCrimeCaseVehicle);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = crimeCaseVehicleResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerCarAya;
          groupResultArray.add(groupResult);
        }

        // TrafficCase Vehicle
        else if (category == AppConstant.dbInnerCarTraffic) {
          final trafficCaseVehicleResponse =
              response as GetTrafficCaseVehicleResponseDto;
          if (trafficCaseVehicleResponse != null) {
            if (trafficCaseVehicleResponse.status ==
                AppConstant.statusSuccess) {
              final listTrafficCaseVehicle =
                  trafficCaseVehicleResponse.listTrafficCaseVehicle!.data;
              groupResult.resultArray =
                  ResultMapper().mapTrafficCaseVehicle(listTrafficCaseVehicle);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = trafficCaseVehicleResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerCarTraffic;
          groupResultArray.add(groupResult);
        } else if (category == AppConstant.dbInnerCarLost) {
          final crimeCaseVehicleResponse =
              response as GetCrimeCaseVehicleResponseDto;
          if (crimeCaseVehicleResponse != null) {
            if (crimeCaseVehicleResponse.status == AppConstant.statusSuccess) {
              final listCrimeCaseVehicle =
                  crimeCaseVehicleResponse.listCrimeCaseVehicle!.data;
              groupResult.resultArray =
                  ResultMapper().mapCrimeCaseVehicleLost(listCrimeCaseVehicle);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = crimeCaseVehicleResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerCarLost;
          groupResultArray.add(groupResult);
        }

        // else if(category == AppConstant.dbInnerCarWanted){
        //   final crimeCaseVehicleResponse = response as GetCrimeCaseVehicleResponseDto;
        //   if(crimeCaseVehicleResponse!=null){
        //     if(crimeCaseVehicleResponse.status == AppConstant.statusSuccess){
        //       final listCrimeCaseVehicle = crimeCaseVehicleResponse.listCrimeCaseVehicle.data;
        //       groupResult.resultArray = ResultMapper().mapCrimeCaseVehicleWanted(listCrimeCaseVehicle);
        //     }else{
        //       groupResult.resultArray = [];
        //       groupResult.errorMessage = crimeCaseVehicleResponse.message;
        //     }
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msInnerCarWanted;
        //   groupResultArray.add(groupResult);
        // }

        // TrafficCase Vehicle
        else if (category == AppConstant.dbInnerCarTraffic) {
          final trafficCaseVehicleResponse =
              response as GetTrafficCaseVehicleResponseDto;
          if (trafficCaseVehicleResponse != null) {
            if (trafficCaseVehicleResponse.status ==
                AppConstant.statusSuccess) {
              final listTrafficCaseVehicle =
                  trafficCaseVehicleResponse.listTrafficCaseVehicle!.data;
              groupResult.resultArray =
                  ResultMapper().mapTrafficCaseVehicle(listTrafficCaseVehicle);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = trafficCaseVehicleResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerCarTraffic;
          groupResultArray.add(groupResult);
        }

        /// RESPONSE - INNER - case AppConstant.kSearchInfo:

        // CrimeCase
        else if (category == AppConstant.dbInnerInfoAya) {
          final crimeCaseResponse = response as GetCrimeCaseResponseDto;
          if (crimeCaseResponse != null) {
            if (crimeCaseResponse.status == AppConstant.statusSuccess) {
              final listCrimeCase = crimeCaseResponse.listCrimeCase!.data;
              groupResult.resultArray =
                  ResultMapper().mapCrimeCase(listCrimeCase);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = crimeCaseResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerInfoAya;
          groupResultArray.add(groupResult);
        } else if (category == AppConstant.dbInnerInfoPersonSS) {
          final crimeCasePersonResponse =
              response as GetCrimeCasePersonResponseDto;
          if (crimeCasePersonResponse != null) {
            if (crimeCasePersonResponse.status == AppConstant.statusSuccess) {
              final listCrimeCasePerson =
                  crimeCasePersonResponse.listCrimeCasePerson!.data;
              groupResult.resultArray =
                  ResultMapper().mapCrimeCasePerson(listCrimeCasePerson);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = crimeCasePersonResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerInfoPersonSS;
          groupResultArray.add(groupResult);
        }

        // TrafficCase
        else if (category == AppConstant.dbInnerInfoTraffic) {
          final trafficCaseResponse = response as GetTrafficCaseResponseDto;
          if (trafficCaseResponse != null) {
            if (trafficCaseResponse.status == AppConstant.statusSuccess) {
              final listTrafficCase = trafficCaseResponse.listTrafficCase!.data;
              groupResult.resultArray =
                  ResultMapper().mapTrafficCase(listTrafficCase);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = trafficCaseResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerInfoTraffic;
          groupResultArray.add(groupResult);
        } else if (category == AppConstant.dbInnerInfoPersonTC) {
          final trafficCasePersonResponse =
              response as GetTrafficCasePersonResponseDto;
          if (trafficCasePersonResponse != null) {
            if (trafficCasePersonResponse.status == AppConstant.statusSuccess) {
              final listTrafficCasePerson =
                  trafficCasePersonResponse.listTrafficCasePerson!.data;
              groupResult.resultArray = ResultMapper().mapTrafficCasePerson(
                  listTrafficCasePerson, paramScope.pid, paramScope.pasId);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = trafficCasePersonResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerInfoPersonTC;
          groupResultArray.add(groupResult);
        } else if (category == AppConstant.dbInnerInfoVehicleCc) {
          final crimeCaseVehicleResponse =
              response as GetCrimeCaseVehicleResponseDto;
          if (crimeCaseVehicleResponse != null) {
            if (crimeCaseVehicleResponse.status == AppConstant.statusSuccess) {
              final listCrimeCaseVehicle =
                  crimeCaseVehicleResponse.listCrimeCaseVehicle!.data;
              groupResult.resultArray =
                  ResultMapper().mapCrimeCaseVehicle(listCrimeCaseVehicle);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = crimeCaseVehicleResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerInfoVehicleCc;
          groupResultArray.add(groupResult);
        } else if (category == AppConstant.dbInnerInfoVehicleTc) {
          final trafficCaseVehicleResponse =
              response as GetTrafficCaseVehicleResponseDto;
          if (trafficCaseVehicleResponse != null) {
            if (trafficCaseVehicleResponse.status ==
                AppConstant.statusSuccess) {
              final listTrafficCaseVehicle =
                  trafficCaseVehicleResponse.listTrafficCaseVehicle!.data;
              groupResult.resultArray =
                  ResultMapper().mapTrafficCaseVehicle(listTrafficCaseVehicle);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = trafficCaseVehicleResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerInfoVehicleTc;
          groupResultArray.add(groupResult);
        }

        // -------- RESPONSE OUTER ---------

        /// RESPONSE - OUTER - case AppConstant.kSearchPerson:

        // Person
        else if (category == AppConstant.dbOuterPersonCivil) {
          final personResponse = response as PersonResponseDto;
          if (personResponse != null) {
            if (personResponse.status == AppConstant.statusSuccess) {
              final listPerson = personResponse.listPersonDto!.data;
              groupResult.resultArray = ResultMapper().mapPerson(listPerson);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = personResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonCivil;
          groupResultArray.add(groupResult);
        }

        // Worker
        else if (category == AppConstant.dbOuterPersonForeign) {
          final workerResponse = response as WorkerResponseDto;
          if (workerResponse != null) {
            if (workerResponse.status == AppConstant.statusSuccess) {
              final listWorker = workerResponse.listWorkerDto!.data;
              groupResult.resultArray = ResultMapper().mapWorker(listWorker);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = workerResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonForeign;
          groupResultArray.add(groupResult);
        }

        // PersonLk
        else if (category == AppConstant.dbOuterPersonLinkage) {
          final personLkResponse = response as PersonLkResponseDto;
          if (personLkResponse != null) {
            if (personLkResponse.status == AppConstant.statusSuccess) {
              final listPersonLk = personLkResponse.listPersonLkDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapPersonLk(listPersonLk);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = personLkResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonLinkage;
          groupResultArray.add(groupResult);
        }

        // AlienPerson
        else if (category == AppConstant.dbOuterPersonAlien) {
          final alienPersonResponse = response as AlienPersonResponseDto;
          if (alienPersonResponse != null) {
            if (alienPersonResponse.status == AppConstant.statusSuccess) {
              final listAlienPerson =
                  alienPersonResponse.listAlienPersonDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapAlienPerson(listAlienPerson);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = alienPersonResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonAlien;
          groupResultArray.add(groupResult);
        }

        // AlienWorker
        else if (category == AppConstant.dbOuterPersonWorker) {
          final alienWorkerResponse = response as AlienWorkerResponseDto;
          if (alienWorkerResponse != null) {
            if (alienWorkerResponse.status == AppConstant.statusSuccess) {
              final listAlienWorker =
                  alienWorkerResponse.listAlienWorkerDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapAlienWorker(listAlienWorker);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = alienWorkerResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonWorker;
          groupResultArray.add(groupResult);
        }

        // PersonNonThai
        else if (category == AppConstant.dbOuterPersonNonThai) {
          final personNonThaiResponse = response as PersonNonThaiResponseDto;
          if (personNonThaiResponse != null) {
            if (personNonThaiResponse.status == AppConstant.statusSuccess) {
              final listPersonNonThai =
                  personNonThaiResponse.listPersonNonThaiDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapPersonNonThai(listPersonNonThai);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = personNonThaiResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonNonThai;
          groupResultArray.add(groupResult);
        }

        //PersonNoRegis
        else if (category == AppConstant.dbOuterPersonNoRegis) {
          final personNoRegisResponse = response as PersonNoRegisResponseDto;
          if (personNoRegisResponse != null) {
            if (personNoRegisResponse.status == AppConstant.statusSuccess) {
              final listPersonNoRegis =
                  personNoRegisResponse.listPersonNoRegisDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapPersonNoRegis(listPersonNoRegis);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = personNoRegisResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonNoRegis;
          groupResultArray.add(groupResult);
        }

//PersonMigwis
        else if (category == AppConstant.msOuterPersonMigwis) {
          final personMigwisResponse = response as MigwisResponseDto;
          if (personMigwisResponse != null) {
            if (personMigwisResponse.status == AppConstant.statusSuccess) {
              final listMigwisDto = personMigwisResponse.listMigwisDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapPersonMigwis(listMigwisDto);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = personMigwisResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonMigwis;
          groupResultArray.add(groupResult);
        }

        // DriverLicenceInfo
        else if (category == AppConstant.dbOuterPersonCarLicense) {
          final driverLicenseInfoResponse =
              response as DriverLicenseInfoResponseDto;
          if (driverLicenseInfoResponse != null) {
            if (driverLicenseInfoResponse.status == AppConstant.statusSuccess) {
              final listDriverLicenseInfo =
                  driverLicenseInfoResponse.listDriverLicenseInfo!.data;
              groupResult.resultArray =
                  ResultMapper().mapDriverLicense(listDriverLicenseInfo);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = driverLicenseInfoResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonCarLicense;
          groupResultArray.add(groupResult);
        }

        // DriverLicenceInfo
        else if (category == AppConstant.dbOuterPersonBusLicense) {
          final driverLicenseInfoResponse =
              response as DriverLicenseInfoResponseDto;
          if (driverLicenseInfoResponse != null) {
            if (driverLicenseInfoResponse.status == AppConstant.statusSuccess) {
              final listDriverLicenseInfo =
                  driverLicenseInfoResponse.listDriverLicenseInfo!.data;
              groupResult.resultArray =
                  ResultMapper().mapDriverLicense(listDriverLicenseInfo);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = driverLicenseInfoResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonBusLicense;
          groupResultArray.add(groupResult);
        }

        // VehicleInfo
        else if (category == AppConstant.dbOuterPersonCar) {
          final vehicleInfoResponse = response as GetVehicleInfoResponseDto;
          if (vehicleInfoResponse != null) {
            if (vehicleInfoResponse.status == AppConstant.statusSuccess) {
              final listVehicleInfo = vehicleInfoResponse.listVehicleInfo!.data;
              groupResult.resultArray =
                  ResultMapper().mapVehicleInfo(listVehicleInfo);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = vehicleInfoResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonCar;
          groupResultArray.add(groupResult);
        }

        // Employee Employment
        else if (category == AppConstant.dbOuterPersonSocialEmployee) {
          final employmentResponse = response as EmploymentResponseDto;
          if (employmentResponse != null) {
            if (employmentResponse.status == AppConstant.statusSuccess) {
              final listEmployment = employmentResponse.listEmploymentDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapEmployment(listEmployment);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = employmentResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonSocialEmployee;
          groupResultArray.add(groupResult);
        }

        // Hospital
        // else if(category == AppConstant.dbOuterPersonSocialHospital) {
        //   final hospitalResponse = response as HospitalResponseDto;
        //   if(hospitalResponse!=null){
        //     final listHospital = hospitalResponse.listHospitalDto.data;
        //     groupResult.resultArray = ResultMapper().mapHospital(listHospital);
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msOuterPersonSocialHospital;
        //   groupResultArray.add(groupResult);
        // }
        //
        // // Employer
        // else if(category == AppConstant.dbOuterPersonSocialEmployer) {
        //   final employerResponse = response as EmployerResponseDto;
        //   if(employerResponse!=null){
        //     final listEmployer = employerResponse.listEmployerDto.data;
        //     groupResult.resultArray = ResultMapper().mapEmployer(listEmployer);
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msOuterPersonSocialEmployer;
        //   groupResultArray.add(groupResult);
        // }

        // Health
        else if (category == AppConstant.dbOuterPersonHealth) {
          final healthResponse = response as HealthResponseDto;
          if (healthResponse != null) {
            if (healthResponse.status == AppConstant.statusSuccess) {
              final listHealth = healthResponse.listHealthDto!.data;
              groupResult.resultArray = ResultMapper().mapHealth(listHealth);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = healthResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonHealth;
          groupResultArray.add(groupResult);
        }

        // Travel
        // else if(category == AppConstant.dbOuterPersonImmigration) {
        //   final travelResponse = response as TravelResponseDto;
        //   if(travelResponse!=null){
        //     if(travelResponse.status == AppConstant.statusSuccess){
        //       final listTravel = travelResponse.listTravelDto!.data;
        //       groupResult.resultArray = ResultMapper().mapTravel(listTravel);
        //     }else{
        //       groupResult.resultArray = [];
        //       groupResult.errorMessage = travelResponse.message;
        //     }
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msOuterPersonImmigration;
        //   groupResultArray.add(groupResult);
        // }

        // Immigration
        else if (category == AppConstant.dbOuterPersonImmigration) {
          final immResponse = response as ImmResponseDto;
          if (immResponse != null) {
            if (immResponse.status == AppConstant.statusSuccess) {
              final listImm = immResponse.listImmDto!.data;
              groupResult.resultArray = ResultMapper().mapImm(listImm);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = immResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonImmigration;
          groupResultArray.add(groupResult);
        }

        // Extension
        else if (category == AppConstant.dbOuterPersonExtension) {
          final extensionResponse = response as ExtensionResponseDto;
          if (extensionResponse != null) {
            if (extensionResponse.status == AppConstant.statusSuccess) {
              final listExtension = extensionResponse.listExtensionDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapExtension(listExtension);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = extensionResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonExtension;
          groupResultArray.add(groupResult);
        }

        // Tm61
        else if (category == AppConstant.dbOuterPersonForeignHouse) {
          final tm61Response = response as Tm61ResponseDto;
          if (tm61Response != null) {
            if (tm61Response.status == AppConstant.statusSuccess) {
              final listTm61 = tm61Response.listTm61Dto!.data;
              groupResult.resultArray = ResultMapper().mapTm61(listTm61);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = tm61Response.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonForeignHouse;
          groupResultArray.add(groupResult);
        }

        // PersonTicket
        else if (category == AppConstant.dbOuterPersonTraffic) {
          final ticketResponse = response as TicketResponseDto;
          if (ticketResponse != null) {
            if (ticketResponse.status == AppConstant.statusSuccess) {
              final listTicket = ticketResponse.listTicketDto!.data;
              groupResult.resultArray = ResultMapper().mapTicket(listTicket);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = ticketResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonTraffic;
          groupResultArray.add(groupResult);
        }

        // Gun
        else if (category == AppConstant.dbOuterPersonP4) {
          final gunResponse = response as GunResponseDto;
          if (gunResponse != null) {
            if (gunResponse.status == AppConstant.statusSuccess) {
              final listGun = gunResponse.listGunDto!.data;
              groupResult.resultArray = ResultMapper().mapGun(listGun);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = gunResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonP4;
          groupResultArray.add(groupResult);
        } else if (category == AppConstant.dbOuterPersonPrisoner) {
          final prisonerResponse = response as PrisonerResponseDto;
          if (prisonerResponse != null) {
            if (prisonerResponse.status == AppConstant.statusSuccess) {
              final listPrisoner = prisonerResponse.listPrisonerDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapPrisoner(listPrisoner);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = prisonerResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonPrisoner;
          groupResultArray.add(groupResult);
        }

        //Warrant Court
        else if (category == AppConstant.dbOuterPersonWarrantCourt) {
          final warrantResponse = response as GetWarrantCourtResponseDto;
          if (warrantResponse != null) {
            if (warrantResponse.status == AppConstant.statusSuccess) {
              final listWarrant = warrantResponse.listWarrantCourt!.data;

              List<WarrantCourtDto> filterListWarrant = [];
              for (int i = 0; i < listWarrant!.length; i++) {
                final warrant = listWarrant[i];
                filterListWarrant.add(warrant);
              }

              groupResult.resultArray =
                  ResultMapper().mapWarrantCourt(filterListWarrant);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = warrantResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterPersonWarrantCourt;
          groupResultArray.add(groupResult);
        }

        // TODO: Response New API
        // //RescueVolunteer
        // else if(category == AppConstant.dbOuterPersonRescueVolunteer) {
        //   final PersonRvResponse = response as PersonRvResponseDto;
        //   if(PersonRvResponse!=null){
        //     if(PersonRvResponse.status == AppConstant.statusSuccess){
        //       final listPersonRv = PersonRvResponse.listPersonRvDto!.data;
        //
        //       List<PersonRvDto> filterListPersonRv = [];
        //       for(int i=0; i<listPersonRv!.length; i++){
        //         final person = listPersonRv[i];
        //         filterListPersonRv.add(person);
        //       }
        //
        //       groupResult.resultArray = ResultMapper().mapRescueVolunteer(filterListPersonRv);
        //     }else{
        //       groupResult.resultArray = [];
        //       groupResult.errorMessage = PersonRvResponse.message;
        //     }
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msOuterPersonRescueVolunteer;
        //   groupResultArray.add(groupResult);
        // }

        // TODO: Response New API
        //RescueTraining
        // else if(category == AppConstant.dbOuterPersonRescueTraining) {
        //   final PersonRtResponse = response as PersonRtResponseDto;
        //   if(PersonRtResponse!=null){
        //     if(PersonRtResponse.status == AppConstant.statusSuccess){
        //       final listPersonRt = PersonRtResponse.listPersonRtDto!.data;
        //
        //       List<PersonRtDto> filterListPersonRt = [];
        //       for(int i=0; i<listPersonRt!.length; i++){
        //         final person = listPersonRt[i];
        //         filterListPersonRt.add(person);
        //       }
        //
        //       groupResult.resultArray = ResultMapper().mapRescueTraining(filterListPersonRt);
        //     }else{
        //       groupResult.resultArray = [];
        //       groupResult.errorMessage = PersonRtResponse.message;
        //     }
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msOuterPersonRescueTraining;
        //   groupResultArray.add(groupResult);
        // }

        /// RESPONSE - OUTER - case AppConstant.kSearchCar:

        else if (category == AppConstant.dbOuterCarCar) {
          final vehicleInfoResponse = response as GetVehicleInfoResponseDto;
          if (vehicleInfoResponse != null) {
            if (vehicleInfoResponse.status == AppConstant.statusSuccess) {
              final listVehicle = vehicleInfoResponse.listVehicleInfo!.data;
              groupResult.resultArray =
                  ResultMapper().mapVehicleInfo(listVehicle);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = vehicleInfoResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterCarCar;
          groupResultArray.add(groupResult);
        }

        // Ticket
        else if (category == AppConstant.dbOuterCarTraffic) {
          final ticketResponse = response as TicketResponseDto;
          if (ticketResponse != null) {
            if (ticketResponse.status == AppConstant.statusSuccess) {
              final listTicket = ticketResponse.listTicketDto!.data;
              groupResult.resultArray = ResultMapper().mapTicket(listTicket);
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = ticketResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msOuterCarTraffic;
          groupResultArray.add(groupResult);
        }

        // TODO: Response New API
        // else if(category == AppConstant.dbOuterCarFlashingLightLicense){
        //   final carFllResponse = response as CarFllResponseDto;
        //   if(carFllResponse!=null){
        //     if(carFllResponse.status == AppConstant.statusSuccess){
        //       final listCarFll = carFllResponse.listCarFllDto!.data;
        //       groupResult.resultArray = ResultMapper().mapCarFlashingLight(listCarFll);
        //     }else{
        //       groupResult.resultArray = [];
        //       groupResult.errorMessage = carFllResponse.message;
        //     }
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msOuterCarFlashingLightLicense;
        //   groupResultArray.add(groupResult);
        // }

        // TODO: Response New API
        // else if(category == AppConstant.dbOuterCarAmbulanceLicense){
        //   final carAmlResponse = response as CarAmlResponseDto;
        //   if(carAmlResponse!=null){
        //     if(carAmlResponse.status == AppConstant.statusSuccess){
        //       final listCarAml = carAmlResponse.listCarAmlDto!.data;
        //       groupResult.resultArray = ResultMapper().mapCarAmbulance(listCarAml);
        //     }else{
        //       groupResult.resultArray = [];
        //       groupResult.errorMessage = carAmlResponse.message;
        //     }
        //   }else{
        //     groupResult.resultArray = [];
        //   }
        //   groupResult.title = AppConstant.msOuterCarAmbulanceLicense;
        //   groupResultArray.add(groupResult);
        // }

        //TODO: Response New API EmergencyCar
        else if (category == AppConstant.dbInnerCarEmergency) {
          final emgcCarResponse = response as EmgcCarResponseDto;
          if (emgcCarResponse != null) {
            if (emgcCarResponse.status == AppConstant.statusSuccess) {
              final listEmgCar = emgcCarResponse.listEmergencyCarDto!.data;
              groupResult.resultArray =
                  ResultMapper().mapEmergencyCar((listEmgCar));
            } else {
              groupResult.resultArray = [];
              groupResult.errorMessage = emgcCarResponse.message;
            }
          } else {
            groupResult.resultArray = [];
          }
          groupResult.title = AppConstant.msInnerCarEmergency;
          groupResultArray.add(groupResult);
        }

        /// RESPONSE - OUTER - case AppConstant.kSearchInfo:
      } else {
        GroupResult groupResult = GroupResult();
        groupResult.category = category;
        groupResult.resultArray = [];
        groupResult.title = _getCategoryTitle(category);
        groupResult.errorMessage = "ไม่พบข้อมูล";

        StringUtils.log("ERROR Add groupResult: ${groupResult.errorMessage}");

        groupResultArray.add(groupResult);
      }
    } on Exception catch (obj) {
      StringUtils.log('================ ERROR ================');

      GroupResult groupResult = GroupResult();
      groupResult.category = category;
      groupResult.resultArray = [];
      groupResult.title = _getCategoryTitle(category);
      await _handleSearchException(obj, groupResult);

      StringUtils.log("ERROR Add groupResult: ${groupResult.errorMessage}");

      groupResultArray.add(groupResult);
    }

    if (queueDbArray.length > 0) {
      await nextQueue();
    }
  }

  String _getCategoryTitle(String category) {
    String title = "";
    switch (category) {
      // Person Inner
      case AppConstant.dbInnerPersonHasAya:
        title = AppConstant.msInnerPersonHasAya;
        break;
      case AppConstant.dbInnerPersonDoAya:
        title = AppConstant.msInnerPersonDoAya;
        break;
      //case AppConstant.dbInnerPersonHasTraffic: title = AppConstant.msInnerPersonHasTraffic; break;
      case AppConstant.dbInnerPersonDoTraffic:
        title = AppConstant.msInnerPersonDoTraffic;
        break;
      case AppConstant.dbInnerPersonWarrantCRD:
        title = AppConstant.msInnerPersonWarrantCRD;
        break;
      case AppConstant.dbInnerPersonWarrantCourtCRD:
        title = AppConstant.msInnerPersonWarrantCourtCRD;
        break;
      case AppConstant.dbInnerPersonRedNotice:
        title = AppConstant.msInnerPersonRedNotice;
        break;
      case AppConstant.dbInnerPersonFaceRec:
        title = AppConstant.msInnerPersonFaceRec;
        break;

      // Person Outer
      case AppConstant.dbOuterPersonCivil:
        title = AppConstant.msOuterPersonCivil;
        break;
      case AppConstant.dbOuterPersonForeign:
        title = AppConstant.msOuterPersonForeign;
        break;
      case AppConstant.dbOuterPersonLinkage:
        title = AppConstant.msOuterPersonLinkage;
        break;
      case AppConstant.dbOuterPersonCarLicense:
        title = AppConstant.msOuterPersonCarLicense;
        break;
      case AppConstant.dbOuterPersonBusLicense:
        title = AppConstant.msOuterPersonBusLicense;
        break;
      case AppConstant.dbOuterPersonCar:
        title = AppConstant.msOuterPersonCar;
        break;
      case AppConstant.dbOuterPersonSocialEmployee:
        title = AppConstant.msOuterPersonSocialEmployee;
        break;
      case AppConstant.dbOuterPersonSocialHospital:
        title = AppConstant.msOuterPersonSocialHospital;
        break;
      case AppConstant.dbOuterPersonSocialEmployer:
        title = AppConstant.msOuterPersonSocialEmployer;
        break;
      case AppConstant.dbOuterPersonHealth:
        title = AppConstant.msOuterPersonHealth;
        break;
      case AppConstant.dbOuterPersonImmigration:
        title = AppConstant.msOuterPersonImmigration;
        break;
      case AppConstant.dbOuterPersonExtension:
        title = AppConstant.msOuterPersonExtension;
        break;
      case AppConstant.dbOuterPersonForeignHouse:
        title = AppConstant.msOuterPersonForeignHouse;
        break;
      case AppConstant.dbOuterPersonTraffic:
        title = AppConstant.msOuterPersonTraffic;
        break;
      case AppConstant.dbOuterPersonP4:
        title = AppConstant.msOuterPersonP4;
        break;
      case AppConstant.dbOuterPersonPrisoner:
        title = AppConstant.msOuterPersonPrisoner;
        break;

      case AppConstant.dbOuterPersonAlien:
        title = AppConstant.msOuterPersonAlien;
        break;
      case AppConstant.dbOuterPersonWorker:
        title = AppConstant.msOuterPersonWorker;
        break;
      case AppConstant.dbOuterPersonNonThai:
        title = AppConstant.msOuterPersonNonThai;
        break;
      case AppConstant.dbOuterPersonNoRegis:
        title = AppConstant.msOuterPersonNoRegis;
        break;
      case AppConstant.dbOuterPersonMigwis:
        title = AppConstant.msOuterPersonMigwis;
        break;

      //MockUp Rescue
      // case AppConstant.dbOuterPersonRescueVolunteer: title = AppConstant.msOuterPersonRescueVolunteer; break;

      // Car Inner
      case AppConstant.dbInnerCarAya:
        title = AppConstant.msInnerCarAya;
        break;
      case AppConstant.dbInnerCarLost:
        title = AppConstant.msInnerCarLost;
        break;
      // case AppConstant.dbInnerCarWanted: title = AppConstant.msInnerCarWanted; break;
      case AppConstant.dbInnerCarTraffic:
        title = AppConstant.msInnerCarTraffic;
        break;
      case AppConstant.dbInnerCarEmergency:
        title = AppConstant.msInnerCarEmergency;
        break;
      // Car Outer
      case AppConstant.dbOuterCarCar:
        title = AppConstant.msOuterCarCar;
        break;
      case AppConstant.dbOuterCarTraffic:
        title = AppConstant.msOuterCarTraffic;
        break;

      // Info Inner
      case AppConstant.dbInnerInfoAya:
        title = AppConstant.msInnerInfoAya;
        break;
      case AppConstant.dbInnerInfoPersonSS:
        title = AppConstant.msInnerInfoPersonSS;
        break;
      case AppConstant.dbInnerInfoTraffic:
        title = AppConstant.msInnerInfoTraffic;
        break;
      case AppConstant.dbInnerInfoPersonTC:
        title = AppConstant.msInnerInfoPersonTC;
        break;
      case AppConstant.dbInnerInfoVehicleCc:
        title = AppConstant.msInnerInfoVehicleCc;
        break;
      case AppConstant.dbInnerInfoVehicleTc:
        title = AppConstant.msInnerInfoVehicleTc;
        break;
    }
    return title;
  }

  Future<void> _handleSearchException(
      Object obj, GroupResult groupResult) async {
    switch (obj.runtimeType) {
      case DioError:
        final type = (obj as DioError).type;
        if (type == DioErrorType.connectionTimeout) {
          showError = true;
          errorTitle = AppMessage.error;
          errorMessage = AppMessage.connectedTimeout;
          groupResult.errorMessage = errorMessage;
        } else {
          final response = (obj as DioError).response;
          final statusCode = response!.statusCode!;

          if (statusCode >= 400 && statusCode < 500) {
            final responseDto = CommonResponseDto.fromJson(
                gsonDecode(response.data.toString()));
            errorTitle = AppMessage.error;
            errorMessage = responseDto.message;
            groupResult.errorMessage = errorMessage;

            if (statusCode == 400) {
            } else if (statusCode == 401) {
              await KeyUtils.clearAll();
              openLogin = true;
              status = ActionStatus.error;
            } else if (statusCode == 402) {
              openWaitSMS = true;
              status = ActionStatus.error;
            } else if (statusCode == 403) {
              openWaitAdmin = true;
              status = ActionStatus.error;
            } else if (statusCode == 404) {
              openRegisterPin = true;
              status = ActionStatus.error;
            } else if (statusCode == 405) {
              openRegisterBiometrics = true;
              status = ActionStatus.error;
            } else if (statusCode == 406) {
              openVerifyPin = true;
              status = ActionStatus.error;
            }
          } else {
            errorTitle = AppMessage.error;
            errorMessage = AppMessage.pleaseTryAgain;
            groupResult.errorMessage = errorMessage;
          }
        }

        break;
      default:
        errorTitle = AppMessage.error;
        errorMessage = AppMessage.pleaseTryAgain;
        groupResult.errorMessage = errorMessage;
        break;
    }
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
  bool openGPSDisabled = false;
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



//fortest

// 2
// serviceArray.add(ApiClient().getCrimeCaseByFullcaseNo('70143', '2563', '1'));
// serviceArray.add(ApiClient().getCrimeCaseByObjectId('336644072155180105'));

// 3
// serviceArray.add(ApiClient().getCrimeCasePersonByPid('1430300177652'));  // data,nonce null
// serviceArray.add(ApiClient().getCrimeCasePersonByPasId('CC6742117', 'เมียนมาร์'));
// serviceArray.add(ApiClient().getCrimeCasePersonByName('แดนชัย', 'ตุ่นเงิน'));
// serviceArray.add(ApiClient().getCrimeCasePersonByFullcaseNo('70143', '2563', '1'));
// serviceArray.add(ApiClient().getCrimeCasePersonByObjectId('123286039818796956'));

// 4
// serviceArray.add(ApiClient().getCrimeCaseVehicleByFullNoPlate('สมุทรปราการ', '84', '2796', '0'));
// serviceArray.add(ApiClient().getCrimeCaseVehicleByFullEngineNo('J08EWJH56288', '0'));
// serviceArray.add(ApiClient().getCrimeCaseVehicleByFullcaseNo('54246', '2563', '1'));
// serviceArray.add(ApiClient().getCrimeCaseVehicleByObjectId('16156663663271184'));   // array []

// 5
// serviceArray.add(ApiClient().getTrafficCaseByFullcaseNo('70143', '2563', '1'));
// serviceArray.add(ApiClient().getTrafficCaseByObjectId('535083930727633261'));

// 6
// serviceArray.add(ApiClient().getTrafficCasePersonByPid('3100903106918'));
// serviceArray.add(ApiClient().getTrafficCasePersonByPasId('AK478597', 'แคนาดา'));
// serviceArray.add(ApiClient().getTrafficCasePersonByName('อัฐชา', 'ชมโคกกรวด'));
// serviceArray.add(ApiClient().getTrafficCasePersonByFullcaseNo('71042', '2563', '5'));
// serviceArray.add(ApiClient().getTrafficCasePersonByObjectId('537898680495764540'));

// 7
// serviceArray.add(ApiClient().getTrafficCaseVehicleByFullNoPlate('ศรีสะเกษ', 'นข', '2079', '0'));
// serviceArray.add(ApiClient().getTrafficCaseVehicleByFullEngineNo('4JJ1TM5273', '0'));
// serviceArray.add(ApiClient().getTrafficCaseVehicleByFullcaseNo('70026', '2563', '47'));
// serviceArray.add(ApiClient().getTrafficCaseVehicleByObjectId('534802455751339554'));

///-------------

// serviceArray.add(ApiClient().getVehicleInfoByPid('1101401054690'));
// serviceArray.add(ApiClient().getVehicleInfoByName('วัชรัช', 'สุวรรณรัตน์'));
// serviceArray.add(ApiClient().getVehicleInfoByPlate('7กช', '5896', '00100', '1'));
// serviceArray.add(ApiClient().getVehicleInfoByNumBody('MNTBAAN17Z0576160', 'N09'));

// serviceArray.add(ApiClient().getDriverLicenceInfoByPid('1101401054690', '24'));
// serviceArray.add(ApiClient().getDriverLicenceInfoByName('วัชรัช', 'สุวรรณรัตน์', '24'));

// serviceArray.add(ApiClient().getPublicLicenceInfoByPid('1749900035404', '22'));
// serviceArray.add(ApiClient().getPublicLicenceInfoByName('ชนะพล', 'วงศ์กำจัดภัย', '22'));

// serviceArray.add(ApiClient().getEmployeeEmploymentByPid('1101401054690'));
// serviceArray.add(ApiClient().getSelectHospitalPid('1101401054690'));
// serviceArray.add(ApiClient().getEmployerDetail('1200186184', '000000'));

// serviceArray.add(ApiClient().getHealthInsuranceByPid('1101401054690'));

// serviceArray.add(ApiClient().getTravelDetailByPassport('AA8702381'));
// serviceArray.add(ApiClient().getTravelDetailByPid('1101401054690'));
// serviceArray.add(ApiClient().getTravelDetailByTmRunno('418509198M'));

// serviceArray.add(ApiClient().getTm61DetailByPassport('AA8702381'));
// serviceArray.add(ApiClient().getTm61DetailByName('LIKUI', 'LIAO'));
// serviceArray.add(ApiClient().getTm61DetailByPassport('E01585222'));

// serviceArray.add(ApiClient().getAllTickeList('', '2กฬ', '6430', '00100', ''));
// serviceArray.add(ApiClient().getAllTickeList('', '', '', '', '0163002560340'));
// serviceArray.add(ApiClient().getAllTickeList('1100501433501', '', '', '', ''));
// serviceArray.add(ApiClient().getAllTickeListByName('รัตนพล', 'นิ่มอนงค์'));

// serviceArray.add(ApiClient().getGunDetailByPid('1679900166011'));