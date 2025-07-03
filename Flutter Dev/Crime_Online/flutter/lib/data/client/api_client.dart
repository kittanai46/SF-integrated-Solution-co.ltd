import 'dart:convert';

import 'package:crimes/config/app_constant.dart';
import 'package:crimes/data/client/request/auth/check_version_request_dto.dart';
import 'package:crimes/data/client/request/auth/login_scanqr_crimes_request_dto.dart';
import 'package:crimes/data/client/request/auth/nearest_station_request_dto.dart';
import 'package:crimes/data/client/request/auth/responsible_station_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_getscope_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_lk2_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_regis_request_dto.dart';
import 'package:crimes/data/client/request/auth/thaid_renew_request_dto.dart';
import 'package:crimes/data/client/request/auth/update_pushtoken_request_dto.dart';
import 'package:crimes/data/client/request/inner/fullcaseno_request_dto.dart';
import 'package:crimes/data/client/request/inner/fullengineno_request_dto.dart';
import 'package:crimes/data/client/request/inner/fullnoplate_request_dto.dart';
import 'package:crimes/data/client/request/inner/licensenumber_request_dto.dart';
import 'package:crimes/data/client/request/inner/objectid_request_dto.dart';
import 'package:crimes/data/client/request/inner/pasid_request_dto.dart';
import 'package:crimes/data/client/request/inner/plate_emc_request_dto.dart';
import 'package:crimes/data/client/request/inner/warrant_address_request_dto.dart';
import 'package:crimes/data/client/request/inner/warrant_charge_request_dto.dart';
import 'package:crimes/data/client/request/inner/warrant_court_request_dto.dart';
import 'package:crimes/data/client/request/inner/warrant_name_request_dto.dart';
import 'package:crimes/data/client/request/inner/warrant_orgcode_request_dto.dart';
import 'package:crimes/data/client/request/outer/face_request_dto.dart';
import 'package:crimes/data/client/request/outer/gun_request_dto.dart';
import 'package:crimes/data/client/request/outer/plate_request_dto.dart';
import 'package:crimes/data/client/request/outer/prisonimg_request_dto.dart';
import 'package:crimes/data/client/request/profile/update_favorite_request_dto.dart';
import 'package:crimes/data/client/request/profile/update_notify_request_dto.dart';
import 'package:crimes/data/client/request/outer/report_request_dto.dart';
import 'package:crimes/data/client/response/auth/check_version_response_dto.dart';
import 'package:crimes/data/client/response/auth/generate_thaidstate_response_dto.dart';
import 'package:crimes/data/client/response/auth/get_token_response_dto.dart';
import 'package:crimes/data/client/response/auth/login_scanqr_crimes_response_dto.dart';
import 'package:crimes/data/client/response/auth/nearest_station_response_dto.dart';
import 'package:crimes/data/client/response/auth/responsible_station_response_dto.dart';
import 'package:crimes/data/client/response/auth/thaid_getscope_response_dto.dart';
import 'package:crimes/data/client/response/auth/thaid_regis_response_dto.dart';
import 'package:crimes/data/client/response/auth/thaid_renew_response_dto.dart';
import 'package:crimes/data/client/response/inner/emergencycar/emergency_car_response_dto.dart';
import 'package:crimes/data/client/response/inner/warrant/get_rednotice_response_dto.dart';
import 'package:crimes/data/client/response/inner/warrant/get_warrant_crd_response_dto.dart';
import 'package:crimes/data/client/response/inner/warrant/get_warrantcourt_crd_response_dto.dart';
import 'package:crimes/data/client/response/outer/cib/face_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/extension_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/imm_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/alien_person_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/alien_worker_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/lk2_group1_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/person_nonthai_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/person_noregis_response_dto.dart';
import 'package:crimes/data/client/response/outer/rescue/car_ambulance_license_response_dto.dart';
import 'package:crimes/data/client/response/outer/rescue/car_flashing_light_license_response_dto.dart';
import 'package:crimes/data/client/response/outer/rescue/person_rescue_training_response_dto.dart';
import 'package:crimes/data/client/response/outer/rescue/person_rescue_volunteer_response_dto.dart';
import 'package:crimes/data/client/response/outer/warrantcourt/get_warrantcourt_response_dto.dart';
import 'package:crimes/data/client/response/profile/eula_response_dto.dart';
import 'package:crimes/data/client/response/inner/crimecase/get_crimecase_person_response_dto.dart';
import 'package:crimes/data/client/response/inner/crimecase/get_crimecase_response_dto.dart';
import 'package:crimes/data/client/response/inner/crimecase/get_crimecase_vehicle_response_dto.dart';
import 'package:crimes/data/client/response/inner/trafficcase/get_trafficcase_person_response_dto.dart';
import 'package:crimes/data/client/response/inner/trafficcase/get_trafficcase_response_dto.dart';
import 'package:crimes/data/client/response/inner/trafficcase/get_trafficcase_vehicle_response_dto.dart';
import 'package:crimes/data/client/response/profile/get_notify_response_dto.dart';
import 'package:crimes/data/client/response/outer/car/driver_license_info_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/card_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/change_address_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/change_name_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/house_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/idc_bp1_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/idc_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/number_resident_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/person_response_dto.dart';
import 'package:crimes/data/client/response/outer/civil/pop_house_response_dto.dart';
import 'package:crimes/data/client/response/outer/common/image_response_dto.dart';
import 'package:crimes/data/client/response/outer/foreign/worker_response_dto.dart';
import 'package:crimes/data/client/response/outer/foreignhouse/tm61_response_dto.dart';
import 'package:crimes/data/client/response/outer/health/health_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/travel_response_dto.dart';
import 'package:crimes/data/client/response/outer/immigration/travel_visa_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/card_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/changename_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/house_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/make_card_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/move_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/person_inhouse_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/linkage/person_lk_response_dto.dart';
import 'package:crimes/data/client/response/outer/p4/gun_response_dto.dart';
import 'package:crimes/data/client/response/outer/report/report_dto.dart';
import 'package:crimes/data/client/response/outer/social/employer_response_dto.dart';
import 'package:crimes/data/client/response/outer/social/employment_response_dto.dart';
import 'package:crimes/data/client/response/outer/social/hospital_response_dto.dart';
import 'package:crimes/data/client/response/outer/traffic/ticket_response_dto.dart';
import 'package:crimes/data/client/response/auth/policestation_response_dto.dart';
import 'package:crimes/data/client/response/profile/news_response_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_person_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_vehicle_dto.dart';
import 'package:crimes/data/dto/inner/emergency/emergency_car_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_person_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_vehicle_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrantcrd_dto.dart';
import 'package:crimes/data/dto/outer/car/driver_license_info_dto.dart';
import 'package:crimes/data/dto/outer/car/vehicle_info_dto.dart';
import 'package:crimes/data/dto/outer/civil/card_dto.dart';
import 'package:crimes/data/dto/outer/civil/change_address_dto.dart';
import 'package:crimes/data/dto/outer/civil/change_name_dto.dart';
import 'package:crimes/data/dto/outer/civil/house_dto.dart';
import 'package:crimes/data/dto/outer/civil/idc_bp1_dto.dart';
import 'package:crimes/data/dto/outer/civil/idc_dto.dart';
import 'package:crimes/data/dto/outer/civil/number_resident_dto.dart';
import 'package:crimes/data/dto/outer/civil/person_dto.dart';
import 'package:crimes/data/dto/outer/civil/person_report_dto.dart';
import 'package:crimes/data/dto/outer/civil/pop_house_dto.dart';
import 'package:crimes/data/dto/outer/common/image_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_dto.dart';
import 'package:crimes/data/dto/database/database_dto.dart';
import 'package:crimes/data/dto/outer/foreign/worker_dto.dart';
import 'package:crimes/data/dto/outer/foreign/worker_report_dto.dart';
import 'package:crimes/data/dto/outer/foreignhouse/tm61_dto.dart';
import 'package:crimes/data/dto/outer/health/health_dto.dart';
import 'package:crimes/data/dto/outer/immigration/extension_dto.dart';
import 'package:crimes/data/dto/outer/immigration/imm_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_visa_dto.dart';
import 'package:crimes/data/dto/outer/linkage/alien_worker_report_dto.dart';
import 'package:crimes/data/dto/outer/linkage/card_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/changename_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/house_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/make_card_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/move_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_inhouse_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_lk_report_dto.dart';
import 'package:crimes/data/dto/outer/p4/gun_dto.dart';
import 'package:crimes/data/dto/outer/prisoner/prisoner_dto.dart';
import 'package:crimes/data/dto/outer/rescue/person_rescue_training_dto.dart';
import 'package:crimes/data/dto/outer/warrantcourt/warrantcourt_dto.dart';
import 'package:crimes/data/dto/profile/eula_dto.dart';
import 'package:crimes/data/dto/profile/favorite_dto.dart';
import 'package:crimes/data/dto/profile/news_dto.dart';
import 'package:crimes/data/client/request/outer/acc_request_dto.dart';
import 'package:crimes/data/client/request/auth/check_activate_request_dto.dart';
import 'package:crimes/data/client/request/common_request_dto.dart';
import 'package:crimes/data/client/request/encrypt_request_dto.dart';
import 'package:crimes/data/client/request/outer/hid_request_dto.dart';
import 'package:crimes/data/client/request/outer/house_request_dto.dart';
import 'package:crimes/data/client/request/auth/login_scanqr_request_dto.dart';
import 'package:crimes/data/client/request/outer/name_plt_request_dto.dart';
import 'package:crimes/data/client/request/outer/name_request_dto.dart';
import 'package:crimes/data/client/request/outer/numbody_request_dto.dart';
import 'package:crimes/data/client/request/outer/passport_request_dto.dart';
import 'package:crimes/data/client/request/outer/pb1_request_dto.dart';
import 'package:crimes/data/client/request/outer/pid_plt_request_dto.dart';
import 'package:crimes/data/client/request/outer/pid_request_dto.dart';
import 'package:crimes/data/client/request/outer/plate_ticket_request_dto.dart';
import 'package:crimes/data/client/request/outer/plate_vh_request_dto.dart';
import 'package:crimes/data/client/request/auth/register_biometrics_request_dto.dart';
import 'package:crimes/data/client/request/auth/register_pin_request_dto.dart';
import 'package:crimes/data/client/request/outer/tmrunno_request_dto.dart';
import 'package:crimes/data/client/request/inner/warrant_pid_request_dto.dart';
import 'package:crimes/data/client/request/outer/workerid_request_dto.dart';
import 'package:crimes/data/client/response/common_response_dto.dart';
import 'package:crimes/data/client/response/auth/generate_passcode_response_dto.dart';
import 'package:crimes/data/client/response/auth/get_user_response_dto.dart';
import 'package:crimes/data/client/response/outer/car/get_vehicle_info_response_dto.dart';
import 'package:crimes/data/client/response/inner/warrant/get_warrant_response_dto.dart';
import 'package:crimes/data/client/response/outer/prisoner/prisoner_response_dto.dart';
import 'package:crimes/data/client/response/auth/login_scanqr_response_dto.dart';
import 'package:crimes/data/dto/outer/social/report_sso_dto.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';
import 'package:crimes/data/dto/profile/policestation_dto.dart';
import 'package:crimes/data/dto/outer/social/employer_dto.dart';
import 'package:crimes/data/dto/outer/social/employment_dto.dart';
import 'package:crimes/data/dto/outer/social/hospital_dto.dart';
import 'package:crimes/data/client/service_api.dart';
import 'package:crimes/data/client/client_builder.dart';
import 'package:crimes/data/common/api_result_extractor.dart';
import 'package:crimes/data/dto/outer/traffic/ticket_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrant_dto.dart';
import 'package:crimes/data/entity/database.dart';
import 'package:crimes/data/mapper/database_mapper.dart';
import 'package:crimes/resource/app_message.dart';
import 'package:crimes/screen/search/param_scope.dart';
import 'package:crimes/util/crypto_utils.dart';
import 'package:crimes/data/dto/outer/immigration/travel_report_dto.dart';
import 'package:crimes/util/key_utils.dart';
import 'package:crimes/util/string_utils.dart';
import 'package:dio/dio.dart';

import '../dto/inner/warrant/rednotice_dto.dart';
import '../dto/inner/warrant/warrantcourtcrd_dto.dart';
import '../dto/outer/cib/face_dto.dart';
import '../dto/outer/linkage/alien_person_dto.dart';
import '../dto/outer/linkage/alien_person_report_dto.dart';
import '../dto/outer/linkage/alien_worker_dto.dart';
import '../dto/outer/linkage/lk2_group1_dto.dart';
import '../dto/outer/linkage/person_nonthai_dto.dart';
import '../dto/outer/linkage/person_nonthai_report_dto.dart';
import '../dto/outer/linkage/person_noregis_dto.dart';
import '../dto/outer/linkage/person_noregis_report_dto.dart';
import '../dto/outer/rescue/car_ambulance_license_dto.dart';
import '../dto/outer/rescue/car_flashing_light_license_dto.dart';
import '../dto/outer/rescue/person_rescue_volunteer_dto.dart';

class ApiClient with ApiResultExtractor {

  AllDatabase getListDB(String type, UserDto userDto, ParamScope paramScope, bool fromFavorite) {
    List<DatabaseDto> innerDbArray = [];
    List<DatabaseDto> outerDbArray = [];

    //TODO: Filter list by flag and paramScope
    // Inner
    switch (type) {
      case AppConstant.kSearchPerson:
        {
          if (userDto.roleSearchInternal!.flagPersonSs!) {
            if (paramScope.hasInputPid || paramScope.hasInputPasId ||
                paramScope.hasInputNames /*|| paramScope.hasInputFullcaseNo*/) {
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonDoAya,
                  category: AppConstant.dbInnerPersonDoAya,
                  enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonDoAya,
                  category: AppConstant.dbInnerPersonDoAya,
                  enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
            }
          }

          if (userDto.roleSearchInternal!.flagPersonTc!) {
            if (paramScope.hasInputPid || paramScope.hasInputPasId ||
                paramScope.hasInputNames /*|| paramScope.hasInputFullcaseNo*/) {
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonDoTraffic,
                  category: AppConstant.dbInnerPersonDoTraffic,
                  enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonDoTraffic,
                  category: AppConstant.dbInnerPersonDoTraffic,
                  enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
            }
          }

          if (userDto.roleSearchInternal!.flagPersonWr!) {
            if (paramScope.hasInputPid || paramScope.hasInputNames ||
                paramScope.hasInputWrAddress || paramScope.hasInputCourt ||
                paramScope.hasInputOrgCode) {
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonHasAya,
                  category: AppConstant.dbInnerPersonHasAya, enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonHasAya,
                  category: AppConstant.dbInnerPersonHasAya, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
            }
          }

          // if (userDto.roleSearchInternal!.flagPersonWr!) {
          //   if (paramScope.hasInputPid || paramScope.hasInputNames ||
          //       paramScope.hasInputWrAddress || paramScope.hasInputCourt ||
          //       paramScope.hasInputOrgCode) {
          //     innerDbArray.add(DatabaseDto(
          //         title: AppConstant.msInnerPersonHasTraffic,
          //         category: AppConstant.dbInnerPersonHasTraffic, enable: true));
          //   } else if(!fromFavorite){
          //     innerDbArray.add(DatabaseDto(
          //         title: AppConstant.msInnerPersonHasTraffic,
          //         category: AppConstant.dbInnerPersonHasTraffic,
          //         enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
          //   }
          // }

          if (userDto.roleSearchInternal!.flagPersonWr!) {
            if (paramScope.hasInputPid || paramScope.hasInputNames ||
                paramScope.hasInputWrAddress || paramScope.hasInputCourt ||
                paramScope.hasInputOrgCode) {
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonWarrantCRD,
                  category: AppConstant.dbInnerPersonWarrantCRD, enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonWarrantCRD,
                  category: AppConstant.dbInnerPersonWarrantCRD,
                  enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
            }
          }

          if (userDto.roleSearchInternal!.flagPersonWr!) {
            if (paramScope.hasInputPid || paramScope.hasInputNames) {
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonWarrantCourtCRD,
                  category: AppConstant.dbInnerPersonWarrantCourtCRD, enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerPersonWarrantCourtCRD,
                  category: AppConstant.dbInnerPersonWarrantCourtCRD,
                  enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
            }
          }
        }
        if (userDto.roleSearchInternal!.flagPersonWr!) {
          if (paramScope.hasInputNames) {
            innerDbArray.add(DatabaseDto(
                title: AppConstant.msInnerPersonRedNotice,
                category: AppConstant.dbInnerPersonRedNotice, enable: true));
          } else if(!fromFavorite){
            innerDbArray.add(DatabaseDto(
                title: AppConstant.msInnerPersonRedNotice,
                category: AppConstant.dbInnerPersonRedNotice,
                enable: false,hintKeyword: "โปรดระบุ ชื่อ-สกุล"));
          }
        }
        if (userDto.roleSearchInternal!.flagPersonWr!) {
          if (paramScope.hasInputImg) {
            innerDbArray.add(DatabaseDto(
                title: AppConstant.msInnerPersonFaceRec,
                // title: 'บุคคลจากหน้าใบหน้า',
                category: AppConstant.dbInnerPersonFaceRec, enable: true));
          } else if(!fromFavorite){
            innerDbArray.add(DatabaseDto(
                title: AppConstant.msInnerPersonFaceRec,
                category: AppConstant.dbInnerPersonFaceRec,
                enable: false,hintKeyword: "โปรดระบุ ภาพใบหน้า"));
          }
        }

        break;

      case AppConstant.kSearchCar:
        {
          if (userDto.roleSearchInternal!.flagVehicleCc!) {
            if (paramScope.hasInputFullNoPlate ||
                paramScope.hasInputFullEngineNo) {
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarAya,
                  category: AppConstant.dbInnerCarAya,
                  enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarAya,
                  category: AppConstant.dbInnerCarAya,
                  enable: false,hintKeyword: "โปรดระบุ หมายเลขทะเบียน หรือ หมายเลขเครื่องยนต์"));
            }
          }
          if (userDto.roleSearchInternal!.flagVehicleTc!) {
            if (paramScope.hasInputFullNoPlate ||
                paramScope.hasInputFullEngineNo) {
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarTraffic,
                  category: AppConstant.dbInnerCarTraffic, enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarTraffic,
                  category: AppConstant.dbInnerCarTraffic, enable: false,hintKeyword: "โปรดระบุ หมายเลขทะเบียน หรือ หมายเลขเครื่องยนต์"));
            }
          }
          if (userDto.roleSearchInternal!.flagVehicleCc!) {
            if (paramScope.hasInputFullNoPlate ||
                paramScope.hasInputFullEngineNo) {
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarLost,
                  category: AppConstant.dbInnerCarLost,
                  enable: true));
              // innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarWanted,
              //     category: AppConstant.dbInnerCarWanted,
              //     enable: true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarLost,
                  category: AppConstant.dbInnerCarLost,
                  enable: false,hintKeyword: "โปรดระบุ หมายเลขทะเบียน หรือ หมายเลขเครื่องยนต์"));
              // innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarWanted,
              //     category: AppConstant.dbInnerCarWanted,
              //     enable: false,hintKeyword: "โปรดระบุ หมายเลขทะเบียน หรือ หมายเลขเครื่องยนต์"));
            }
          }
        }
        if (userDto.roleSearchInternal!.flagVehicleCc!) {
          //if (paramScope.hasInputPlate || paramScope.hasInputLicenseNumber) {
          if (paramScope.hasInputFullNoPlate || paramScope.hasInputLicenseNumber) {
            innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarEmergency,
                category: AppConstant.dbInnerCarEmergency,
                enable: true));
          } else if(!fromFavorite){
            innerDbArray.add(DatabaseDto(title: AppConstant.msInnerCarEmergency,
                category: AppConstant.dbInnerCarEmergency,
                enable: false,hintKeyword: "โปรดระบุ หมายเลขทะเบียน หรือ เลขหนังสืออนุญาต"));
          }
        }
        break;

      case AppConstant.kSearchWeapon:
        {

        }
        break;

      case AppConstant.kSearchInfo:
        {
          if(userDto.roleSearchInternal!.flagCrimecase!){
            if(paramScope.hasInputFullcaseNo){
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerInfoAya, category: AppConstant.dbInnerInfoAya,enable:true));
            }else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerInfoAya, category: AppConstant.dbInnerInfoAya,enable:false,hintKeyword: "โปรดระบุ หมายเลขคดี ปีคดี"));
            }
          }
          if(userDto.roleSearchInternal!.flagPersonSs!){
             if(paramScope.hasInputFullcaseNo) {
               innerDbArray.add(DatabaseDto(
                   title: AppConstant.msInnerInfoPersonSS,
                   category: AppConstant.dbInnerInfoPersonSS,enable:true));
             }else if(!fromFavorite){
               innerDbArray.add(DatabaseDto(
                   title: AppConstant.msInnerInfoPersonSS,
                   category: AppConstant.dbInnerInfoPersonSS,enable:false,hintKeyword: "โปรดระบุ หมายเลขคดี ปีคดี"));
             }
          }
          if(userDto.roleSearchInternal!.flagTrafficcase!){
            if(paramScope.hasInputFullcaseNo){
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerInfoTraffic, category: AppConstant.dbInnerInfoTraffic,enable:true));
            }else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(title: AppConstant.msInnerInfoTraffic, category: AppConstant.dbInnerInfoTraffic,enable:false,hintKeyword: "โปรดระบุ หมายเลขคดี ปีคดี"));
            }
          }


          if(userDto.roleSearchInternal!.flagPersonTc!) {
            if (paramScope.hasInputFullcaseNo) {
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerInfoPersonTC,
                  category: AppConstant.dbInnerInfoPersonTC,enable:true));
            } else if(!fromFavorite){
              innerDbArray.add(DatabaseDto(
                  title: AppConstant.msInnerInfoPersonTC,
                  category: AppConstant.dbInnerInfoPersonTC,enable:false,hintKeyword: "โปรดระบุ หมายเลขคดี ปีคดี"));
            }
          }

          if(userDto.roleSearchInternal!.flagVehicleCc!) {
              if(paramScope.hasInputFullcaseNo) {
                innerDbArray.add(DatabaseDto(
                    title: AppConstant.msInnerInfoVehicleCc,
                    category: AppConstant.dbInnerInfoVehicleCc,enable:true));
              }else if(!fromFavorite){
                innerDbArray.add(DatabaseDto(
                    title: AppConstant.msInnerInfoVehicleCc,
                    category: AppConstant.dbInnerInfoVehicleCc,enable:false,hintKeyword: "โปรดระบุ หมายเลขคดี ปีคดี"));
              }
          }

          if(userDto.roleSearchInternal!.flagVehicleTc!) {
              if(paramScope.hasInputFullcaseNo) {
                innerDbArray.add(DatabaseDto(
                    title: AppConstant.msInnerInfoVehicleTc,
                    category: AppConstant.dbInnerInfoVehicleTc,enable:true));
              }else if(!fromFavorite){
                innerDbArray.add(DatabaseDto(
                    title: AppConstant.msInnerInfoVehicleTc,
                    category: AppConstant.dbInnerInfoVehicleTc,enable:false,hintKeyword: "โปรดระบุ หมายเลขคดี ปีคดี"));
              }
          }
        }
        break;
      case AppConstant.kSearchFirm:
        {

        }
        break;
      case AppConstant.kSearchAsset:
        {

        }
        break;
    }
    StringUtils.log("-->>> roleSearchExternal: ${userDto.roleSearchExternal}");
    // Outer
    switch (type) {
      case AppConstant.kSearchPerson: {

          if(userDto.roleSearchExternal?.flagPersonWarrantCourt != null){
            if (paramScope.hasInputPid || paramScope.hasInputNames) {
              outerDbArray.add(
                  DatabaseDto(title: AppConstant.msOuterPersonWarrantCourt,
                      category: AppConstant.dbOuterPersonWarrantCourt,enable:true));
            } else if(!fromFavorite){
              outerDbArray.add(
                  DatabaseDto(title: AppConstant.msOuterPersonWarrantCourt,
                      category: AppConstant.dbOuterPersonWarrantCourt,enable:false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
            }
          }

        if (userDto.roleSearchExternal!.flagPersonDopaLinkage!) {
          if (paramScope.hasInputPid || paramScope.hasInputNames) {
            outerDbArray.add(
                DatabaseDto(title: AppConstant.msOuterPersonLinkage,
                    category: AppConstant.dbOuterPersonLinkage, enable: true));
          } else if (!fromFavorite) {
            outerDbArray.add(
                DatabaseDto(title: AppConstant.msOuterPersonLinkage,
                    category: AppConstant.dbOuterPersonLinkage,
                    enable: false,
                    hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonDopa!) {
          if (paramScope.hasInputPid || paramScope.hasInputNames) {
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonCivil,
                category: AppConstant.dbOuterPersonCivil, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonCivil,
                category: AppConstant.dbOuterPersonCivil, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonDoe!) {
          if (paramScope.hasInputWorkerId) {
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonForeign,
                category: AppConstant.dbOuterPersonForeign, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonForeign,
                category: AppConstant.dbOuterPersonForeign, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรคนต่างด้าว"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonDlt!) {
          if (paramScope.hasInputPidPlt1 || paramScope.hasInputNamesPlt1) {
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonCarLicense,
                category: AppConstant.dbOuterPersonCarLicense, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonCarLicense,
                category: AppConstant.dbOuterPersonCarLicense, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน และประเภทบัตรใบอนุญาตขับรถ"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonDlt!) {
          if (paramScope.hasInputPidPlt2 || paramScope.hasInputNamesPlt2) {
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonBusLicense,
                category: AppConstant.dbOuterPersonBusLicense, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonBusLicense,
                category: AppConstant.dbOuterPersonBusLicense, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน และประเภทบัตรใบอนุญาตขับรถ-ขนส่ง"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonDlt!) {
          if (paramScope.hasInputPid || paramScope.hasInputNames ||
              paramScope.hasInputPlateProv || paramScope.hasInputNumBody || paramScope.hasInputPassportNo) {
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonCar,
                category: AppConstant.dbOuterPersonCar, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonCar,
                category: AppConstant.dbOuterPersonCar, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล  หรือ เลขพาสปอร์ต"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonSso!) {
          if (paramScope.hasInputPid) {
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonSocialEmployee,
                category: AppConstant.dbOuterPersonSocialEmployee,
                enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonSocialEmployee,
                category: AppConstant.dbOuterPersonSocialEmployee,
                enable: false,hintKeyword: "โปรดระบุ เลข หมายเลขบัตรประชาชน"));
          }
        }
        // if(userDto.roleSearchExternal!.flagPersonSso)
        //   outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonSocialHospital, category: AppConstant.dbOuterPersonSocialHospital));
        // if(userDto.roleSearchExternal!.flagPersonSso)
        //   outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonSocialEmployer, category: AppConstant.dbOuterPersonSocialEmployer));

        if (userDto.roleSearchExternal!.flagPersonNhso!) {
          if (paramScope.hasInputPid) {
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonHealth,
                category: AppConstant.dbOuterPersonHealth, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonHealth,
                category: AppConstant.dbOuterPersonHealth, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonTm!) {
          //if (paramScope.hasInputPassportNo || paramScope.hasInputPid  ) {
          if (paramScope.hasInputPassportNo || paramScope.hasInputNames) {
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonImmigration,
                category: AppConstant.dbOuterPersonImmigration, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonImmigration,
                //category: AppConstant.dbOuterPersonImmigration, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ เลขพาสปอร์ต"));
                category: AppConstant.dbOuterPersonImmigration, enable: false,hintKeyword: "โปรดระบุ ชื่อ-สกุล หรือ เลขพาสปอร์ต"));
          }
        }

          if (userDto.roleSearchExternal!.flagPersonTm!) {
            if (paramScope.hasInputPassportNo || paramScope.hasInputNames) {
              outerDbArray.add(DatabaseDto(
                  title: AppConstant.msOuterPersonExtension,
                  category: AppConstant.dbOuterPersonExtension, enable: true));
            } else if(!fromFavorite){
              outerDbArray.add(DatabaseDto(
                  title: AppConstant.msOuterPersonExtension,
                  category: AppConstant.dbOuterPersonExtension, enable: false,hintKeyword: "โปรดระบุ ชื่อ-สกุล หรือ เลขพาสปอร์ต"));
            }
          }

        if (userDto.roleSearchExternal!.flagPersonTm!) {
          if (paramScope.hasInputPassportNo || paramScope.hasInputNames) {
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonForeignHouse,
                category: AppConstant.dbOuterPersonForeignHouse, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(
                title: AppConstant.msOuterPersonForeignHouse,
                category: AppConstant.dbOuterPersonForeignHouse,
                enable: false,hintKeyword: "โปรดระบุ ชื่อ-สกุล หรือ เลขพาสปอร์ต"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonPtm!) {
          if (paramScope.hasInputPid || paramScope.hasInputNames) {
            outerDbArray.add(
                DatabaseDto(title: AppConstant.msOuterPersonTraffic,
                    category: AppConstant.dbOuterPersonTraffic,enable:true));
          } else if(!fromFavorite){
            outerDbArray.add(
                DatabaseDto(title: AppConstant.msOuterPersonTraffic,
                    category: AppConstant.dbOuterPersonTraffic,enable:false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonGun!) {
          if (paramScope.hasInputPid || paramScope.hasInputGunReg) {
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonP4,
                category: AppConstant.dbOuterPersonP4,enable:true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonP4,
                category: AppConstant.dbOuterPersonP4,enable:false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือหมายเลขทะเบียนอาวุธปืน"));
          }
        }

        if (userDto.roleSearchExternal!.flagPersonCorrection!) {
          if (paramScope.hasInputPid || paramScope.hasInputNames) {
            outerDbArray.add(
                DatabaseDto(title: AppConstant.msOuterPersonPrisoner,
                    category: AppConstant.dbOuterPersonPrisoner,enable:true));
          } else if(!fromFavorite){
            outerDbArray.add(
                DatabaseDto(title: AppConstant.msOuterPersonPrisoner,
                    category: AppConstant.dbOuterPersonPrisoner,enable:false,hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
          }
        }

        //จัดลำดับแหล่งข้อมูล
        if (userDto.roleSearchExternal!.flagPersonDopaLinkage!) {
          if (paramScope.hasInputPid) {
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonAlien,
                category: AppConstant.dbOuterPersonAlien, enable: true));
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonWorker,
                category: AppConstant.dbOuterPersonWorker, enable: true));
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonNonThai,
                category: AppConstant.dbOuterPersonNonThai, enable: true));
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonNoRegis,
                category: AppConstant.dbOuterPersonNoRegis, enable: true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonAlien,
                category: AppConstant.dbOuterPersonAlien, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรคนต่างด้าว"));
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonWorker,
                category: AppConstant.dbOuterPersonWorker, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรคนต่างด้าว"));
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonNonThai,
                category: AppConstant.dbOuterPersonNonThai, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรคนต่างด้าว"));
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonNoRegis,
                category: AppConstant.dbOuterPersonNoRegis, enable: false,hintKeyword: "โปรดระบุ หมายเลขบัตรคนต่างด้าว"));
          }
        }

        // if (userDto.roleSearchExternal!.flagPersonDlt!) {
        //   if (paramScope.hasInputPid || paramScope.hasInputNames) {
        //     outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonRescueVolunteer,
        //         category: AppConstant.dbOuterPersonRescueVolunteer, enable: true));
        //   } else if(!fromFavorite){
        //     outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonRescueVolunteer,
        //         category: AppConstant.dbOuterPersonRescueVolunteer, enable: false, hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
        //   }
        // }
        //
        // if (userDto.roleSearchExternal!.flagPersonDlt!) {
        //   if (paramScope.hasInputPid || paramScope.hasInputNames) {
        //     outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonRescueTraining,
        //         category: AppConstant.dbOuterPersonRescueTraining, enable: true));
        //   } else if(!fromFavorite){
        //     outerDbArray.add(DatabaseDto(title: AppConstant.msOuterPersonRescueTraining,
        //         category: AppConstant.dbOuterPersonRescueTraining, enable: false, hintKeyword: "โปรดระบุ หมายเลขบัตรประชาชน หรือ ชื่อ-สกุล"));
        //   }
        // }
      }
      break;

      case AppConstant.kSearchCar: {
        if(userDto.roleSearchExternal!.flagVerhicleDlt!) {
          if (paramScope.hasInputPlateProv || paramScope.hasInputNumBody) {
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterCarCar,
                category: AppConstant.dbOuterCarCar,enable:true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterCarCar,
                category: AppConstant.dbOuterCarCar,enable:false,hintKeyword: "โปรดระบุ หมายเลขทะเบียน หรือ หมายเลขตัวเครื่อง และ ประเภทยานพาหนะกรมขนส่ง"));
          }
        }

        if(userDto.roleSearchExternal!.flagVerhiclePtm!) {
          if (paramScope.hasInputPlateTicket) {
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterCarTraffic,
                category: AppConstant.dbOuterCarTraffic,enable:true));
          } else if(!fromFavorite){
            outerDbArray.add(DatabaseDto(title: AppConstant.msOuterCarTraffic,
                category: AppConstant.dbOuterCarTraffic,enable:false,hintKeyword: "โปรดระบุ หมายเลขทะเบียน หรือ เลขใบสั่ง"));
          }
        }

        //

        // if (userDto.roleSearchExternal!.flagVerhicleDlt!) {
        //   if (paramScope.hasInputPlate) {
        //     outerDbArray.add(DatabaseDto(title: AppConstant.msOuterCarFlashingLightLicense,
        //         category: AppConstant.dbOuterCarFlashingLightLicense, enable: true));
        //   } else if(!fromFavorite){
        //     outerDbArray.add(DatabaseDto(title: AppConstant.msOuterCarFlashingLightLicense,
        //         category: AppConstant.dbOuterCarFlashingLightLicense, enable: false, hintKeyword: "โปรดระบุ หมายเลขทะเบียน"));
        //   }
        // }
      }
      break;

      case AppConstant.kSearchWeapon: {

      }
      break;

      case AppConstant.kSearchInfo:{
        // if(userDto.roleSearchExternal!.flagPersonWarrant)
        //   outerDbArray.add(DatabaseDto(title: AppConstant.msOuterInfoPdc, category: AppConstant.dbOuterInfoPdc));
      }
      break;

      case AppConstant.kSearchFirm: {
        // if(userDto.roleSearchExternal!.flagDbd)
        //   outerDbArray.add(DatabaseDto(title: AppConstant.msOuterFirmDbd, category: AppConstant.dbOuterFirmDbd));
      }
      break;

      case AppConstant.kSearchAsset: {

      }
      break;
    }


    final mapper = DatabaseMapper();

    List<Database> innerDbs = [];
    innerDbArray.forEach((dto) {
      final database = mapper.map(dto);
      innerDbs.add(database);
    });
    List<Database> outerDbs = [];
    outerDbArray.forEach((dto) {
      final database = mapper.map(dto);
      outerDbs.add(database);
    });

    return AllDatabase(innerDbs: innerDbs, outerDbs: outerDbs);
  }

  Future<CheckVersionResponseDto> checkVersion(String version, String platform) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    StringUtils.log("checkVersion");
    final dto = CheckVersionRequestDto(version: version, platform: platform);
    final response = await serviceApi.checkVersion(dto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Check Activate Device Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> checkActivateDevice(String username) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CheckActivateRequestDto(policeId: username);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.checkActivateDevice(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Check Activate Device Success";
    // return mockResponse;
  }

  Future<LoginScanQrResponseDto> loginScanQR(String policeId, String qrcode, String deviceUdid, String deviceName, String brand, String pushToken, String osName,
      String osVersion, String buildNumber, String manufacturer, String model, String publicKey, String hasFingerprint,) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = LoginScanQrRequestDto(
      policeId: policeId,
      qrcode: qrcode,
      deviceUdid: deviceUdid,
      deviceName: deviceName,
      brand: brand,
      pushToken: pushToken,
      osName: osName,
      osVersion: osVersion,
      buildNumber: buildNumber,
      manufacturer: manufacturer,
      model: model,
      publicKey: publicKey,
      hasFingerprint: hasFingerprint,
    );
    return await serviceApi.scanQrLogin(dto);

    // fortest
    // LoginScanQrResponseDto mockResponse = LoginScanQrResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Scan QRCode Success";
    // mockResponse.key = "q5uCxZbGEblFLQCfimfXfSldUm7eX+inlwLAsflXxkw=";
    // return mockResponse;
  }

  Future<GenerateThaIDStateResponseDto> generateThaIDState() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    // final dto = LoginScanQrRequestDto(
    //   policeId: policeId,
    //   qrcode: qrcode,
    //   deviceUdid: deviceUdid,
    //   deviceName: deviceName,
    //   brand: brand,
    //   pushToken: pushToken,
    //   osName: osName,
    //   osVersion: osVersion,
    //   buildNumber: buildNumber,
    //   manufacturer: manufacturer,
    //   model: model,
    //   publicKey: publicKey,
    //   hasFingerprint: hasFingerprint,
    // );
    return await serviceApi.generateThaIDState();

    // fortest
    // LoginScanQrResponseDto mockResponse = LoginScanQrResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Scan QRCode Success";
    // mockResponse.key = "q5uCxZbGEblFLQCfimfXfSldUm7eX+inlwLAsflXxkw=";
    // return mockResponse;
  }

  Future<ThaIDGetScopeResponseDto> getThaIDScope(String thaidState) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = ThaIDGetScopeRequestDto(
      thaidState: thaidState,

    );
    return await serviceApi.getThaIDScope(dto);

    // fortest
    // LoginScanQrResponseDto mockResponse = LoginScanQrResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Scan QRCode Success";
    // mockResponse.key = "q5uCxZbGEblFLQCfimfXfSldUm7eX+inlwLAsflXxkw=";
    // return mockResponse;
  }

  Future<ThaIDRegisResponseDto> regisThaIDCrimesOnline(String deviceUDID,String deviceName,String brand
      ,String pushToken,String osName,String osVersion,String buildNumber,String manufacturer,String model
      ,String clientPublicKey,String hasFingerPrint,String thaidState,String thaidCode) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = ThaIDRegisRequestDto(
      deviceUDID: deviceUDID,
      deviceName: deviceName,
      brand: brand,
      pushToken:pushToken,
      osName:osName,
      osVersion:osVersion,
      buildNumber:buildNumber,
      manufacturer:manufacturer,
      model:model,
      clientPublicKey:clientPublicKey,
      hasFingerPrint:hasFingerPrint,
      thaidState:thaidState,
      thaidCode:thaidCode,
    );
    return await serviceApi.regisThaIDCrimesOnline(dto);

    // fortest
    // LoginScanQrResponseDto mockResponse = LoginScanQrResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Scan QRCode Success";
    // mockResponse.key = "q5uCxZbGEblFLQCfimfXfSldUm7eX+inlwLAsflXxkw=";
    // return mockResponse;
  }

  Future<ThaIDRenewResponseDto> renewThaIDCrimesOnline(String thaidState,String thaidCode) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = ThaIDRenewRequestDto(
      thaidState:thaidState,
      thaidCode:thaidCode,
    );
    return await serviceApi.renewThaIDCrimesOnline(dto);

    // fortest
    // LoginScanQrResponseDto mockResponse = LoginScanQrResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Scan QRCode Success";
    // mockResponse.key = "q5uCxZbGEblFLQCfimfXfSldUm7eX+inlwLAsflXxkw=";
    // return mockResponse;
  }



  // Future<LoginScanQrCRIMESResponseDto> loginScanQRCRIMES(String token_sid) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //
  //   final dto = LoginScanQrCRIMESRequestDto(
  //     token_sid: token_sid,
  //   );
  //   return await serviceApi.scanQrLoginCRIMES(dto);
  //
  //   // fortest
  //   // LoginScanQrResponseDto mockResponse = LoginScanQrResponseDto();
  //   // mockResponse.status = "success";
  //   // mockResponse.message = "Scan QRCode Success";
  //   // mockResponse.key = "q5uCxZbGEblFLQCfimfXfSldUm7eX+inlwLAsflXxkw=";
  //   // return mockResponse;
  // }

  Future<GenerateThaIDStateResponseDto> generateThaIDStateLK2() async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    return await serviceApi.generateThaIDStateLK2();

  }

  Future<ThaIDRegisResponseDto> loginConfirmLK2(String thaidState,String thaidCode) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = ThaIDLk2RequestDto(
      state:thaidState,
      code:thaidCode,
    );
    return await serviceApi.loginConfirmLK2(dto);
  }

  Future<CommonResponseDto> scanQrLoginCRIMES(String token_sid) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    StringUtils.log("token_sid: ${token_sid}");
    final dto = LoginScanQrCRIMESRequestDto(token_sid: token_sid);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.scanQrLoginCRIMES(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Register Pin Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> registerPin(String pin) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = RegisterPinRequestDto(pin: pin);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.registerPin(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Register Pin Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> changePin(String pin) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = RegisterPinRequestDto(pin: pin);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.changePin(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Change Pin Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> registerBiometrics(String biometricsToken) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = RegisterBiometricsRequestDto(biometricsToken: biometricsToken);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.registerBiometrics(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Register Biometrics Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> changeBiometrics(String biometricsToken) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = RegisterBiometricsRequestDto(biometricsToken: biometricsToken);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.changeBiometrics(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Register Biometrics Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> verifyBiometrics(String biometricsToken) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = RegisterBiometricsRequestDto(biometricsToken: biometricsToken);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.verifyBiometrics(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Verify Biometrics Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> verifyPin(String pin) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = RegisterPinRequestDto(pin: pin);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.verifyPin(encryptDto);
    return response;

    // fortest
    // CommonResponseDto mockResponse = CommonResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Verify Pin Success";
    // return mockResponse;
  }

  Future<CommonResponseDto> verifyPinPasscode(String pin) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = RegisterPinRequestDto(pin: pin);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.verifyPinPasscode(encryptDto);
    return response;
  }

  Future<GetUserResponseDto> getUser() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CommonRequestDto();
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getUser(encryptDto);
    String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
    StringUtils.log("getUser response: $jsonString");
    final userDto = UserDto.fromJson(jsonDecode(jsonString));
    final GetUserResponseDto response = GetUserResponseDto();
    response.status = encryptResponseDto.status;
    response.message = encryptResponseDto.message;
    response.user = userDto;

    // TODO: Handle save favorite
    String? favoriteListString = userDto.favorite;
    StringUtils.log("getUser favorite: ${favoriteListString}");

    // TODO: Set default search person with only pid --> But you have to clear mobilefavorite in db policeofficer
    List<String> choices = [];
    choices.add(AppConstant.showFormIdCard);
    List<String> innerDbs = [];
    innerDbs.add(AppConstant.dbInnerPersonHasAya);
    //innerDbs.add(AppConstant.dbInnerPersonHasTraffic);
    //innerDbs.add(AppConstant.dbInnerPersonWarrantCRD);
    //innerDbs.add(AppConstant.dbInnerPersonWarrantCourtCRD);
    List<String> outerDbs = [];
    FavoriteDto defaultFavorite = FavoriteDto(category: AppConstant.kSearchPerson, title: AppMessage.defaultSearchIdCard, choices: choices, innerDbs: innerDbs, outerDbs: outerDbs, isDefault: 'true');

    if(favoriteListString == null || favoriteListString == '' || favoriteListString == 'null') {
      List<FavoriteDto> favoriteList = [];
      favoriteList.add(defaultFavorite);
      favoriteListString = jsonEncode(favoriteList);

    } else {
      favoriteListString = Uri.decodeComponent(favoriteListString);

      //TODO: Handle add default favorite to first index
      Iterable l = json.decode(favoriteListString);
      List<FavoriteDto> favoriteList = List<FavoriteDto>.from(l.map((model)=> FavoriteDto.fromJson(model)));
      if(favoriteList.length == 0 || favoriteList[0].isDefault == null || favoriteList[0].isDefault == 'false'){
        favoriteList.insert(0, defaultFavorite);
        favoriteListString = jsonEncode(favoriteList);
      }
    }
    favoriteListString = '{"data":${favoriteListString}}';
    await KeyUtils.saveFavoriteListString(favoriteListString);

    StringUtils.log("getUser success");
    return response;

    // fortest
    // GetUserResponseDto mockResponse = GetUserResponseDto();
    // mockResponse.status = "success";
    // mockResponse.message = "Get User Success";
    // UserDto mockUser = UserDto();
    // mockUser.policeId = "ss";
    // mockUser.pid = "1100700943266";
    // mockUser.firstname = "กรณ์พงศ์";
    // mockUser.lastname = "นวนโพธิ์";
    // mockUser.rank = "พ.ต.ต.";
    // mockUser.position = "สว.";
    // mockUser.posOrg = "สว. กลุ่มงานบริหารจัดการระบบเครือข่ายสารสนเทศ ศทก.";
    // RoleSearchExternalDto mockRoleExternal = RoleSearchExternalDto();
    // mockRoleExternal.flagPersonDopa = false;
    // mockRoleExternal.flagPersonDoe = true;
    // mockRoleExternal.flagPersonDlt = false;
    // mockRoleExternal.flagPersonSso = true;
    // mockRoleExternal.flagPersonNhso = true;
    // mockRoleExternal.flagPersonDocr = true;
    // mockRoleExternal.flagPersonPrisoner = true;
    // mockRoleExternal.flagPersonCorrection = true;
    // mockRoleExternal.flagPersonTm = true;
    // mockRoleExternal.flagPersonGun = true;
    // mockRoleExternal.flagPersonPtm = true;
    // mockRoleExternal.flagVerhicleDlt = false;
    // mockRoleExternal.flagVerhiclePtm = false;
    // mockRoleExternal.flagDbd = true;
    // mockRoleExternal.flagPersonWarrant = true;
    // mockRoleExternal.flagPersonLinkage = true;
    // mockUser.roleSearchExternal = mockRoleExternal;
    // RoleSearchInternalDto mockRoleInternal = RoleSearchInternalDto();
    // mockRoleInternal.flagPersonCc = true;
    // mockRoleInternal.flagPersonTc = true;
    // mockRoleInternal.flagPersonSs = true;
    // mockRoleInternal.flagPersonWr = true;
    // mockRoleInternal.flagVehicleCc = true;
    // mockRoleInternal.flagVehicleTc = true;
    // mockRoleInternal.flagVehicleLost = true;
    // mockRoleInternal.flagWeaponCc = true;
    // mockRoleInternal.flagWeaponSs = true;
    // mockRoleInternal.flagWeaponLost = true;
    // mockRoleInternal.flagAssetCc = true;
    // mockRoleInternal.flagCrimecase = true;
    // mockRoleInternal.flagTrafficcase = true;
    // mockRoleInternal.flagCrimecaseWr = true;
    // mockRoleInternal.flagCrimecaseLc = true;
    // mockUser.roleSearchInternal = mockRoleInternal;
    // mockResponse.user = mockUser;
    // return mockResponse;
  }

  Future<GeneratePasscodeResponseDto> generatePasscode() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CommonRequestDto();
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.generatePasscode(encryptDto);
    String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
    final response = GeneratePasscodeResponseDto.fromJson(jsonDecode(jsonString));
    return response;
  }

  Future<GetTokenResponseDto> getTokenAuthSoc() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CommonRequestDto();
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getToken(encryptDto);
    String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
    final response = GetTokenResponseDto.fromJson(jsonDecode(jsonString));
    return response;
  }

  Future<CommonResponseDto> updatePushToken(String pushToken) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = UpdatePushTokenRequestDto(pushToken: pushToken);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.updatePushToken(encryptDto);
    return response;
  }

  // DOPA - ทะเบียนราษฎร (civil) ------------------------------------------------------

  Future<PersonResponseDto> getPersonDetailByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonDetailByPid(encryptDto);

    final PersonResponseDto response = PersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonDetailByPid response: $jsonString");

      final listPersonDto = ListPersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonDto = listPersonDto;
      StringUtils.log("getPersonDetailByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonDto = ListPersonDto(data: []);
      StringUtils.log("getPersonDetailByPid failed");
    }
    return response;
  }

  Future<PersonResponseDto> getPersonDetailByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonDetailByName(encryptDto);

    final PersonResponseDto response = PersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonDetailByName response: $jsonString");

      final listPersonDto = ListPersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonDto = listPersonDto;
      StringUtils.log("getPersonDetailByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonDto = ListPersonDto(data: []);
      StringUtils.log("getPersonDetailByName failed");
    }
    return response;
  }

  Future<PersonResponseDto> getPersonDetailByOldName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonDetailByOldName(encryptDto);

    final PersonResponseDto response = PersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonDetailByOldName response: $jsonString");

      final listPersonDto = ListPersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonDto = listPersonDto;
      StringUtils.log("getPersonDetailByOldName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonDto = ListPersonDto(data: []);
      StringUtils.log("getPersonDetailByOldName failed");
    }
    return response;
  }


  Future<CardResponseDto> getCardDetailByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCardDetailByPid(encryptDto);

    final CardResponseDto response = CardResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCardDetailByPid response: $jsonString");

      final listCardDto = ListCardDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCardDto = listCardDto;
      StringUtils.log("getCardDetailByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCardDto = ListCardDto(data: []);
      StringUtils.log("getCardDetailByPid failed");
    }
    return response;
  }

  Future<IdcResponseDto> getCardDetailLatestByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCardDetailLatestByPid(encryptDto);

    final IdcResponseDto response = IdcResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCardDetailLatestByPid response: $jsonString");

      final listIdcDto = ListIdcDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listIdcDto = listIdcDto;
      StringUtils.log("getCardDetailLatestByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listIdcDto = ListIdcDto(data: []);
      StringUtils.log("getCardDetailLatestByPid failed");
    }
    return response;
  }


  Future<ImageResponseDto> getPersonImageByPb1(String pb1, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pb1 = Uri.encodeComponent(pb1);

    final dto = Pb1RequestDto(pb1: pb1,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonImageByPb1(encryptDto);

    final ImageResponseDto response = ImageResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPesonImageByPb1 response: $jsonString");

      final listImageDto = ListImageDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = listImageDto;
      StringUtils.log("getPesonImageByPb1 success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = ListImageDto(data: []);
      StringUtils.log("getPesonImageByPb1 failed");
    }
    return response;
  }


  Future<NumberResidentResponseDto> getCountPersonByHid(String hid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    hid = Uri.encodeComponent(hid);

    final dto = HidRequestDto(hid: hid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCountPersonByHid(encryptDto);

    final NumberResidentResponseDto response = NumberResidentResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCountPersonByHid response: $jsonString");

      final listNumberResidentDto = ListNumberResidentDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listNumberResidentDto = listNumberResidentDto;
      StringUtils.log("getCountPersonByHid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listNumberResidentDto = ListNumberResidentDto(data: []);
      StringUtils.log("getCountPersonByHid failed");
    }
    return response;
  }

  Future<PopHouseResponseDto> getPersonDetailByHid(String hid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    hid = Uri.encodeComponent(hid);

    final dto = HidRequestDto(hid: hid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonDetailByHid(encryptDto);

    final PopHouseResponseDto response = PopHouseResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonDetailByHid response: $jsonString");

      final listPopHouseDto = ListPopHouseDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPopHouseDto = listPopHouseDto;
      StringUtils.log("getPersonDetailByHid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPopHouseDto = ListPopHouseDto(data: []);
      StringUtils.log("getPersonDetailByHid failed");
    }
    return response;
  }

  Future<ChangeNameResponseDto> getPersonChangeNameByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonChangeNameByPid(encryptDto);

    final ChangeNameResponseDto response = ChangeNameResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonChangeNameByPid response: $jsonString");

      final listChangeNameDto = ListChangeNameDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listChangeNameDto = listChangeNameDto;
      StringUtils.log("getPersonChangeNameByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listChangeNameDto = ListChangeNameDto(data: []);
      StringUtils.log("getPersonChangeNameByPid failed");
    }
    return response;
  }

  Future<ChangeAddressResponseDto> getPersonChangeAddrByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonChangeAddrByPid(encryptDto);

    final ChangeAddressResponseDto response = ChangeAddressResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonChangeAddrByPid response: $jsonString");

      final listChangeAddressDto = ListChangeAddressDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listChangeAddressDto = listChangeAddressDto;
      StringUtils.log("getPersonChangeAddrByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listChangeAddressDto = ListChangeAddressDto(data: []);
      StringUtils.log("getPersonChangeAddrByPid failed");
    }
    return response;
  }

  Future<IdcBp1ResponseDto> getCardDetailBypb1(String pb1, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pb1 = Uri.encodeComponent(pb1);

    final dto = Pb1RequestDto(pb1: pb1,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCardDetailBypb1(encryptDto);

    final IdcBp1ResponseDto response = IdcBp1ResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCardDetailBypb1 response: $jsonString");

      final listIdcBp1Dto = ListIdcBp1Dto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listIdcBp1Dto = listIdcBp1Dto;
      StringUtils.log("getCardDetailBypb1 success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listIdcBp1Dto = ListIdcBp1Dto(data: []);
      StringUtils.log("getCardDetailBypb1 failed");
    }
    return response;
  }

  Future<HouseResponseDto> getHouseDetailByHid(String hid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    hid = Uri.encodeComponent(hid);

    final dto = HidRequestDto(hid: hid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getHouseDetailByHid(encryptDto);

    final HouseResponseDto response = HouseResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getHouseDetailByHid response: $jsonString");

      final listHouseDto = ListHouseDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseDto = listHouseDto;
      StringUtils.log("getHouseDetailByHid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseDto = ListHouseDto(data: []);
      StringUtils.log("getHouseDetailByHid failed");
    }
    return response;
  }

  Future<HouseResponseDto> getHouseDetailByAddr(String houseno, String moo, String lane, String soiCode, String roadCode, String tambonCode, String amphurCode, String provinceCode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    houseno = Uri.encodeComponent(houseno);
    moo = Uri.encodeComponent(moo);
    lane = Uri.encodeComponent(lane);
    soiCode = Uri.encodeComponent(soiCode);
    roadCode = Uri.encodeComponent(roadCode);
    tambonCode = Uri.encodeComponent(tambonCode);
    amphurCode = Uri.encodeComponent(amphurCode);
    provinceCode = Uri.encodeComponent(provinceCode);

    final dto = HouseRequestDto(houseno: houseno, moo: moo, lane: lane, soiCode: soiCode, roadCode: roadCode, tambonCode: tambonCode, amphurCode: amphurCode, provinceCode: provinceCode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getHouseDetailByAddr(encryptDto);

    final HouseResponseDto response = HouseResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getHouseDetailByAddr response: $jsonString");

      final listHouseDto = ListHouseDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseDto = listHouseDto;
      StringUtils.log("getHouseDetailByAddr success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseDto = ListHouseDto(data: []);
      StringUtils.log("getHouseDetailByAddr failed");
    }
    return response;
  }


  // DOPA - แรงงาน (กรมการปกครอง) (foreign) ------------------------------------------------------

  Future<WorkerResponseDto> getForeignWorkerDetailByWorkerId(String workerId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    workerId = Uri.encodeComponent(workerId);

    final dto = WorkerIdRequestDto(workerId: workerId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getForeignWorkerDetailByWorkerId(encryptDto);

    final WorkerResponseDto response = WorkerResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getForeignWorkerDetailByWorkerId response: $jsonString");

      final listWorkerDto = ListWorkerDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWorkerDto = listWorkerDto;
      StringUtils.log("getForeignWorkerDetailByWorkerId success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWorkerDto = ListWorkerDto(data: []);
      StringUtils.log("getForeignWorkerDetailByWorkerId failed");
    }
    return response;
  }

  Future<ImageResponseDto> getForeignWorkerImageByWorkerId(String workerId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    workerId = Uri.encodeComponent(workerId);

    final dto = WorkerIdRequestDto(workerId: workerId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getForeignWorkerImageByWorkerId(encryptDto);

    final ImageResponseDto response = ImageResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getForeignWorkerImageByWorkerId response: $jsonString");

      final listImageDto = ListImageDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = listImageDto;
      StringUtils.log("getForeignWorkerImageByWorkerId success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = ListImageDto(data: []);
      StringUtils.log("getForeignWorkerImageByWorkerId failed");
    }
    return response;
  }


  // LINKAGE - ทร (new_linkage) ------------------------------------------------------

  Future<PersonLkResponseDto> getPersonInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonInfoByPid(encryptDto);

    final PersonLkResponseDto response = PersonLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonInfoByPid response: $jsonString");

      final listPersonLkDto = ListPersonLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonLkDto = listPersonLkDto;
      StringUtils.log("getPersonInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonLkDto = ListPersonLkDto(data: []);
      StringUtils.log("getPersonInfoByPid failed");
    }
    return response;
  }

  Future<PersonLkResponseDto> getPersonInfoByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonInfoByName(encryptDto);

    final PersonLkResponseDto response = PersonLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonInfoByName response: $jsonString");

      final listPersonLkDto = ListPersonLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonLkDto = listPersonLkDto;
      StringUtils.log("getPersonInfoByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonLkDto = ListPersonLkDto(data: []);
      StringUtils.log("getPersonInfoByName failed");
    }
    return response;
  }

  Future<PersonLkResponseDto> getPersonInfoByOldName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonInfoByOldName(encryptDto);

    final PersonLkResponseDto response = PersonLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonInfoByOldName response: $jsonString");

      final listPersonLkDto = ListPersonLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonLkDto = listPersonLkDto;
      StringUtils.log("getPersonInfoByOldName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonLkDto = ListPersonLkDto(data: []);
      StringUtils.log("getPersonInfoByOldName failed");
    }
    return response;
  }

  Future<HouseLkResponseDto> getHouseInfoByHid(String hid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    hid = Uri.encodeComponent(hid);

    final dto = HidRequestDto(hid: hid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getHouseInfoByHid(encryptDto);

    final HouseLkResponseDto response = HouseLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getHouseInfoByHid response: $jsonString");

      final listHouseLkDto = ListHouseLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseLkDto = listHouseLkDto;
      StringUtils.log("getHouseInfoByHid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseLkDto = ListHouseLkDto(data: []);
      StringUtils.log("getHouseInfoByHid failed");
    }
    return response;
  }

  Future<HouseLkResponseDto> getHouseInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getHouseInfoByPid(encryptDto);

    final HouseLkResponseDto response = HouseLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getHouseInfoByPid response: $jsonString");

      final listHouseLkDto = ListHouseLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseLkDto = listHouseLkDto;
      StringUtils.log("getHouseInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHouseLkDto = ListHouseLkDto(data: []);
      StringUtils.log("getHouseInfoByPid failed");
    }
    return response;
  }

  Future<CardLkResponseDto> getCardListByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCardListByPid(encryptDto);

    final CardLkResponseDto response = CardLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCardListByPid response: $jsonString");

      final listCardLkDto = ListCardLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCardLkDto = listCardLkDto;
      StringUtils.log("getCardListByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCardLkDto = ListCardLkDto(data: []);
      StringUtils.log("getCardListByPid failed");
    }
    return response;
  }

  Future<PersonInHouseLkResponseDto> getPersonInfoListByHid(String hid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    hid = Uri.encodeComponent(hid);

    final dto = HidRequestDto(hid: hid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonInfoListByHid(encryptDto);

    final PersonInHouseLkResponseDto response = PersonInHouseLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonInfoListByHid response: $jsonString");

      final listPersonInHouseDto = ListPersonInHouseLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonInHouseLkDto = listPersonInHouseDto;
      StringUtils.log("getPersonInfoListByHid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonInHouseLkDto = ListPersonInHouseLkDto(data: []);
      StringUtils.log("getPersonInfoListByHid failed");
    }
    return response;
  }

  Future<PersonInHouseLkResponseDto> getPersonInfoListByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonInfoListByPid(encryptDto);

    final PersonInHouseLkResponseDto response = PersonInHouseLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonInfoListByPid response: $jsonString");

      final listPersonInHouseDto = ListPersonInHouseLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonInHouseLkDto = listPersonInHouseDto;
      StringUtils.log("getPersonInfoListByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonInHouseLkDto = ListPersonInHouseLkDto(data: []);
      StringUtils.log("getPersonInfoListByPid failed");
    }
    return response;
  }

  Future<MakeCardLkResponseDto> getCardInfoByPb1(String pb1, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pb1 = Uri.encodeComponent(pb1);

    final dto = Pb1RequestDto(pb1: pb1,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCardInfoByPb1(encryptDto);

    final MakeCardLkResponseDto response = MakeCardLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCardInfoByPb1 response: $jsonString");

      final listMakeCardLkDto = ListMakeCardLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMakeCardLkDto = listMakeCardLkDto;
      StringUtils.log("getCardInfoByPb1 success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMakeCardLkDto = ListMakeCardLkDto(data: []);
      StringUtils.log("getCardInfoByPb1 failed");
    }
    return response;
  }

  Future<MakeCardLkResponseDto> getCardInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCardInfoByPid(encryptDto);

    final MakeCardLkResponseDto response = MakeCardLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCardInfoByPid response: $jsonString");

      final listMakeCardLkDto = ListMakeCardLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMakeCardLkDto = listMakeCardLkDto;
      StringUtils.log("getCardInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMakeCardLkDto = ListMakeCardLkDto(data: []);
      StringUtils.log("getCardInfoByPid failed");
    }
    return response;
  }

  Future<MoveLkResponseDto> getChangeAddrMoveInByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getChangeAddrMoveInByPid(encryptDto);

    final MoveLkResponseDto response = MoveLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getChangeAddrMoveInByPid response: $jsonString");

      final listMoveLkDto = ListMoveLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMoveLkDto = listMoveLkDto;
      StringUtils.log("getChangeAddrMoveInByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMoveLkDto = ListMoveLkDto(data: []);
      StringUtils.log("getChangeAddrMoveInByPid failed");
    }
    return response;
  }

  Future<MoveLkResponseDto> getChangeAddrMoveOutByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getChangeAddrMoveOutByPid(encryptDto);

    final MoveLkResponseDto response = MoveLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getChangeAddrMoveOutByPid response: $jsonString");

      final listMoveLkDto = ListMoveLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMoveLkDto = listMoveLkDto;
      StringUtils.log("getChangeAddrMoveOutByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listMoveLkDto = ListMoveLkDto(data: []);
      StringUtils.log("getChangeAddrMoveOutByPid failed");
    }
    return response;
  }

  Future<ChangeNameLkResponseDto> getChangeNameInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getChangeNameInfoByPid(encryptDto);

    final ChangeNameLkResponseDto response = ChangeNameLkResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getChangeNameInfoByPid response: $jsonString");

      final listChangeNameLkDto = ListChangeNameLkDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listChangeNameLkDto = listChangeNameLkDto;
      StringUtils.log("getChangeNameInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listChangeNameLkDto = ListChangeNameLkDto(data: []);
      StringUtils.log("getChangeNameInfoByPid failed");
    }
    return response;
  }

  Future<ImageResponseDto> getPersonImageInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonImageInfoByPid(encryptDto);

    final ImageResponseDto response = ImageResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonImageInfoByPid response: $jsonString");

      final listImageDto = ListImageDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = listImageDto;
      StringUtils.log("getPersonImageInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = ListImageDto(data: []);
      StringUtils.log("getPersonImageInfoByPid failed");
    }
    return response;
  }

  Future<ImageResponseDto> getPersonImageInfoByPb1(String pb1, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pb1 = Uri.encodeComponent(pb1);

    final dto = Pb1RequestDto(pb1: pb1,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonImageInfoByPb1(encryptDto);

    final ImageResponseDto response = ImageResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonImageInfoByPb1 response: $jsonString");

      final listImageDto = ListImageDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = listImageDto;
      StringUtils.log("getPersonImageInfoByPb1 success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = ListImageDto(data: []);
      StringUtils.log("getPersonImageInfoByPb1 failed");
    }
    return response;
  }

  Future<ImageResponseDto> getAlienPersonImageInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getForeignPersonImageInfoByPid(encryptDto);

    final ImageResponseDto response = ImageResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getAlienPersonImageInfoByPid response: $jsonString");

      final listImageDto = ListImageDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = listImageDto;
      StringUtils.log("getAlienPersonImageInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = ListImageDto(data: []);
      StringUtils.log("getAlienPersonImageInfoByPid failed");
    }
    return response;
  }

  Future<Lk2Group1ResponseDto> getLk2Group1(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = PidRequestDto(pid: pid, lat: lat, lon: lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getLk2Group1(encryptDto);

    final Lk2Group1ResponseDto response = Lk2Group1ResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("Lk2Group1ResponseDto response: $jsonString");

      // // หลังจาก decrypt แล้ว
      // String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      // print("Received JSON: $jsonString");  // เช็คว่า JSON ที่ได้รับมาเป็นยังไง
      //
      // final Map<String, dynamic> decodedJson = jsonDecode(jsonString);
      // final personInfo = decodedJson['data'][0]['personInfo']; // ตรวจสอบว่า key ตรงกับใน JSON ไหม
      // print("personInfoMap: $personInfo");  // เช็คว่ามีข้อมูลจริงๆ หรือไม่

      final listLk2Group1Dto = ListLk2Group1Dto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listLk2Group1Dto = listLk2Group1Dto;

      StringUtils.log("Status: ${response.status}");
      StringUtils.log("Message: ${response.message}");

      StringUtils.log("Lk2Group1ResponseDto success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listLk2Group1Dto = ListLk2Group1Dto(data: []);
      StringUtils.log("Lk2Group1ResponseDto failed");
    }
    return response;
  }

  // DLT - กรมขนส่ง - ใบอนุญาตขับรถ (car_license) ---------------------------------

  Future<DriverLicenseInfoResponseDto> getDriverLicenceInfoByPid(String pid, String pltcode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);
    pltcode = Uri.encodeComponent(pltcode);

    final dto = PidPltRequestDto(pid: pid, pltcode: pltcode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getDriverLicenceInfoByPid(encryptDto);

    final DriverLicenseInfoResponseDto response = DriverLicenseInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getDriverLicenceInfoByPid response: $jsonString");

      final listDriverLicenseInfoDto = ListDriverLicenseInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = listDriverLicenseInfoDto;
      StringUtils.log("getDriverLicenceInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = ListDriverLicenseInfoDto(data: []);
      StringUtils.log("getDriverLicenceInfoByPid failed");
    }
    return response;
  }

  Future<DriverLicenseInfoResponseDto> getDriverLicenceInfoByName(String fname, String lname, String pltcode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);
    pltcode = Uri.encodeComponent(pltcode);

    final dto = NamePltRequestDto(fname: fname, lname: lname, pltcode: pltcode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getDriverLicenceInfoByName(encryptDto);

    final DriverLicenseInfoResponseDto response = DriverLicenseInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getDriverLicenceInfoByName response: $jsonString");

      final listDriverLicenseInfoDto = ListDriverLicenseInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = listDriverLicenseInfoDto;
      StringUtils.log("getDriverLicenceInfoByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = ListDriverLicenseInfoDto(data: []);
      StringUtils.log("getDriverLicenceInfoByName failed");
    }
    return response;
  }

  // คนต่างด้าว (linkage)
  Future<AlienPersonResponseDto> getForeignPersonInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getForeignPersonInfoByPid(encryptDto);

    final AlienPersonResponseDto response = AlienPersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getForeignPersonInfoByPid response: $jsonString");

      final listAlienPersonDto = ListAlienPersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listAlienPersonDto = listAlienPersonDto;
      StringUtils.log("getForeignPersonInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listAlienPersonDto = ListAlienPersonDto(data: []);
      StringUtils.log("getForeignPersonInfoByPid failed");
    }
    return response;
  }

  // แรงงานต่างด้าว (linkage)
  Future<AlienWorkerResponseDto> getForeignWorkerInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getForeignWorkerInfoByPid(encryptDto);

    final AlienWorkerResponseDto response = AlienWorkerResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getForeignWorkerInfoByPid response: $jsonString");

      final listAlienWorkerDto = ListAlienWorkerDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listAlienWorkerDto = listAlienWorkerDto;
      StringUtils.log("getForeignWorkerInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listAlienWorkerDto = ListAlienWorkerDto(data: []);
      StringUtils.log("getForeignWorkerInfoByPid failed");
    }
    return response;
  }

  Future<PersonNonThaiResponseDto> getPersonNonThaiInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonNonNationThaiInfoByPid(encryptDto);

    final PersonNonThaiResponseDto response = PersonNonThaiResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonNonThaiInfoByPid response: $jsonString");

      final listPersonNonThaiDto = ListPersonNonThaiDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonNonThaiDto = listPersonNonThaiDto;
      StringUtils.log("getPersonNonThaiInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonNonThaiDto = ListPersonNonThaiDto(data: []);
      StringUtils.log("getPersonNonThaiInfoByPid failed");
    }
    return response;
  }

  Future<PersonNoRegisResponseDto> getPersonNoRegisInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonNoRegisterStatusInfoByPid(encryptDto);

    final PersonNoRegisResponseDto response = PersonNoRegisResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonNoRegisInfoByPid response: $jsonString");

      final listPersonNoRegisDto = ListPersonNoRegisDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonNoRegisDto = listPersonNoRegisDto;
      StringUtils.log("getPersonNoRegisInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonNoRegisDto = ListPersonNoRegisDto(data: []);
      StringUtils.log("getPersonNoRegisInfoByPid failed");
    }
    return response;
  }

  // DLT - กรมขนส่ง - ใบอนุญาตขับรถขนส่ง (bus_license) ---------------------------------

  Future<DriverLicenseInfoResponseDto> getPublicLicenceInfoByPid(String pid, String pltcode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);
    pltcode = Uri.encodeComponent(pltcode);

    final dto = PidPltRequestDto(pid: pid, pltcode: pltcode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPublicLicenceInfoByPid(encryptDto);

    final DriverLicenseInfoResponseDto response = DriverLicenseInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPublicLicenceInfoByPid response: $jsonString");

      final listDriverLicenseInfoDto = ListDriverLicenseInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = listDriverLicenseInfoDto;
      StringUtils.log("getPublicLicenceInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = ListDriverLicenseInfoDto(data: []);
      StringUtils.log("getPublicLicenceInfoByPid failed");
    }
    return response;
  }

  Future<DriverLicenseInfoResponseDto> getPublicLicenceInfoByName(String fname, String lname, String pltcode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);
    pltcode = Uri.encodeComponent(pltcode);

    final dto = NamePltRequestDto(fname: fname, lname: lname, pltcode: pltcode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPublicLicenceInfoByName(encryptDto);

    final DriverLicenseInfoResponseDto response = DriverLicenseInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPublicLicenceInfoByName response: $jsonString");

      final listDriverLicenseInfoDto = ListDriverLicenseInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = listDriverLicenseInfoDto;
      StringUtils.log("getPublicLicenceInfoByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listDriverLicenseInfo = ListDriverLicenseInfoDto(data: []);
      StringUtils.log("getPublicLicenceInfoByName failed");
    }
    return response;
  }


  // DLT - กรมขนส่ง - ยานพาหนะ (car)  -----------------------------------------------

  Future<GetVehicleInfoResponseDto> getVehicleInfoByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getVehicleInfoByPid(encryptDto);

    final GetVehicleInfoResponseDto response = GetVehicleInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getVehicleInfoByPid response: $jsonString");

      final listVehicleInfoDto = ListVehicleInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = listVehicleInfoDto;
      StringUtils.log("getVehicleInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = ListVehicleInfoDto(data: []);
      StringUtils.log("getVehicleInfoByPid failed");
    }
    return response;
  }

  Future<GetVehicleInfoResponseDto> getVehicleInfoByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getVehicleInfoByName(encryptDto);

    final GetVehicleInfoResponseDto response = GetVehicleInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getVehicleInfoByName response: $jsonString");

      final listVehicleInfoDto = ListVehicleInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = listVehicleInfoDto;
      StringUtils.log("getVehicleInfoByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = ListVehicleInfoDto(data: []);
      StringUtils.log("getVehicleInfoByName failed");
    }
    return response;
  }

  Future<GetVehicleInfoResponseDto> getVehicleInfoByPlate(String plate1, String plate2, String provcode, String vhtype, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    plate1 = Uri.encodeComponent(plate1);
    plate2 = Uri.encodeComponent(plate2);
    provcode = Uri.encodeComponent(provcode);
    vhtype = Uri.encodeComponent(vhtype);

    final dto = PlateVhRequestDto(plate1: plate1, plate2: plate2, provcode: provcode, vhtype: vhtype,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getVehicleInfoByPlate(encryptDto);

    final GetVehicleInfoResponseDto response = GetVehicleInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getVehicleInfoByPlate response: $jsonString");

      final listVehicleInfoDto = ListVehicleInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = listVehicleInfoDto;
      StringUtils.log("getVehicleInfoByPlate success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = ListVehicleInfoDto(data: []);
      StringUtils.log("getVehicleInfoByPlate failed");
    }
    return response;
  }

  Future<GetVehicleInfoResponseDto> getVehicleInfoByNumBody(String numbody, String brncode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    numbody = Uri.encodeComponent(numbody);
    brncode = Uri.encodeComponent(brncode);

    final dto = NumBodyRequestDto(numbody: numbody, brncode: brncode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getVehicleInfoByNumBody(encryptDto);

    final GetVehicleInfoResponseDto response = GetVehicleInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getVehicleInfoByNumBody response: $jsonString");

      final listVehicleInfoDto = ListVehicleInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = listVehicleInfoDto;
      StringUtils.log("getVehicleInfoByNumBody success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = ListVehicleInfoDto(data: []);
      StringUtils.log("getVehicleInfoByNumBody failed");
    }
    return response;
  }

  Future<GetVehicleInfoResponseDto> getVehicleInfoByPassport(String passportNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    passportNo = Uri.encodeComponent(passportNo);

    final dto = PassportRequestDto(passportNo: passportNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getVehicleInfoByPassport(encryptDto);

    final GetVehicleInfoResponseDto response = GetVehicleInfoResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getVehicleInfoByPassport response: $jsonString");

      final listVehicleInfoDto = ListVehicleInfoDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = listVehicleInfoDto;
      StringUtils.log("getVehicleInfoByPassport success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listVehicleInfo = ListVehicleInfoDto(data: []);
      StringUtils.log("getVehicleInfoByPassport failed");
    }
    return response;
  }


  // SSO - ประกันสังคม (social) ---------------------------------------------------

  Future<EmploymentResponseDto> getEmployeeEmploymentByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getEmployeeEmploymentByPid(encryptDto);

    final EmploymentResponseDto response = EmploymentResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getEmployeeEmploymentByPid response: $jsonString");

      final listEmploymentDto = ListEmploymentDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmploymentDto = listEmploymentDto;
      StringUtils.log("getEmployeeEmploymentByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmploymentDto = ListEmploymentDto(data: []);
      StringUtils.log("getEmployeeEmploymentByPid failed");
    }
    return response;
  }

  Future<HospitalResponseDto> getSelectHospitalPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getSelectHospitalPid(encryptDto);

    final HospitalResponseDto response = HospitalResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getSelectHospitalPid response: $jsonString");

      final listHospitalDto = ListHospitalDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHospitalDto = listHospitalDto;
      StringUtils.log("getSelectHospitalPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHospitalDto = ListHospitalDto(data: []);
      StringUtils.log("getSelectHospitalPid failed");
    }
    return response;
  }

  Future<EmployerResponseDto> getEmployerDetail(String accno, String accbranch, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    accno = Uri.encodeComponent(accno);
    accbranch = Uri.encodeComponent(accbranch);

    final dto = AccRequestDto(accno: accno, accbranch: accbranch,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getEmployerDetail(encryptDto);

    final EmployerResponseDto response = EmployerResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getEmployerDetail response: $jsonString");

      final listEmployerDto = ListEmployerDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmployerDto = listEmployerDto;
      StringUtils.log("getEmployerDetail success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmployerDto = ListEmployerDto(data: []);
      StringUtils.log("getEmployerDetail failed");
    }
    return response;
  }


  // NHSO - ประกันสุขภาพ (health) -------------------------------------------------

  Future<HealthResponseDto> getHealthInsuranceByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getHealthInsuranceByPid(encryptDto);

    final HealthResponseDto response = HealthResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getHealthInsuranceByPid response: $jsonString");

      final listHealthDto = ListHealthDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHealthDto = listHealthDto;
      StringUtils.log("getHealthInsuranceByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listHealthDto = ListHealthDto(data: []);
      StringUtils.log("getHealthInsuranceByPid failed");
    }
    return response;
  }


  // TM - ตรวจคนเข้าเมือง (immigration) -------------------------------------------------

  Future<TravelResponseDto> getTravelDetailByPassport(String passportNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    passportNo = Uri.encodeComponent(passportNo);

    final dto = PassportRequestDto(passportNo: passportNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTravelDetailByPassport(encryptDto);

    final TravelResponseDto response = TravelResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTravelDetailByPassport response: $jsonString");

      final listTravelDto = ListTravelDto.fromJson(jsonDecode(jsonString));
      for(int i=0;i<listTravelDto.data!.length;i++){
        listTravelDto.data![i].isInputPassport=true;
      }
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTravelDto = listTravelDto;
      StringUtils.log("getTravelDetailByPassport success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTravelDto = ListTravelDto(data: []);
      StringUtils.log("getTravelDetailByPassport failed");
    }
    return response;
  }

  Future<TravelResponseDto> getTravelDetailByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTravelDetailByPid(encryptDto);

    final TravelResponseDto response = TravelResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTravelDetailByPid response: $jsonString");

      final listTravelDto = ListTravelDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTravelDto = listTravelDto;
      StringUtils.log("getTravelDetailByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTravelDto = ListTravelDto(data: []);
      StringUtils.log("getTravelDetailByPid failed");
    }
    return response;
  }

  Future<TravelVisaResponseDto> getTravelDetailByTmRunno(String tmrunno, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    tmrunno = Uri.encodeComponent(tmrunno);

    final dto = TmRunnoRequestDto(tmrunno: tmrunno,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTravelDetailByTmRunno(encryptDto);

    final TravelVisaResponseDto response = TravelVisaResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTravelDetailByTmRunno response: $jsonString");

      final listTravelVisaDto = ListTravelVisaDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTravelVisaDto = listTravelVisaDto;
      StringUtils.log("getTravelDetailByTmRunno success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTravelVisaDto = ListTravelVisaDto(data: []);
      StringUtils.log("getTravelDetailByTmRunno failed");
    }
    return response;
  }

  //Immigration ----------------------------------------------------
  Future<ImmResponseDto> getImmigrationByPassport(String passportNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = PassportRequestDto(passportNo: passportNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getImmigrationByPassport(encryptDto);

    final ImmResponseDto response = ImmResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getImmigrationByPassport response: $jsonString");

      final listImmDto = ListImmDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImmDto = listImmDto;
      StringUtils.log("getImmigrationByPassport success");
    }else{
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImmDto = ListImmDto(data: []);
      StringUtils.log("getImmigrationByPassport failed");
    }
    return response;
  }

  Future<ImmResponseDto> getImmigrationByName(String firstName,String lastName, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    // firstName = Uri.encodeComponent(firstName);
    // lastName = Uri.encodeComponent(lastName);

    final dto = NameRequestDto(fname: firstName,lname: lastName, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getImmigrationByName(encryptDto);

    final ImmResponseDto response = ImmResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPrisonerByName response: $jsonString");

      final listImmDto = ListImmDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImmDto = listImmDto;
      StringUtils.log("getPrisonerByName success");
    }else{
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImmDto = ListImmDto(data: []);
      StringUtils.log("getPrisonerByName failed");
    }
    return response;
  }

  //Extension ----------------------------------------------------
  Future<ExtensionResponseDto> getExtensionByPassport(String passportNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = PassportRequestDto(passportNo: passportNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getExtension(encryptDto);

    final ExtensionResponseDto response = ExtensionResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getExtensionByPassport response: $jsonString");

      final listExtensionDto = ListExtensionDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listExtensionDto = listExtensionDto;
      StringUtils.log("getExtensionByPassport success");
    }else{
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listExtensionDto = ListExtensionDto(data: []);
      StringUtils.log("getExtensionByPassport failed");
    }
    return response;
  }

  Future<ExtensionResponseDto> getExtensionByName(String firstName,String lastName, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    // firstName = Uri.encodeComponent(firstName);
    // lastName = Uri.encodeComponent(lastName);

    final dto = NameRequestDto(fname: firstName,lname: lastName, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getExtension(encryptDto);

    final ExtensionResponseDto response = ExtensionResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getExtensionByName response: $jsonString");

      final listExtensionDto = ListExtensionDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listExtensionDto = listExtensionDto;
      StringUtils.log("getExtensionByName success");
    }else{
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listExtensionDto = ListExtensionDto(data: []);
      StringUtils.log("getExtensionByName failed");
    }
    return response;
  }

  // TM - ที่พักต่างด้าว (foreignhouse) ----------------------------------------------

  Future<Tm61ResponseDto> getTm61DetailByPassport(String passportNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    passportNo = Uri.encodeComponent(passportNo);

    final dto = PassportRequestDto(passportNo: passportNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTm61DetailByPassport(encryptDto);

    final Tm61ResponseDto response = Tm61ResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTm61DetailByPassport response: $jsonString");

      final listTm61Dto = ListTm61Dto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTm61Dto = listTm61Dto;
      StringUtils.log("getTm61DetailByPassport success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTm61Dto = ListTm61Dto(data: []);
      StringUtils.log("getTm61DetailByPassport failed");
    }
    return response;
  }

  Future<Tm61ResponseDto> getTm61DetailByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTm61DetailByName(encryptDto);

    final Tm61ResponseDto response = Tm61ResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTravelDetailByName response: $jsonString");

      final listTm61Dto = ListTm61Dto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTm61Dto = listTm61Dto;
      StringUtils.log("getTm61DetailByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTm61Dto = ListTm61Dto(data: []);
      StringUtils.log("getTm61DetailByName failed");
    }
    return response;
  }


  // LINKAGE - ใบอนุญาต ป.4 (p4) -------------------------------------------------

  Future<GunResponseDto> getGunDetailByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getGunDetailByPid(encryptDto);

    final GunResponseDto response = GunResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getGunDetailByPid response: $jsonString");

      final listGunDto = ListGunDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listGunDto = listGunDto;
      StringUtils.log("getGunDetailByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listGunDto = ListGunDto(data: []);
      StringUtils.log("getGunDetailByPid failed");
    }
    return response;
  }

  Future<GunResponseDto> getGunInfo(String gunReg, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = GunRequestDto(gunReg: gunReg,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getGunInfo(encryptDto);

    final GunResponseDto response = GunResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getGunInfo response: $jsonString");

      final listGunDto = ListGunDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listGunDto = listGunDto;
      StringUtils.log("getGunInfo success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listGunDto = ListGunDto(data: []);
      StringUtils.log("getGunInfo failed");
    }
    return response;
  }

  // PTM - ใบสั่งจราจร (traffic) -------------------------------------------------

  Future<TicketResponseDto> getAllTickeList(String pid, String plate1, String plate2, String plate3, String ticketId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);
    plate1 = Uri.encodeComponent(plate1);
    plate2 = Uri.encodeComponent(plate2);
    plate3 = Uri.encodeComponent(plate3);
    ticketId = Uri.encodeComponent(ticketId);

    final dto = PlateTicketRequestDto(pid: pid, plate1: plate1, plate2: plate2, plate3: plate3, ticketId: ticketId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getAllTickeList(encryptDto);

    final TicketResponseDto response = TicketResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getAllTickeList response: $jsonString");

      final listTicketDto = ListTicketDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTicketDto = listTicketDto;
      StringUtils.log("getAllTickeList success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTicketDto = ListTicketDto(data: []);
      StringUtils.log("getAllTickeList failed");
    }
    return response;
  }

  Future<TicketResponseDto> getAllTickeListByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getAllTickeListByName(encryptDto);

    final TicketResponseDto response = TicketResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getAllTickeListByName response: $jsonString");

      final listTicketDto = ListTicketDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTicketDto = listTicketDto;
      StringUtils.log("getAllTickeListByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTicketDto = ListTicketDto(data: []);
      StringUtils.log("getAllTickeListByName failed");
    }
    return response;
  }

  // ------------- Inner ------------------

  Future<GetCrimeCaseResponseDto> getCrimeCaseByFullcaseNo(String orgCode, String crimeCaseYear, String crimeCaseNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);
    crimeCaseYear = Uri.encodeComponent(crimeCaseYear);
    crimeCaseNo = Uri.encodeComponent(crimeCaseNo);

    final dto = FullcaseNoRequestDto(orgCode: orgCode, crimeCaseYear: crimeCaseYear, crimeCaseNo: crimeCaseNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.crimeCaseByFullcaseNo(encryptDto);

    final GetCrimeCaseResponseDto response = GetCrimeCaseResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("crimeCaseByFullCaseNo response: $jsonString");

      final listCrimeCaseDto = ListCrimeCaseDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCase = listCrimeCaseDto;
      StringUtils.log("getCrimeCaseByFullCaseNo success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCase = ListCrimeCaseDto(data: []);
      StringUtils.log("getCrimeCaseByFullCaseNo failed");
    }
    return response;
  }

  Future<GetCrimeCaseResponseDto> getCrimeCaseByObjectId(String objectId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    objectId = Uri.encodeComponent(objectId);

    final dto = ObjectIdRequestDto(objectId: objectId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.crimeCaseByObjectId(encryptDto);

    final GetCrimeCaseResponseDto response = GetCrimeCaseResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("crimeCaseByObjectId response: $jsonString");

      final listCrimeCaseDto = ListCrimeCaseDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCase = listCrimeCaseDto;
      StringUtils.log("getCrimeCaseByObjectId success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCase = ListCrimeCaseDto(data: []);
      StringUtils.log("getCrimeCaseByObjectId failed");
    }
    return response;
  }


  Future<GetCrimeCasePersonResponseDto> getCrimeCasePersonByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccPersonByPid(encryptDto);

    final GetCrimeCasePersonResponseDto response = GetCrimeCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
      && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccPersonByPid response: $jsonString");

      final listCrimeCasePersonDto = ListCrimeCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = listCrimeCasePersonDto;
      StringUtils.log("getCrimeCasePersonByPid success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = ListCrimeCasePersonDto(data: []);
      StringUtils.log("getCrimeCasePersonByPid failed");
    }

    return response;
  }

  Future<GetCrimeCasePersonResponseDto> getCrimeCasePersonByPasId(String pasId, String nation, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pasId = Uri.encodeComponent(pasId);
    nation = Uri.encodeComponent(nation);

    final dto = PasIdRequestDto(pasId: pasId, nation: nation,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccPersonByPasId(encryptDto);

    final GetCrimeCasePersonResponseDto response = GetCrimeCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccPersonByPasId response: $jsonString");

      final listCrimeCasePersonDto = ListCrimeCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = listCrimeCasePersonDto;
      StringUtils.log("getCrimeCasePersonByPasId success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = ListCrimeCasePersonDto(data: []);
      StringUtils.log("getCrimeCasePersonByPasId failed");
    }

    return response;
  }

  Future<GetCrimeCasePersonResponseDto> getCrimeCasePersonByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccPersonByName(encryptDto);

    final GetCrimeCasePersonResponseDto response = GetCrimeCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccPersonByName response: $jsonString");

      final listCrimeCasePersonDto = ListCrimeCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = listCrimeCasePersonDto;
      StringUtils.log("getCrimeCasePersonByName success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = ListCrimeCasePersonDto(data: []);
      StringUtils.log("getCrimeCasePersonByName failed");
    }

    return response;
  }

  Future<GetCrimeCasePersonResponseDto> getCrimeCasePersonByFullcaseNo(String orgCode, String crimeCaseYear, String crimeCaseNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);
    crimeCaseYear = Uri.encodeComponent(crimeCaseYear);
    crimeCaseNo = Uri.encodeComponent(crimeCaseNo);

    final dto = FullcaseNoRequestDto(orgCode: orgCode, crimeCaseYear: crimeCaseYear, crimeCaseNo: crimeCaseNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccPersonByFullcaseNo(encryptDto);

    final GetCrimeCasePersonResponseDto response = GetCrimeCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccPersonByFullcaseNo response: $jsonString");

      final listCrimeCasePersonDto = ListCrimeCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = listCrimeCasePersonDto;
      StringUtils.log("getCrimeCasePersonByFullcaseNo success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = ListCrimeCasePersonDto(data: []);
      StringUtils.log("getCrimeCasePersonByFullcaseNo failed");
    }

    return response;
  }

  Future<GetCrimeCasePersonResponseDto> getCrimeCasePersonByObjectId(String objectId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    objectId = Uri.encodeComponent(objectId);

    final dto = ObjectIdRequestDto(objectId: objectId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccPersonByObjectId(encryptDto);

    final GetCrimeCasePersonResponseDto response = GetCrimeCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccPersonByObjectId response: $jsonString");

      final listCrimeCasePersonDto = ListCrimeCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = listCrimeCasePersonDto;
      StringUtils.log("getCrimeCasePersonByObjectId success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCasePerson = ListCrimeCasePersonDto(data: []);
      StringUtils.log("getCrimeCasePersonByObjectId failed");
    }

    return response;
  }


  Future<GetCrimeCaseVehicleResponseDto> getCrimeCaseVehicleByFullNoPlate(String province, String intitialNo, String number, String status, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    province = Uri.encodeComponent(province);
    intitialNo = Uri.encodeComponent(intitialNo);
    number = Uri.encodeComponent(number);
    status = Uri.encodeComponent(status);

    final dto = FullNoPlateRequestDto(province: province, intitialNo: intitialNo, number: number, status: status,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccVehicleByFullNoPlate(encryptDto);

    final GetCrimeCaseVehicleResponseDto response = GetCrimeCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccVehicleByFullNoPlate response: $jsonString");

      final listCrimeCaseVehicleDto = ListCrimeCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = listCrimeCaseVehicleDto;
      StringUtils.log("getCrimeCaseVehicleByFullNoPlate success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = ListCrimeCaseVehicleDto(data: []);
      StringUtils.log("getCrimeCaseVehicleByFullNoPlate failed");
    }

    return response;
  }

  Future<GetCrimeCaseVehicleResponseDto> getCrimeCaseVehicleByFullEngineNo(String engineNo, String status, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    engineNo = Uri.encodeComponent(engineNo);
    status = Uri.encodeComponent(status);

    final dto = FullEngineNoRequestDto(engineNo: engineNo, status: status,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccVehicleByFullEngineNo(encryptDto);

    final GetCrimeCaseVehicleResponseDto response = GetCrimeCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccVehicleByFullEngineNo response: $jsonString");

      final listCrimeCaseVehicleDto = ListCrimeCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = listCrimeCaseVehicleDto;
      StringUtils.log("getCrimeCaseVehicleByFullEngineNo success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = ListCrimeCaseVehicleDto(data: []);
      StringUtils.log("getCrimeCaseVehicleByFullEngineNo failed");
    }
    return response;
  }

  Future<GetCrimeCaseVehicleResponseDto> getCrimeCaseVehicleByFullcaseNo(String orgCode, String crimeCaseYear, String crimeCaseNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);
    crimeCaseYear = Uri.encodeComponent(crimeCaseYear);
    crimeCaseNo = Uri.encodeComponent(crimeCaseNo);

    final dto = FullcaseNoRequestDto(orgCode: orgCode, crimeCaseYear: crimeCaseYear, crimeCaseNo: crimeCaseNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccVehicleByFullcaseNo(encryptDto);

    final GetCrimeCaseVehicleResponseDto response = GetCrimeCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccVehicleByFullcaseNo response: $jsonString");

      final listCrimeCaseVehicleDto = ListCrimeCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = listCrimeCaseVehicleDto;
      StringUtils.log("getCrimeCaseVehicleByFullcaseNo success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = ListCrimeCaseVehicleDto(data: []);
      StringUtils.log("getCrimeCaseVehicleByFullcaseNo failed");
    }
    return response;
  }

  Future<GetCrimeCaseVehicleResponseDto> getCrimeCaseVehicleByObjectId(String objectId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    objectId = Uri.encodeComponent(objectId);

    final dto = ObjectIdRequestDto(objectId: objectId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.ccVehicleByObjectId(encryptDto);

    final GetCrimeCaseVehicleResponseDto response = GetCrimeCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("ccVehicleByObjectId response: $jsonString");

      final listCrimeCaseVehicleDto = ListCrimeCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = listCrimeCaseVehicleDto;
      StringUtils.log("getCrimeCaseVehicleByObjectId success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCrimeCaseVehicle = ListCrimeCaseVehicleDto(data: []);
      StringUtils.log("getCrimeCaseVehicleByObjectId failed");
    }
    return response;
  }


  Future<GetTrafficCaseResponseDto> getTrafficCaseByFullcaseNo(String orgCode, String crimeCaseYear, String crimeCaseNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);
    crimeCaseYear = Uri.encodeComponent(crimeCaseYear);
    crimeCaseNo = Uri.encodeComponent(crimeCaseNo);

    final dto = FullcaseNoRequestDto(orgCode: orgCode, crimeCaseYear: crimeCaseYear, crimeCaseNo: crimeCaseNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.trafficCaseByFullcaseNo(encryptDto);

    final GetTrafficCaseResponseDto response = GetTrafficCaseResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("trafficCaseByFullcaseNo response: $jsonString");

      final listTrafficCaseDto = ListTrafficCaseDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCase = listTrafficCaseDto;
      StringUtils.log("getTrafficCaseByFullcaseNo success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCase = ListTrafficCaseDto(data: []);
      StringUtils.log("getTrafficCaseByFullcaseNo failed");
    }
    return response;
  }

  Future<GetTrafficCaseResponseDto> getTrafficCaseByObjectId(String objectId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    objectId = Uri.encodeComponent(objectId);

    final dto = ObjectIdRequestDto(objectId: objectId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.trafficCaseByObjectId(encryptDto);

    final GetTrafficCaseResponseDto response = GetTrafficCaseResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("trafficCaseByObjectId response: $jsonString");

      final listTrafficCaseDto = ListTrafficCaseDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCase = listTrafficCaseDto;
      StringUtils.log("getTrafficCaseByObjectId success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCase = ListTrafficCaseDto(data: []);
      StringUtils.log("getTrafficCaseByObjectId failed");
    }
    return response;
  }


  Future<GetTrafficCasePersonResponseDto> getTrafficCasePersonByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcPersonByPid(encryptDto);

    final GetTrafficCasePersonResponseDto response = GetTrafficCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("trafficCaseByObjectId response: $jsonString");

      final listTrafficCasePersonDto = ListTrafficCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = listTrafficCasePersonDto;
      StringUtils.log("getTrafficCasePersonByPid success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = ListTrafficCasePersonDto(data: []);
      StringUtils.log("getTrafficCasePersonByPid failed");
    }
    return response;
  }

  Future<GetTrafficCasePersonResponseDto> getTrafficCasePersonByPasId(String pasId, String nation, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pasId = Uri.encodeComponent(pasId);
    nation = Uri.encodeComponent(nation);

    final dto = PasIdRequestDto(pasId: pasId, nation: nation,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcPersonByPasId(encryptDto);

    final GetTrafficCasePersonResponseDto response = GetTrafficCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcPersonByPasId response: $jsonString");

      final listTrafficCasePersonDto = ListTrafficCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = listTrafficCasePersonDto;
      StringUtils.log("getTrafficCasePersonByPasId success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = ListTrafficCasePersonDto(data: []);
      StringUtils.log("getTrafficCasePersonByPasId failed");
    }
    return response;
  }

  Future<GetTrafficCasePersonResponseDto> getTrafficCasePersonByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = NameRequestDto(fname: fname, lname: lname,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcPersonByName(encryptDto);

    final GetTrafficCasePersonResponseDto response = GetTrafficCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcPersonByName response: $jsonString");

      final listTrafficCasePersonDto = ListTrafficCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = listTrafficCasePersonDto;
      StringUtils.log("getTrafficCasePersonByName success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = ListTrafficCasePersonDto(data: []);
      StringUtils.log("getTrafficCasePersonByName failed");
    }
    return response;
  }

  Future<GetTrafficCasePersonResponseDto> getTrafficCasePersonByFullcaseNo(String orgCode, String crimeCaseYear, String crimeCaseNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);
    crimeCaseYear = Uri.encodeComponent(crimeCaseYear);
    crimeCaseNo = Uri.encodeComponent(crimeCaseNo);

    final dto = FullcaseNoRequestDto(orgCode: orgCode, crimeCaseYear: crimeCaseYear, crimeCaseNo: crimeCaseNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcPersonByFullcaseNo(encryptDto);

    final GetTrafficCasePersonResponseDto response = GetTrafficCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcPersonByFullcaseNo response: $jsonString");

      final listTrafficCasePersonDto = ListTrafficCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = listTrafficCasePersonDto;
      StringUtils.log("getTrafficCasePersonByFullcaseNo success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = ListTrafficCasePersonDto(data: []);
      StringUtils.log("getTrafficCasePersonByFullcaseNo failed");
    }
    return response;
  }

  Future<GetTrafficCasePersonResponseDto> getTrafficCasePersonByObjectId(String objectId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    objectId = Uri.encodeComponent(objectId);

    final dto = ObjectIdRequestDto(objectId: objectId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcPersonByObjectId(encryptDto);

    final GetTrafficCasePersonResponseDto response = GetTrafficCasePersonResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcPersonByObjectId response: $jsonString");

      final listTrafficCasePersonDto = ListTrafficCasePersonDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = listTrafficCasePersonDto;
      StringUtils.log("getTrafficCasePersonByObjectId success");

    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCasePerson = ListTrafficCasePersonDto(data: []);
      StringUtils.log("getTrafficCasePersonByObjectId failed");
    }
    return response;
  }


  Future<GetTrafficCaseVehicleResponseDto> getTrafficCaseVehicleByFullNoPlate(String province, String intitialNo, String number, String status, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    province = Uri.encodeComponent(province);
    intitialNo = Uri.encodeComponent(intitialNo);
    number = Uri.encodeComponent(number);
    status = Uri.encodeComponent(status);

    final dto = FullNoPlateRequestDto(province: province, intitialNo: intitialNo, number: number, status: status,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcVehicleByFullNoPlate(encryptDto);

    final GetTrafficCaseVehicleResponseDto response = GetTrafficCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcVehicleByFullNoPlate response: $jsonString");

      final listTrafficCaseVehicleDto = ListTrafficCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = listTrafficCaseVehicleDto;
      StringUtils.log("getTrafficCaseVehicleByFullNoPlate success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = ListTrafficCaseVehicleDto(data: []);
      StringUtils.log("getTrafficCaseVehicleByFullNoPlate failed");
    }
    return response;
  }

  Future<GetTrafficCaseVehicleResponseDto> getTrafficCaseVehicleByFullEngineNo(String engineNo, String status, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    engineNo = Uri.encodeComponent(engineNo);
    status = Uri.encodeComponent(status);

    final dto = FullEngineNoRequestDto(engineNo: engineNo, status: status,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcVehicleByFullEngineNo(encryptDto);

    final GetTrafficCaseVehicleResponseDto response = GetTrafficCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcVehicleByFullEngineNo response: $jsonString");

      final listTrafficCaseVehicleDto = ListTrafficCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = listTrafficCaseVehicleDto;
      StringUtils.log("getTrafficCaseVehicleByFullEngineNo success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = ListTrafficCaseVehicleDto(data: []);
      StringUtils.log("getTrafficCaseVehicleByFullEngineNo failed");
    }
    return response;
  }

  Future<GetTrafficCaseVehicleResponseDto> getTrafficCaseVehicleByFullcaseNo(String orgCode, String crimeCaseYear, String crimeCaseNo, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);
    crimeCaseYear = Uri.encodeComponent(crimeCaseYear);
    crimeCaseNo = Uri.encodeComponent(crimeCaseNo);

    final dto = FullcaseNoRequestDto(orgCode: orgCode, crimeCaseYear: crimeCaseYear, crimeCaseNo: crimeCaseNo,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcVehicleByFullcaseNo(encryptDto);

    final GetTrafficCaseVehicleResponseDto response = GetTrafficCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcVehicleByFullcaseNo response: $jsonString");

      final listTrafficCaseVehicleDto = ListTrafficCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = listTrafficCaseVehicleDto;
      StringUtils.log("getTrafficCaseVehicleByFullcaseNo success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = ListTrafficCaseVehicleDto(data: []);
      StringUtils.log("getTrafficCaseVehicleByFullcaseNo failed");
    }
    return response;
  }

  Future<GetTrafficCaseVehicleResponseDto> getTrafficCaseVehicleByObjectId(String objectId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    objectId = Uri.encodeComponent(objectId);

    final dto = ObjectIdRequestDto(objectId: objectId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.tcVehicleByObjectId(encryptDto);

    final GetTrafficCaseVehicleResponseDto response = GetTrafficCaseVehicleResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("tcVehicleByObjectId response: $jsonString");

      final listTrafficCaseVehicleDto = ListTrafficCaseVehicleDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = listTrafficCaseVehicleDto;
      StringUtils.log("getTrafficCaseVehicleByObjectId success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listTrafficCaseVehicle = ListTrafficCaseVehicleDto(data: []);
      StringUtils.log("getTrafficCaseVehicleByObjectId failed");
    }
    return response;
  }


  Future<GetWarrantResponseDto> getWarrantByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = WarrantPidRequestDto(conType: "1", pid: pid, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrant(encryptDto);

    final GetWarrantResponseDto response = GetWarrantResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant response: $jsonString");

      final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantDto(data: []);
      StringUtils.log("getWarrantByPid failed");
    }
    return response;
  }

  Future<GetWarrantResponseDto> getWarrantByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = WarrantNameRequestDto(conType: "2", fname: fname, lname: lname, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrant(encryptDto);

    final GetWarrantResponseDto response = GetWarrantResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant response: $jsonString");

      final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantDto(data: []);
      StringUtils.log("getWarrantByName failed");
    }
    return response;
  }

  Future<GetWarrantResponseDto> getWarrantByAddress(String province, String amphur, String tambon, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    province = Uri.encodeComponent(province);
    amphur = Uri.encodeComponent(amphur);
    tambon = Uri.encodeComponent(tambon);

    final dto = WarrantAddressRequestDto(conType: "3", province: province, amphur: amphur, tambon: tambon,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrant(encryptDto);

    final GetWarrantResponseDto response = GetWarrantResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant response: $jsonString");

      final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantByAddress success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantDto(data: []);
      StringUtils.log("getWarrantByAddress failed");
    }
    return response;
  }

  Future<GetWarrantResponseDto> getWarrantByCourt(String court, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    court = Uri.encodeComponent(court);

    final dto = WarrantCourtRequestDto(conType: "4", court: court,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrant(encryptDto);

    final GetWarrantResponseDto response = GetWarrantResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant response: $jsonString");

      final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantByCourt success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantDto(data: []);
      StringUtils.log("getWarrantByCourt failed");
    }
    return response;
  }

  Future<GetWarrantResponseDto> getWarrantByOrgCode(String orgCode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);

    final dto = WarrantOrgCodeRequestDto(conType: "5", orgCode: orgCode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrant(encryptDto);

    final GetWarrantResponseDto response = GetWarrantResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant response: $jsonString");

      final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantByOrgCode success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantDto(data: []);
      StringUtils.log("getWarrantByOrgCode failed");
    }
    return response;
  }

  Future<GetWarrantResponseDto> getWarrantByCharge(String charge, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    charge = Uri.encodeComponent(charge);

    final dto = WarrantChargeRequestDto(conType: "6", charge: charge,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrant(encryptDto);

    final GetWarrantResponseDto response = GetWarrantResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant response: $jsonString");

      final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantByCharge success");
    }else{

      response.status = encryptResponseDto.status;
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantDto(data: []);
      StringUtils.log("getWarrantByCharge failed");
    }
    return response;
  }

  // Future<GetWarrantResponseDto> getWarrantPolisByPid(String pid, double lat, double lon) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //
  //   pid = Uri.encodeComponent(pid);
  //
  //   final dto = WarrantPidRequestDto(conType: "1", pid: pid, lat:lat, lon:lon);
  //   EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
  //   final encryptResponseDto = await serviceApi.warrantPolis(encryptDto);
  //
  //   final GetWarrantResponseDto response = GetWarrantResponseDto();
  //   if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
  //       && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
  //     String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
  //     StringUtils.log("warrantPolis response: $jsonString");
  //
  //     final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = listWarrantDto;
  //     StringUtils.log("getWarrantPolisByPid success");
  //   }else{
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = ListWarrantDto(data: []);
  //     StringUtils.log("getWarrantPolisByPid failed");
  //   }
  //   return response;
  // }
  //
  // Future<GetWarrantResponseDto> getWarrantPolisByName(String fname, String lname, double lat, double lon) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //
  //   fname = Uri.encodeComponent(fname);
  //   lname = Uri.encodeComponent(lname);
  //
  //   final dto = WarrantNameRequestDto(conType: "2", fname: fname, lname: lname, lat:lat, lon:lon);
  //   EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
  //   final encryptResponseDto = await serviceApi.warrantPolis(encryptDto);
  //
  //   final GetWarrantResponseDto response = GetWarrantResponseDto();
  //   if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
  //       && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
  //     String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
  //     StringUtils.log("warrantPolis response: $jsonString");
  //
  //     final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = listWarrantDto;
  //     StringUtils.log("getWarrantPolisByName success");
  //   }else{
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = ListWarrantDto(data: []);
  //     StringUtils.log("getWarrantPolisByName failed");
  //   }
  //   return response;
  // }
  //
  // Future<GetWarrantResponseDto> getWarrantPolisByAddress(String province, String amphur, String tambon, double lat, double lon) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //
  //   province = Uri.encodeComponent(province);
  //   amphur = Uri.encodeComponent(amphur);
  //   tambon = Uri.encodeComponent(tambon);
  //
  //   final dto = WarrantAddressRequestDto(conType: "3", province: province, amphur: amphur, tambon: tambon,lat:lat,lon:lon);
  //   EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
  //   final encryptResponseDto = await serviceApi.warrantPolis(encryptDto);
  //
  //   final GetWarrantResponseDto response = GetWarrantResponseDto();
  //   if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
  //       && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
  //     String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
  //     StringUtils.log("warrantPolis response: $jsonString");
  //
  //     final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = listWarrantDto;
  //     StringUtils.log("getWarrantPolisByAddress success");
  //   }else{
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = ListWarrantDto(data: []);
  //     StringUtils.log("getWarrantPolisByAddress failed");
  //   }
  //   return response;
  // }
  //
  // Future<GetWarrantResponseDto> getWarrantPolisByCourt(String court, double lat, double lon) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //
  //   court = Uri.encodeComponent(court);
  //
  //   final dto = WarrantCourtRequestDto(conType: "4", court: court,lat:lat,lon:lon);
  //   EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
  //   final encryptResponseDto = await serviceApi.warrantPolis(encryptDto);
  //
  //   final GetWarrantResponseDto response = GetWarrantResponseDto();
  //   if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
  //       && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
  //     String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
  //     StringUtils.log("warrantPolis response: $jsonString");
  //
  //     final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = listWarrantDto;
  //     StringUtils.log("getWarrantPolisByCourt success");
  //   }else{
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = ListWarrantDto(data: []);
  //     StringUtils.log("getWarrantPolisByCourt failed");
  //   }
  //   return response;
  // }
  //
  // Future<GetWarrantResponseDto> getWarrantPolisByOrgCode(String orgCode, double lat, double lon) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //
  //   orgCode = Uri.encodeComponent(orgCode);
  //
  //   final dto = WarrantOrgCodeRequestDto(conType: "5", orgCode: orgCode,lat:lat,lon:lon);
  //   EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
  //   final encryptResponseDto = await serviceApi.warrantPolis(encryptDto);
  //
  //   final GetWarrantResponseDto response = GetWarrantResponseDto();
  //   if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
  //       && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
  //     String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
  //     StringUtils.log("warrantPolis response: $jsonString");
  //
  //     final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = listWarrantDto;
  //     StringUtils.log("getWarrantPolisByOrgCode success");
  //   }else{
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = ListWarrantDto(data: []);
  //     StringUtils.log("getWarrantPolisByOrgCode failed");
  //   }
  //   return response;
  // }
  //
  // Future<GetWarrantResponseDto> getWarrantPolisByCharge(String charge, double lat, double lon) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //
  //   charge = Uri.encodeComponent(charge);
  //
  //   final dto = WarrantChargeRequestDto(conType: "6", charge: charge,lat:lat,lon:lon);
  //   EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
  //   final encryptResponseDto = await serviceApi.warrantPolis(encryptDto);
  //
  //   final GetWarrantResponseDto response = GetWarrantResponseDto();
  //   if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
  //       && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
  //     String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
  //     StringUtils.log("warrantPolis response: $jsonString");
  //
  //     final listWarrantDto = ListWarrantDto.fromJson(jsonDecode(jsonString));
  //
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = listWarrantDto;
  //     StringUtils.log("getWarrantByCharge success");
  //   }else{
  //
  //     response.status = encryptResponseDto.status;
  //     response.status = encryptResponseDto.status;
  //     response.message = encryptResponseDto.message;
  //     response.listWarrant = ListWarrantDto(data: []);
  //     StringUtils.log("getWarrantCRDByCharge failed");
  //   }
  //   return response;
  // }

  Future<GetWarrantCourtResponseDto> getWarrantCourtByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = WarrantPidRequestDto(conType: "1", pid: pid, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCourt(encryptDto);

    final GetWarrantCourtResponseDto response = GetWarrantCourtResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant court response: $jsonString");

      final listDto = ListWarrantCourtDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrantCourt = listDto;
      StringUtils.log("getWarrantCourtByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrantCourt = ListWarrantCourtDto(data: []);
      StringUtils.log("getWarrantCourtByPid failed");
    }
    return response;
  }
  Future<GetWarrantCourtResponseDto> getWarrantCourtByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = WarrantNameRequestDto(conType: "2", fname: fname, lname: lname, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCourt(encryptDto);

    final GetWarrantCourtResponseDto response = GetWarrantCourtResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrant court response: $jsonString");

      final listDto = ListWarrantCourtDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrantCourt = listDto;
      StringUtils.log("getWarrantCourtByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrantCourt = ListWarrantCourtDto(data: []);
      StringUtils.log("getWarrantCourtByName failed");
    }
    return response;
  }

  // warrantCRD
  Future<GetWarrantCRDResponseDto> getWarrantCRDByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = WarrantPidRequestDto(conType: "1", pid: pid, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCRD(encryptDto);

    final GetWarrantCRDResponseDto response = GetWarrantCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCRD response: $jsonString");

      final listWarrantDto = ListWarrantCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCRDByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCRDDto(data: []);
      StringUtils.log("getWarrantCRDByPid failed");
    }
    return response;
  }

  Future<GetWarrantCRDResponseDto> getWarrantCRDByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = WarrantNameRequestDto(conType: "2", fname: fname, lname: lname, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCRD(encryptDto);

    final GetWarrantCRDResponseDto response = GetWarrantCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCRD response: $jsonString");

      final listWarrantDto = ListWarrantCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCRDByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCRDDto(data: []);
      StringUtils.log("getWarrantCRDByName failed");
    }
    return response;
  }

  Future<GetWarrantCRDResponseDto> getWarrantCRDByAddress(String province, String amphur, String tambon, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    province = Uri.encodeComponent(province);
    amphur = Uri.encodeComponent(amphur);
    tambon = Uri.encodeComponent(tambon);

    final dto = WarrantAddressRequestDto(conType: "3", province: province, amphur: amphur, tambon: tambon,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCRD(encryptDto);

    final GetWarrantCRDResponseDto response = GetWarrantCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCRD response: $jsonString");

      final listWarrantDto = ListWarrantCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCRDByAddress success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCRDDto(data: []);
      StringUtils.log("getWarrantCRDByAddress failed");
    }
    return response;
  }

  Future<GetWarrantCRDResponseDto> getWarrantCRDByCourt(String court, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    court = Uri.encodeComponent(court);

    final dto = WarrantCourtRequestDto(conType: "4", court: court,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCRD(encryptDto);

    final GetWarrantCRDResponseDto response = GetWarrantCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCRD response: $jsonString");

      final listWarrantDto = ListWarrantCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCRDByCourt success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCRDDto(data: []);
      StringUtils.log("getWarrantCRDByCourt failed");
    }
    return response;
  }

  Future<GetWarrantCRDResponseDto> getWarrantCRDByOrgCode(String orgCode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    orgCode = Uri.encodeComponent(orgCode);

    final dto = WarrantOrgCodeRequestDto(conType: "5", orgCode: orgCode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCRD(encryptDto);

    final GetWarrantCRDResponseDto response = GetWarrantCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCRD response: $jsonString");

      final listWarrantDto = ListWarrantCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCRDByOrgCode success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCRDDto(data: []);
      StringUtils.log("getWarrantCRDByOrgCode failed");
    }
    return response;
  }

  Future<GetWarrantCRDResponseDto> getWarrantCRDByCharge(String charge, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    charge = Uri.encodeComponent(charge);

    final dto = WarrantChargeRequestDto(conType: "6", charge: charge,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCRD(encryptDto);

    final GetWarrantCRDResponseDto response = GetWarrantCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCRD response: $jsonString");

      final listWarrantDto = ListWarrantCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCRDByCharge success");
    }else{

      response.status = encryptResponseDto.status;
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCRDDto(data: []);
      StringUtils.log("getWarrantCRDByCharge failed");
    }
    return response;
  }

  // warrantCourtCRD
  Future<GetWarrantCourtCRDResponseDto> getWarrantCourtCRDByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = WarrantPidRequestDto(conType: "1", pid: pid, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCourtCRD(encryptDto);

    final GetWarrantCourtCRDResponseDto response = GetWarrantCourtCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCourtCRD response: $jsonString");

      final listWarrantDto = ListWarrantCourtCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCourtCRDByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCourtCRDDto(data: []);
      StringUtils.log("getWarrantCourtCRDByPid failed");
    }
    return response;
  }

  Future<GetWarrantCourtCRDResponseDto> getWarrantCourtCRDByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = WarrantNameRequestDto(conType: "2", fname: fname, lname: lname, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.warrantCourtCRD(encryptDto);

    final GetWarrantCourtCRDResponseDto response = GetWarrantCourtCRDResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("warrantCourtCRD response: $jsonString");

      final listWarrantDto = ListWarrantCourtCRDDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getWarrantCourtCRDByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListWarrantCourtCRDDto(data: []);
      StringUtils.log("getWarrantCourtCRDByName failed");
    }
    return response;
  }

  Future<GetRedNoticeResponseDto> getRedNoticeByName(String fname, String lname, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    fname = Uri.encodeComponent(fname);
    lname = Uri.encodeComponent(lname);

    final dto = WarrantNameRequestDto(conType: "2", fname: fname, lname: lname, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.redNotice(encryptDto);

    final GetRedNoticeResponseDto response = GetRedNoticeResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("rednotice response: $jsonString");

      final listWarrantDto = ListRedNoticeDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = listWarrantDto;
      StringUtils.log("getRedNoticeByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listWarrant = ListRedNoticeDto(data: []);
      StringUtils.log("getRedNoticeByName failed");
    }
    return response;
  }

  // FaceRec บช.ก.
  Future<FaceResponseDto> getPersonByFace(String face_image, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = FaceRequestDto(face_image: face_image,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonByFace(encryptDto);

    final FaceResponseDto response = FaceResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonbyFace response: $jsonString");

      final listFaceDto = ListFaceDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listFaceDto = listFaceDto;
      StringUtils.log("getPersonbyFace success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listFaceDto = ListFaceDto(data: []);
      StringUtils.log("getPersonbyFace failed");
    }
    return response;
  }

  Future<EulaResponseDto> getEula() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CommonRequestDto();
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getEula(encryptDto);

    final EulaResponseDto response = EulaResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("eula response: $jsonString");

      final listEulaDto = ListEulaDto.fromJson(jsonDecode(jsonString));
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEulaDto = listEulaDto;
      StringUtils.log("getEula success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEulaDto = ListEulaDto(data: []);
      StringUtils.log("getEula failed");
    }
    return response;
  }

  Future<NewsResponseDto> getNews() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CommonRequestDto();
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getNews(encryptDto);

    final NewsResponseDto response = NewsResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      // StringUtils.log("news response: $jsonString");

      final listNewsDto = ListNewsDto.fromJson(jsonDecode(jsonString));
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listNewsDto = listNewsDto;
      StringUtils.log("getNews success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listNewsDto = ListNewsDto(data: []);
      StringUtils.log("getNews failed");
    }
    return response;

  }

  Future<GetNotifyResponseDto> getNotify() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CommonRequestDto();
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getNotify(encryptDto);

    final GetNotifyResponseDto response = GetNotifyResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("notify response: $jsonString");

      final listNotifyDto = ListNotifyDto.fromJson(jsonDecode(jsonString));
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listNotifyDto = listNotifyDto;
      StringUtils.log("getNotify success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listNotifyDto = ListNotifyDto(data: []);
      StringUtils.log("getNotify failed");
    }
    return response;
  }

  Future<CommonResponseDto> updateNotify(String mxId) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = UpdateNotifyRequestDto(mx_id: mxId);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.updateNotify(encryptDto);
    return response;
  }

  Future<CommonResponseDto> updateFavorite(List<FavoriteDto> favoriteList) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String favorite = jsonEncode(favoriteList);
    favorite = Uri.encodeComponent(favorite);
    StringUtils.log("updateFavorite: ${favorite}");

    final dto = UpdateFavoriteRequestDto(favorite: favorite);
    StringUtils.log("UpdateFavoriteRequestDto: ${jsonEncode(dto)}");
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final response = await serviceApi.updateFavorite(encryptDto);
    return response;
  }

  Future<String> getSsoReport(EmploymentDto? employmentDto, HospitalDto? hospitalDto, EmployerDto? employerDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final reportSsoDto = ReportSsoDto();
    reportSsoDto.addEmploymentDto(employmentDto);
    reportSsoDto.addHospitalDto(hospitalDto);
    reportSsoDto.addEmployerDto(employerDto);

    String reportSsoString = jsonEncode(reportSsoDto);
    StringUtils.log("reportSsoString: ${reportSsoString}");

    reportSsoString = Uri.encodeComponent(reportSsoString);

    final dto = ReportRequestDto(jsonMsg: reportSsoString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getSsoReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getSsoReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getSsoReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getSsoReport failed");
    }
    return urlResult;
  }

  Future<String> getDoeReport(WorkerDto? inputDto,String img) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    final reportWorkerDto = ReportWorkerDto();
    reportWorkerDto.addWorkerDto(inputDto);
    reportWorkerDto.setImage(img);
    String reportString = jsonEncode(reportWorkerDto);
    StringUtils.log("getDoeReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getDoeReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getDoeReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getDoeReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getDoeReport failed");
    }
    return urlResult;
  }

  Future<String> getDriverLicenceReport(DriverLicenseInfoDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getDriverLicenceReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getDriverLicenceReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getDriverLicenceReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getDriverLicenceReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getDriverLicenceReport failed");
    }
    return urlResult;
  }

  Future<String> getPublicLicenceReport(DriverLicenseInfoDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getPublicLicenceReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPublicLicenceReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPublicLicenceReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getPublicLicenceReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getPublicLicenceReport failed");
    }
    return urlResult;
  }

  Future<String> getVehicleReport(VehicleInfoDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getVehicleReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getVehicleReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getVehicleReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getVehicleReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getVehicleReport failed");
    }
    return urlResult;
  }

  Future<String> getNhsoReport(HealthDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getNhsoReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getNhsoReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getNhsoReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getNhsoReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getNhsoReport failed");
    }
    return urlResult;
  }

  // Future<String> getTravelReport(TravelDto? inputDto, TravelVisaDto? inputDto2) async {
  //   ServiceApi serviceApi = await ClientBuilder().createService();
  //   final reportTravelDto = ReportTravelDto();
  //   reportTravelDto.addTravelDto(inputDto);
  //   reportTravelDto.addTravelVisaDto(inputDto2);
  //   String reportString = jsonEncode(reportTravelDto);
  //   StringUtils.log("getTravelReport String : ${reportString}");
  //
  //   reportString = Uri.encodeComponent(reportString);
  //
  //   final dto = ReportRequestDto(jsonMsg: reportString);
  //   EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
  //   final encryptResponseDto = await serviceApi.getTravelReport(encryptDto);
  //   String urlResult = "";
  //   if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
  //       && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
  //     String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
  //     StringUtils.log("getTravelReport response: $jsonString");
  //
  //     final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
  //     if(reportDto.linkdownload!=null){
  //       urlResult = reportDto.linkdownload!;
  //     }
  //
  //     StringUtils.log("getTravelReport success "+urlResult);
  //   }else{
  //     urlResult = "ERROR";
  //     StringUtils.log("getTravelReport failed");
  //   }
  //   return urlResult;
  // }

  Future<String> getImmReport(ImmDto? inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getImmReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getImmReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getImmReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }
      StringUtils.log("getImmReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getImmReport failed");
    }
    return urlResult;
  }

  Future<String> getExtensionReport(ExtensionDto? inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getExtensionReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getExtensionReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getExtensionReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }
      StringUtils.log("getExtensionReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getExtensionReport failed");
    }
    return urlResult;
  }

  Future<String> getTm61Report(Tm61Dto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getTm61Report String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTm61Report(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTm61Report response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getTm61Report success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getTm61Report failed");
    }
    return urlResult;
  }

  Future<String> getPtmReport(TicketDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getPtmReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPtmReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPtmReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getPtmReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getPtmReport failed");
    }
    return urlResult;
  }

  Future<String> getGunLinkageReport(GunDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getGunLinkageReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getGunLinkageReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getGunLinkageReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getGunLinkageReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getGunLinkageReport failed");
    }
    return urlResult;
  }

  Future<String> getCrimecasePersonReport(CrimeCasePersonDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getCrimecasePersonReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCrimecasePersonReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCrimecasePersonReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getCrimecasePersonReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getCrimecasePersonReport failed");
    }
    return urlResult;
  }

  Future<String> getWarrantReport(WarrantDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getWarrantReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getWarrantReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getWarrantReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getWarrantReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getWarrantReport failed");
    }
    return urlResult;
  }

  //WarrantCRD
  Future<String> getWarrantCRDReport(WarrantCRDDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getWarrantCRDReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getWarrantCRDReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getWarrantCRDReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getWarrantCRDReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getWarrantCRDReport failed");
    }
    return urlResult;
  }

  //WarrantCourtCRD
  Future<String> getWarrantCourtCRDReport(WarrantCourtCRDDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getWarrantCourtCRDReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getWarrantCourtCRDReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getWarrantCourtCRDReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getWarrantCourtCRDReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getWarrantCourtCRDReport failed");
    }
    return urlResult;
  }

  //RedNotice
  Future<String> getRedNoticeReport(RedNoticeDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getRedNoticeReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getRedNoticeReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getRedNoticeReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getRedNoticeReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getRedNoticeReport failed");
    }
    return urlResult;
  }

  Future<String> getTrafficcasePersonReport(TrafficCasePersonDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getTrafficcasePersonReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTrafficcasePersonReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTrafficcasePersonReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getTrafficcasePersonReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getTrafficcasePersonReport failed");
    }
    return urlResult;
  }

  Future<String> getCrimecaseVehicleReport(CrimeCaseVehicleDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getCrimecaseVehicleReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCrimecaseVehicleReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCrimecaseVehicleReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getCrimecaseVehicleReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getCrimecaseVehicleReport failed");
    }
    return urlResult;
  }

  Future<String> getTrafficcaseVehicleReport(TrafficCaseVehicleDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getTrafficcaseVehicleReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTrafficcaseVehicleReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTrafficcaseVehicleReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getTrafficcaseVehicleReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getTrafficcaseVehicleReport failed");
    }
    return urlResult;
  }

  Future<String> getCrimecaseReport(CrimeCaseDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getCrimecaseReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getCrimecaseReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getCrimecaseReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getCrimecaseReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getCrimecaseReport failed");
    }
    return urlResult;
  }

  Future<String> getTrafficcaseReport(TrafficCaseDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getTrafficcaseReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getTrafficcaseReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getTrafficcaseReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getTrafficcaseReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getTrafficcaseReport failed");
    }
    return urlResult;
  }

  Future<String> getDopaReport(PersonDto? inputDto,String image) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    final reportPersonDto = ReportPersonDto();
    reportPersonDto.addPersonDto(inputDto);
    reportPersonDto.setImage(image);

    String reportString = jsonEncode(reportPersonDto);
    StringUtils.log("getDopaReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getDopaReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getDopaReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getDopaReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getDopaReport failed");
    }
    return urlResult;
  }

  Future<String> getDopaLinkageReport(PersonLkDto? inputDto,HouseLkDto? inputDto2,String image) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    final reportPersonLkDto = ReportPersonLkDto();
    reportPersonLkDto.addPersonLk(inputDto);
    reportPersonLkDto.addHouseLk(inputDto2);
    reportPersonLkDto.setImage(image);
    String reportString = jsonEncode(reportPersonLkDto);
    StringUtils.log("getDopaLinkageReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getDopaLinkageReport(
        encryptDto);
    String urlResult = "";
    if (encryptResponseDto.data != null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce != null &&
        encryptResponseDto.nonce.isNotEmpty) {
      String jsonString = await CryptoUtils.decrypt(
          encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getDopaLinkageReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getDopaLinkageReport success " + urlResult);
    } else {
      urlResult = "ERROR";
      StringUtils.log("getDopaLinkageReport failed");
    }
    return urlResult;
  }

  Future<PoliceStationResponseDto> getPoliceStationList() async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = CommonRequestDto();
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPoliceStationList(encryptDto);

    final PoliceStationResponseDto response = PoliceStationResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPoliceStation response: $jsonString");

      final listPoliceStationDto = ListPoliceStationDto.fromJson(jsonDecode(jsonString));
      // for( var i = 0 ; i < listNewsDto.data.length; i++ ) {
      //   var url = listNewsDto.data[i].url;
      //   StringUtils.log("$i news $url");
      // }
      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPoliceStationDto = listPoliceStationDto;
      StringUtils.log("getNews success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPoliceStationDto = ListPoliceStationDto(data: []);
      StringUtils.log("getNews failed");
    }
    return response;

  }

  Future<PrisonerResponseDto> getPrisonerByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPrisonerByPid(encryptDto);

    final PrisonerResponseDto response = PrisonerResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPrisonerByPid response: $jsonString");

      final listPrisonerDto = ListPrisonerDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPrisonerDto = listPrisonerDto;
      StringUtils.log("getPrisonerByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPrisonerDto = ListPrisonerDto(data: []);
      StringUtils.log("getPrisonerByPid failed");
    }
    return response;
  }

  Future<PrisonerResponseDto> getPrisonerByName(String firstName,String lastName, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    firstName = Uri.encodeComponent(firstName);
    lastName = Uri.encodeComponent(lastName);

    final dto = NameRequestDto(fname: firstName,lname: lastName, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPrisonerByName(encryptDto);

    final PrisonerResponseDto response = PrisonerResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPrisonerByName response: $jsonString");

      final listPrisonerDto = ListPrisonerDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPrisonerDto = listPrisonerDto;
      StringUtils.log("getPrisonerByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPrisonerDto = ListPrisonerDto(data: []);
      StringUtils.log("getPrisonerByName failed");
    }
    return response;
  }

  Future<ImageResponseDto> getPrisonerImageByUrl(String imgUrl,String imgNo,String prisonerId, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    imgUrl = Uri.encodeComponent(imgUrl);
    imgNo = Uri.encodeComponent(imgNo);
    prisonerId = Uri.encodeComponent(prisonerId);

    final dto = PrisonImgRequestDto(imgUrl: imgUrl,imgNo: imgNo,prisonerId: prisonerId,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPrisonerImageByUrl(encryptDto);

    final ImageResponseDto response = ImageResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPrisonerImageByUrl response: $jsonString");

      final listImageDto = ListImageDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = listImageDto;
      StringUtils.log("getPrisonerImageByUrl success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listImageDto = ListImageDto(data: []);
      StringUtils.log("getPrisonerImageByUrl failed");
    }
    return response;
  }

  Future<String> getPrisonerReport(PrisonerDto inputDto,String image) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    inputDto.setImage(image);
    String reportString = jsonEncode(inputDto);
    StringUtils.log("getPrisonerReport String : "+reportString);

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPrisonerReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPrisonerReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getPrisonerReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getPrisonerReport failed");
    }
    return urlResult;
  }

  Future<NearestStationResponseDto> getNearestPoliceStation(String lat, String lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = NearestStationRequestDto(lat: lat, lon: lon);
    final response = await serviceApi.getNearestPoliceStation(dto);
    return response;
  }

  Future<ResponsibleStationResponseDto> getResponsiblePoliceStation(String lat, String lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    final dto = ResponsibleStationRequestDto(lat: lat, lon: lon);
    final response = await serviceApi.getResponsibletPoliceStation(dto);
    return response;
  }

  Future<void> pingUrl(String url) async {
    //Duration timeoutDuration = Duration(milliseconds: 3 * 1000);
    Duration timeoutDuration = Duration(seconds: 3);
    await Dio(BaseOptions(connectTimeout: timeoutDuration)).get(url);
  }

  // MockUp Rescue
  Future<PersonRvResponseDto> getPersonRvByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonRescueVolunteerByPid(encryptDto);

    final PersonRvResponseDto response = PersonRvResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonRvByPid response: $jsonString");

      final listPersonRvDto = ListPersonRvDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRvDto = listPersonRvDto;
      StringUtils.log("getPersonRvByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRvDto = ListPersonRvDto(data: []);
      StringUtils.log("getPersonRvByPid failed");
    }
    return response;
  }

  Future<PersonRvResponseDto> getPersonRvByName(String firstName,String lastName, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    firstName = Uri.encodeComponent(firstName);
    lastName = Uri.encodeComponent(lastName);

    final dto = NameRequestDto(fname: firstName,lname: lastName, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonRescueVolunteerByName(encryptDto);

    final PersonRvResponseDto response = PersonRvResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonRvByName response: $jsonString");

      final listPersonRvDto = ListPersonRvDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRvDto = listPersonRvDto;
      StringUtils.log("getPersonRvByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRvDto = ListPersonRvDto(data: []);
      StringUtils.log("getPersonRvByName failed");
    }
    return response;
  }

  Future<PersonRtResponseDto> getPersonRtByPid(String pid, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    pid = Uri.encodeComponent(pid);

    final dto = PidRequestDto(pid: pid, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonRescueTraniningByPid(encryptDto);

    final PersonRtResponseDto response = PersonRtResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonRtByPid response: $jsonString");

      final listPersonRtDto = ListPersonRtDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRtDto = listPersonRtDto;
      StringUtils.log("getPersonRtByPid success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRtDto = ListPersonRtDto(data: []);
      StringUtils.log("getPersonRtByPid failed");
    }
    return response;
  }

  Future<PersonRtResponseDto> getPersonRtByName(String firstName,String lastName, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    firstName = Uri.encodeComponent(firstName);
    lastName = Uri.encodeComponent(lastName);

    final dto = NameRequestDto(fname: firstName,lname: lastName, lat:lat, lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonRescueTrainingByName(encryptDto);

    final PersonRtResponseDto response = PersonRtResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonRtByName response: $jsonString");

      final listPersonRtDto = ListPersonRtDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRtDto = listPersonRtDto;
      StringUtils.log("getPersonRtByName success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listPersonRtDto = ListPersonRtDto(data: []);
      StringUtils.log("getPersonRtByName failed");
    }
    return response;
  }

  Future<CarFllResponseDto> getCarFllByPlate(String plate1, String plate2, String provcode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    plate1 = Uri.encodeComponent(plate1);
    plate2 = Uri.encodeComponent(plate2);
    provcode = Uri.encodeComponent(provcode);

    final dto = PlateRequestDto(plate1: plate1, plate2: plate2, provcode: provcode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getFlashingLightLicenseInfoByPlate(encryptDto);

    final CarFllResponseDto response = CarFllResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getFlashingLightLicenseInfoByPlate response: $jsonString");

      final listCarFllDto = ListCarFllDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCarFllDto = listCarFllDto;
      StringUtils.log("getFlashingLightLicenseInfoByPlate success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCarFllDto = ListCarFllDto(data: []);
      StringUtils.log("getFlashingLightLicenseInfoByPlate failed");
    }
    return response;
  }

  Future<CarAmlResponseDto> getCarAmlByPlate(String plate1, String plate2, String provcode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    plate1 = Uri.encodeComponent(plate1);
    plate2 = Uri.encodeComponent(plate2);
    provcode = Uri.encodeComponent(provcode);

    final dto = PlateRequestDto(plate1: plate1, plate2: plate2, provcode: provcode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getAmbulanceLicenseByPlate(encryptDto);

    final CarAmlResponseDto response = CarAmlResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getAmbulanceLicenseByPlate response: $jsonString");

      final listCarAmlDto = ListCarAmlDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCarAmlDto = listCarAmlDto;
      StringUtils.log("getAmbulanceLicenseByPlate success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listCarAmlDto = ListCarAmlDto(data: []);
      StringUtils.log("getAmbulanceLicenseByPlate failed");
    }
    return response;
  }

  Future<EmgcCarResponseDto> getEmergencyCarByPlate(String intitialNo, String number, String provcode, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    //intitialNo = Uri.encodeComponent(intitialNo);
    number = Uri.encodeComponent(number);
    provcode = Uri.encodeComponent(provcode);

    //final dto = PlateEmcRequestDto(intitialNo: intitialNo, number: number, provcode: provcode.substring(0,3),lat:lat,lon:lon);
    final dto = PlateEmcRequestDto(intitialNo: intitialNo, number: number, provcode: provcode,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getEmergencyCarByPlate(encryptDto);

    final EmgcCarResponseDto response = EmgcCarResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getEmergencyCarByPlate response: $jsonString");

      final listEmergencyCarDto = ListEmergencyCarDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmergencyCarDto = listEmergencyCarDto;
      StringUtils.log("getEmergencyCarByPlate success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmergencyCarDto = ListEmergencyCarDto(data: []);
      StringUtils.log("getEmergencyCarByPlate failed");
    }
    return response;
  }

  Future<EmgcCarResponseDto> getEmergencyCarByLicenseNumber(String licensenumber, double lat, double lon) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    //licensenumber = Uri.encodeComponent(licensenumber);

    final dto = LicenseNumberRequestDto(licensenumber:licensenumber,lat:lat,lon:lon);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getEmergencyCarbyLicenseNumber(encryptDto);

    final EmgcCarResponseDto response = EmgcCarResponseDto();
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getEmergencyCarByLicenseNumer response: $jsonString");

      final listEmergencyCarDto = ListEmergencyCarDto.fromJson(jsonDecode(jsonString));

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmergencyCarDto = listEmergencyCarDto;
      StringUtils.log("getEmergencyCarByLicenseNumer success");
    }else{

      response.status = encryptResponseDto.status;
      response.message = encryptResponseDto.message;
      response.listEmergencyCarDto = ListEmergencyCarDto(data: []);
      StringUtils.log("getEmergencyCarByLicenseNumer failed");
    }
    return response;
  }

  //EmergencyCar
  Future<String> getEmergencyCarReport(EmergencyCarDto inputDto) async {
    ServiceApi serviceApi = await ClientBuilder().createService();

    String reportString = jsonEncode(inputDto);
    StringUtils.log("getEmergencyCarReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getEmergencyCarReport(encryptDto);
    String urlResult = "";
    if(encryptResponseDto.data!=null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce!=null && encryptResponseDto.nonce.isNotEmpty){
      String jsonString = await CryptoUtils.decrypt(encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getEmergencyCarReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getEmergencyCarReport success "+urlResult);
    }else{
      urlResult = "ERROR";
      StringUtils.log("getEmergencyCarReport failed");
    }
    return urlResult;
  }

  //Foreign
  Future<String> getForeignReport(AlienPersonDto? inputDto ,HouseLkDto? inputDto2 ,String image) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    final reportAlienPersonDto = ReportAlienPersonDto();
    reportAlienPersonDto.addAlienPerson(inputDto);
    reportAlienPersonDto.addHouseLk(inputDto2);
    reportAlienPersonDto.setImage(image);
    String reportString = jsonEncode(reportAlienPersonDto);
    StringUtils.log("getForeignReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getForeignReport(
        encryptDto);
    String urlResult = "";
    if (encryptResponseDto.data != null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce != null &&
        encryptResponseDto.nonce.isNotEmpty) {
      String jsonString = await CryptoUtils.decrypt(
          encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getForeignReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getForeignReport success " + urlResult);
    } else {
      urlResult = "ERROR";
      StringUtils.log("getForeignReport failed");
    }
    return urlResult;
  }

  //Worker
  Future<String> getWorkerReport(AlienWorkerDto? inputDto ,String image) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    final reportAlienWorkerDto = ReportAlienWorkerDto();
    reportAlienWorkerDto.addAlienWorker(inputDto);
    reportAlienWorkerDto.setImage(image);
    String reportString = jsonEncode(reportAlienWorkerDto);
    StringUtils.log("getWorkerReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getWorkerReport(
        encryptDto);
    String urlResult = "";
    if (encryptResponseDto.data != null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce != null &&
        encryptResponseDto.nonce.isNotEmpty) {
      String jsonString = await CryptoUtils.decrypt(
          encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getWorkerReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getWorkerReport success " + urlResult);
    } else {
      urlResult = "ERROR";
      StringUtils.log("getWorkerReport failed");
    }
    return urlResult;
  }

  //PersonNonThai
  Future<String> getPersonNonThaiReport(PersonNonThaiDto? inputDto ,String image) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    final reportPersonNonThaiDto = ReportPersonNonThaiDto();
    reportPersonNonThaiDto.addPersonNonThai(inputDto);
    reportPersonNonThaiDto.setImage(image);
    String reportString = jsonEncode(reportPersonNonThaiDto);
    StringUtils.log("getPersonNonThaiReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonNonThaiReport(
        encryptDto);
    String urlResult = "";
    if (encryptResponseDto.data != null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce != null &&
        encryptResponseDto.nonce.isNotEmpty) {
      String jsonString = await CryptoUtils.decrypt(
          encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonNonThaiReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getPersonNonThaiReport success " + urlResult);
    } else {
      urlResult = "ERROR";
      StringUtils.log("getPersonNonThaiReport failed");
    }
    return urlResult;
  }

  Future<String> getPersonNoRegisReport(PersonNoRegisDto? inputDto ,String image) async {
    ServiceApi serviceApi = await ClientBuilder().createService();
    final reportPersonNoRegisDto = ReportPersonNoRegisDto();
    reportPersonNoRegisDto.addPersonNoRegis(inputDto);
    reportPersonNoRegisDto.setImage(image);
    String reportString = jsonEncode(reportPersonNoRegisDto);
    StringUtils.log("getPersonNoRegisReport String : ${reportString}");

    reportString = Uri.encodeComponent(reportString);

    final dto = ReportRequestDto(jsonMsg: reportString);
    EncryptRequestDto encryptDto = await CryptoUtils.encrypt(dto);
    final encryptResponseDto = await serviceApi.getPersonNoRegisReport(
        encryptDto);
    String urlResult = "";
    if (encryptResponseDto.data != null && encryptResponseDto.data.isNotEmpty
        && encryptResponseDto.nonce != null &&
        encryptResponseDto.nonce.isNotEmpty) {
      String jsonString = await CryptoUtils.decrypt(
          encryptResponseDto.data, encryptResponseDto.nonce);
      StringUtils.log("getPersonNoRegisReport response: $jsonString");

      final reportDto = ReportDto.fromJson(jsonDecode(jsonString));
      if(reportDto.linkdownload!=null){
        urlResult = reportDto.linkdownload!;
      }

      StringUtils.log("getPersonNoRegisReport success " + urlResult);
    } else {
      urlResult = "ERROR";
      StringUtils.log("getPersonNoRegisReport failed");
    }
    return urlResult;
  }

}