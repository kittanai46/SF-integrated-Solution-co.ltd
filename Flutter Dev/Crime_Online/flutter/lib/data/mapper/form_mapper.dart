import 'package:crimes/data/dto/inner/crimecase/crimecase_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_person_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_vehicle_dto.dart';
import 'package:crimes/data/dto/inner/emergency/emergency_car_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_person_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_vehicle_dto.dart';
import 'package:crimes/data/dto/inner/warrant/rednotice_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrant_dto.dart';
import 'package:crimes/data/dto/outer/car/driver_license_info_dto.dart';
import 'package:crimes/data/dto/outer/car/vehicle_info_dto.dart';
import 'package:crimes/data/dto/outer/civil/house_dto.dart';
import 'package:crimes/data/dto/outer/civil/idc_dto.dart';
import 'package:crimes/data/dto/outer/civil/person_dto.dart';
import 'package:crimes/data/dto/outer/foreign/worker_dto.dart';
import 'package:crimes/data/dto/outer/foreignhouse/tm61_dto.dart';
import 'package:crimes/data/dto/outer/health/health_dto.dart';
import 'package:crimes/data/dto/outer/immigration/extension_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_visa_dto.dart';
import 'package:crimes/data/dto/outer/linkage/card_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/house_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/make_card_lk_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_lk_dto.dart';
import 'package:crimes/data/dto/outer/p4/gun_dto.dart';
import 'package:crimes/data/dto/outer/prisoner/prisoner_dto.dart';
import 'package:crimes/data/dto/outer/rescue/car_flashing_light_license_dto.dart';
import 'package:crimes/data/dto/outer/social/employer_dto.dart';
import 'package:crimes/data/dto/outer/social/employment_dto.dart';
import 'package:crimes/data/dto/outer/social/hospital_dto.dart';
import 'package:crimes/data/dto/outer/traffic/ticket_dto.dart';
import 'package:crimes/data/dto/outer/warrantcourt/warrantcourt_dto.dart';
import 'package:crimes/data/entity/form_detail.dart';

import '../dto/inner/warrant/warrantcourtcrd_dto.dart';
import '../dto/inner/warrant/warrantcrd_dto.dart';
import '../dto/outer/cib/face_dto.dart';
import '../dto/outer/immigration/imm_dto.dart';
import '../dto/outer/linkage/alien_person_dto.dart';
import '../dto/outer/linkage/alien_worker_dto.dart';
import '../dto/outer/linkage/person_nonthai_dto.dart';
import '../dto/outer/linkage/person_noregis_dto.dart';
import '../dto/outer/rescue/car_ambulance_license_dto.dart';
import '../dto/outer/rescue/person_rescue_training_dto.dart';
import '../dto/outer/rescue/person_rescue_volunteer_dto.dart';

class FormMapper {

  // ------------- INNER -------------------

  List<FormDetail> mapCrimeCase(CrimeCaseDto? crimeCase){
    List<FormDetail> formArray = [];
    if(crimeCase!=null){
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_statusMagenta, desc: crimeCase.getStatusMagentaMessage(crimeCase.statusMagenta)));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_caseStatus, desc: crimeCase.getCaseStatusMessage(crimeCase.caseStatus)));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_caseNo, desc: crimeCase.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_crimeCaseNo, desc: crimeCase.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_crimeCaseYear, desc: crimeCase.crimeCaseYear));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_caseAcceptDate, desc: crimeCase.caseAcceptDate));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_occureDateTimeFrom, desc: crimeCase.occureDateTimeFrom));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_occureDateTimeTo, desc: crimeCase.occureDateTimeTo));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_policeFullName, desc: crimeCase.policeFullName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_displayVictimsName, desc: crimeCase.displayVictimsName/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_displaySuspectName, desc: crimeCase.displaySuspectName/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_displayCharge, desc: crimeCase.displayCharge/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_crimeLocationLane, desc: crimeCase.crimeLocationLane));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_crimeLocationRoad, desc: crimeCase.crimeLocationRoad));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_tambon, desc: crimeCase.tambon));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_tambonName, desc: crimeCase.tambonName));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_amphur, desc: crimeCase.amphur));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_amphurName, desc: crimeCase.amphurName));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_provinceCode, desc: crimeCase.provinceCode));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_provinceName, desc: crimeCase.provinceName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_displayResultCase_investigator, desc: crimeCase.getDisplayResultCaseInvestigatorMessage(crimeCase.displayResultCase_investigator)/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_displayResultC_headInvestigato, desc: crimeCase.getDisplayResultCHeadInvestigatoMessage(crimeCase.displayResultC_headInvestigato)/*, isShowDialog:true*/));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_orgCode, desc: crimeCase.orgCode));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_stationName, desc: crimeCase.stationName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_bk, desc: crimeCase.bk));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseConstant.m_bh, desc: crimeCase.bh));
    }
    return formArray;
  }

  List<FormDetail> mapCrimeCasePerson(CrimeCasePersonDto? crimeCasePerson){
    List<FormDetail> formArray = [];
    if(crimeCasePerson!=null){
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_caseNo, desc: crimeCasePerson.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_orgCode, desc: crimeCasePerson.orgCode));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_stationName, desc: crimeCasePerson.stationName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_bk, desc: crimeCasePerson.bk));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_bh, desc: crimeCasePerson.bh));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_occuredDateTimeFrom, desc: crimeCasePerson.occuredDateTimeFrom));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_caseAcceptDate, desc: crimeCasePerson.caseAcceptDate));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_crimeCaseNo, desc: crimeCasePerson.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_crimeCaseYear, desc: crimeCasePerson.crimeCaseYear));
      if(crimeCasePerson.statusVictimOrSuspect=="ผู้ต้องหา")
        formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_statusAboutWarrant, desc: crimeCasePerson.getStatusAboutWarrantMessage(crimeCasePerson.statusAboutWarrant)));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_statusVictimOrSuspect, desc: crimeCasePerson.getStatusVictimOrSuspectMessage(crimeCasePerson.statusVictimOrSuspect)));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_displayResultCase_investigator, desc: crimeCasePerson.getDisplayResultCaseInvestigatorMessage(crimeCasePerson.displayResultCase_investigator)/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_investigator_result, desc: crimeCasePerson.investigator_result));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_headinvest_result, desc: crimeCasePerson.headinvest_result));
      if(crimeCasePerson.statusVictimOrSuspect=="ผู้ต้องหา")
        formArray.add(FormDetail(isHeader: true, title: "ข้อมูลผู้ต้องหา", desc: ""));
      else
        formArray.add(FormDetail(isHeader: true, title: "ข้อมูลผู้แจ้ง/ผู้เสียหาย", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_suspectId, desc: crimeCasePerson.suspectId));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_firstNameTh, desc: crimeCasePerson.firstNameTh));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_surNameTh, desc: crimeCasePerson.surNameTh));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_suspectFullName, desc: crimeCasePerson.suspectFullName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_gender, desc: crimeCasePerson.gender));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_age, desc: crimeCasePerson.age));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_nationality, desc: crimeCasePerson.nationality));
      if(crimeCasePerson.statusVictimOrSuspect=="ผู้ต้องหา")
        formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_displayChargePerson, desc: crimeCasePerson.displayChargePerson/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: CrimeCasePersonConstant.m_passportNumber, desc: crimeCasePerson.passportNumber));
    }
    return formArray;
  }

  List<FormDetail> mapCrimeCaseVehicle(CrimeCaseVehicleDto? crimeCaseVehicle){
    List<FormDetail> formArray = [];
    if(crimeCaseVehicle!=null){
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_bh, desc: crimeCaseVehicle.bh));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_bk, desc: crimeCaseVehicle.bk));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_orgCode, desc: crimeCaseVehicle.orgCode));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_stationName, desc: crimeCaseVehicle.stationName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_caseNo, desc: crimeCaseVehicle.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_crimeCaseNo, desc: crimeCaseVehicle.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_crimeCaseYear, desc: crimeCaseVehicle.crimeCaseYear));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_noPlate_initial, desc: crimeCaseVehicle.noPlate_initial));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_noPlate_number, desc: crimeCaseVehicle.noPlate_number));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_provinceName, desc: crimeCaseVehicle.provinceName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_chasisNumber, desc: crimeCaseVehicle.chasisNumber));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_engineNumber, desc: crimeCaseVehicle.engineNumber));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_brandString, desc: crimeCaseVehicle.brandString));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_modelString, desc: crimeCaseVehicle.modelString));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_color, desc: crimeCaseVehicle.color));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_isLostCar, desc: crimeCaseVehicle.getIsLostCarMessage(crimeCaseVehicle.isLostCar)));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_isIntercept, desc: crimeCaseVehicle.getIsInterceptMessage(crimeCaseVehicle.isIntercept)));
    }
    return formArray;
  }
  List<FormDetail> mapCrimeCaseVehicleLost(CrimeCaseVehicleDto? crimeCaseVehicle){
    List<FormDetail> formArray = [];
    if(crimeCaseVehicle!=null){
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_bh, desc: crimeCaseVehicle.bh));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_bk, desc: crimeCaseVehicle.bk));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_orgCode, desc: crimeCaseVehicle.orgCode));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_stationName, desc: crimeCaseVehicle.stationName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_caseNo, desc: crimeCaseVehicle.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_crimeCaseNo, desc: crimeCaseVehicle.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_crimeCaseYear, desc: crimeCaseVehicle.crimeCaseYear));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_noPlate_initial, desc: crimeCaseVehicle.noPlate_initial));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_noPlate_number, desc: crimeCaseVehicle.noPlate_number));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_provinceName, desc: crimeCaseVehicle.provinceName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_chasisNumber, desc: crimeCaseVehicle.chasisNumber));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_engineNumber, desc: crimeCaseVehicle.engineNumber));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_brandString, desc: crimeCaseVehicle.brandString));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_modelString, desc: crimeCaseVehicle.modelString));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_color, desc: crimeCaseVehicle.color));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_isLostCar, desc: crimeCaseVehicle.getIsLostCarMessage(crimeCaseVehicle.isLostCar)));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_isIntercept, desc: crimeCaseVehicle.getIsInterceptMessage(crimeCaseVehicle.isIntercept)));
    }
    return formArray;
  }

  List<FormDetail> mapCrimeCaseVehicleWanted(CrimeCaseVehicleDto? crimeCaseVehicle){
    List<FormDetail> formArray = [];
    if(crimeCaseVehicle!=null){
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_bh, desc: crimeCaseVehicle.bh));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_bk, desc: crimeCaseVehicle.bk));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_orgCode, desc: crimeCaseVehicle.orgCode));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_stationName, desc: crimeCaseVehicle.stationName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_caseNo, desc: crimeCaseVehicle.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_crimeCaseNo, desc: crimeCaseVehicle.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_crimeCaseYear, desc: crimeCaseVehicle.crimeCaseYear));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_noPlate_initial, desc: crimeCaseVehicle.noPlate_initial));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_noPlate_number, desc: crimeCaseVehicle.noPlate_number));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_provinceName, desc: crimeCaseVehicle.provinceName));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_chasisNumber, desc: crimeCaseVehicle.chasisNumber));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_engineNumber, desc: crimeCaseVehicle.engineNumber));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_brandString, desc: crimeCaseVehicle.brandString));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_modelString, desc: crimeCaseVehicle.modelString));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_color, desc: crimeCaseVehicle.color));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_isLostCar, desc: crimeCaseVehicle.getIsLostCarMessage(crimeCaseVehicle.isLostCar)));
      formArray.add(FormDetail(isHeader: false, title: CrimeCaseVehicleConstant.m_isIntercept, desc: crimeCaseVehicle.getIsInterceptMessage(crimeCaseVehicle.isIntercept)));
    }
    return formArray;
  }


  List<FormDetail> mapTrafficCase(TrafficCaseDto trafficCase){
    List<FormDetail> formArray = [];
    if(trafficCase!=null){
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_statusMagenta, desc: trafficCase.getStatusMagentaMessage(trafficCase.statusMagenta)));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_caseStatus, desc: trafficCase.getCaseStatusMessage(trafficCase.caseStatus)));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_caseNo, desc: trafficCase.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_crimeCaseNo, desc: trafficCase.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_crimeCaseYear, desc: trafficCase.crimeCaseYear));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_caseAcceptDate, desc: trafficCase.caseAcceptDate));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_evenStartDate, desc: trafficCase.evenStartDate));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_evenEndDate, desc: trafficCase.evenEndDate));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_policeFullName, desc: trafficCase.policeFullName));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_displayVictimsName, desc: trafficCase.displayVictimsName/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_displaySuspectName, desc: trafficCase.displaySuspectName/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_displayCharge, desc: trafficCase.displayCharge/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_soi, desc: trafficCase.soi));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_road, desc: trafficCase.road));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_tambon, desc: trafficCase.tambon));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_tambonName, desc: trafficCase.tambonName));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_amphur, desc: trafficCase.amphur));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_amphurName, desc: trafficCase.amphurName));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_provinceCode, desc: trafficCase.provinceCode));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_provinceName, desc: trafficCase.provinceName));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_displayResultCase_investigator, desc: trafficCase.getDisplayResultCaseInvestigatorMessage(trafficCase.displayResultCase_investigator)/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_displayResultC_headInvestigato, desc: trafficCase.getDisplayResultCHeadInvestigatoMessage(trafficCase.displayResultC_headInvestigato)/*, isShowDialog:true*/));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_orgCode, desc: trafficCase.orgCode));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_stationName, desc: trafficCase.stationName));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_bk, desc: trafficCase.bk));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseConstant.m_bh, desc: trafficCase.bh));
    }
    return formArray;
  }

  List<FormDetail> mapTrafficCasePerson(TrafficCasePersonDto? trafficCasePerson){
    List<FormDetail> formArray = [];
    if(trafficCasePerson!=null){
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_caseNo, desc: trafficCasePerson.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_orgCode, desc: trafficCasePerson.orgCode));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_stationName, desc: trafficCasePerson.stationName));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_bk, desc: trafficCasePerson.bk));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_bh, desc: trafficCasePerson.bh));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_eventStartDate, desc: trafficCasePerson.eventStartDate));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_caseAcceptDate, desc: trafficCasePerson.caseAcceptDate));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_crimeCaseNo, desc: trafficCasePerson.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_crimeCaseYear, desc: trafficCasePerson.crimeCaseYear));
      if(trafficCasePerson.statusVictimOrSuspect=="ผู้ต้องหา")
        formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_statusAboutWarrant, desc: trafficCasePerson.getStatusAboutWarrantMessage(trafficCasePerson.statusAboutWarrant)));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_statusVictimOrSuspect, desc: trafficCasePerson.getStatusVictimOrSuspectMessage(trafficCasePerson.statusVictimOrSuspect)));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_displayResultCase_investigator, desc: trafficCasePerson.getDisplayResultCaseInvestigatorMessage(trafficCasePerson.displayResultCase_investigator)/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_investigator_result, desc: trafficCasePerson.investigator_result));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_headinvest_result, desc: trafficCasePerson.headinvest_result));
      if(trafficCasePerson.statusVictimOrSuspect=="ผู้ต้องหา")
        formArray.add(FormDetail(isHeader: true, title: "ข้อมูลผู้ต้องหา", desc: ""));
      else
        formArray.add(FormDetail(isHeader: true, title: "ข้อมูลผู้แจ้ง/ผู้เสียหาย", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_suspectId, desc: trafficCasePerson.suspectId));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_firstNameTh, desc: trafficCasePerson.firstNameTh));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_surNameTh, desc: trafficCasePerson.surNameTh));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_suspectFullName, desc: trafficCasePerson.suspectFullName));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_gender, desc: trafficCasePerson.gender));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_age, desc: trafficCasePerson.age));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_nationality, desc: trafficCasePerson.nationality));
      if(trafficCasePerson.statusVictimOrSuspect=="ผู้ต้องหา")
        formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_displayChargePerson, desc: trafficCasePerson.displayChargePerson/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: TrafficCasePersonConstant.m_passportNumber, desc: trafficCasePerson.passportNumber));
    }
    return formArray;
  }

  List<FormDetail> mapTrafficCaseVehicle(TrafficCaseVehicleDto? trafficCaseVehicle){
    List<FormDetail> formArray = [];
    if(trafficCaseVehicle!=null){
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_bh, desc: trafficCaseVehicle.bh));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_bk, desc: trafficCaseVehicle.bk));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_orgCode, desc: trafficCaseVehicle.orgCode));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_stationName, desc: trafficCaseVehicle.stationName));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_caseNo, desc: trafficCaseVehicle.caseNo));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_crimeCaseNo, desc: trafficCaseVehicle.crimeCaseNo));
      // formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_crimeCaseYear, desc: trafficCaseVehicle.crimeCaseYear));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_noPlate_initial, desc: trafficCaseVehicle.noPlate_initial));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_noPlate_number, desc: trafficCaseVehicle.noPlate_number));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_provinceName, desc: trafficCaseVehicle.provinceName));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_chasisNumber, desc: trafficCaseVehicle.chasisNumber));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_engineNumber, desc: trafficCaseVehicle.engineNumber));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_brandString, desc: trafficCaseVehicle.brandString));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_modelString, desc: trafficCaseVehicle.modelString));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_color, desc: trafficCaseVehicle.color));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_isLostCar, desc: trafficCaseVehicle.getIsLostCarMessage(trafficCaseVehicle.isLostCar)));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_isIntercept, desc: trafficCaseVehicle.getIsInterceptMessage(trafficCaseVehicle.isIntercept)));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_isArrestStatus, desc: trafficCaseVehicle.getIsArrestStatusMessage(trafficCaseVehicle.isArrestStatus)));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_isRegain, desc: trafficCaseVehicle.getIsRegainMessage(trafficCaseVehicle.isRegain)));
      formArray.add(FormDetail(isHeader: false, title: TrafficCaseVehicleConstant.m_isEvidence, desc: trafficCaseVehicle.getIsEvidenceMessage(trafficCaseVehicle.isEvidence)));
    }
    return formArray;
  }


  List<FormDetail> mapWarrant(WarrantDto? warrant){
    List<FormDetail> formArray = [];
    if(warrant!=null){
      if(warrant.statusExpired == "1") {// หมดอายุ
        formArray.add(FormDetail(isHeader: false,
            title: WarrantConstant.m_statusExpired,
            desc: "หมายจับหมดอายุ" ,isAlert:true));
      }
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_statusWarrant, desc: warrant.statusWarrant));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_caseType, desc: warrant.caseType));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_bh, desc: warrant.bh));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_stationName, desc: warrant.stationName));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_wrNo, desc: warrant.wrNo));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_caseNo, desc: warrant.caseNo));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_suspectId, desc: warrant.suspectId));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_suspectFullname, desc: warrant.suspectFullname));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_statusSuspectArrest, desc: warrant.statusSuspectArrest));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_court, desc: warrant.court));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_displayChargePerson, desc: warrant.displayChargePerson/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_policeFullname, desc: warrant.policeFullname));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_wrStartDate, desc: warrant.wrStartDate));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_wrEndDate, desc: warrant.wrEndDate));
      formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_wrAge, desc: warrant.wrAge));
      // formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_wrDate, desc: warrant.wrDate));
      // formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_suspectTambon, desc: warrant.suspectTambom));
      // formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_suspectAmphur, desc: warrant.suspectAmphur));
      // formArray.add(FormDetail(isHeader: false, title: WarrantConstant.m_suspectProvince, desc: warrant.suspectProvince));
    }
    return formArray;
  }

  // WarrantCRD
  List<FormDetail> mapWarrantCRD(WarrantCRDDto? warrant){
    List<FormDetail> formArray = [];
    if(warrant!=null){
      if(warrant.statusExpired == "1") {// หมดอายุ
        formArray.add(FormDetail(isHeader: false,
            title: WarrantConstant.m_statusExpired,
            desc: "หมายจับหมดอายุ" ,isAlert:true));
      }
      formArray.add(FormDetail(isHeader: false, title: 'เลขที่หมายจับ', desc: '${warrant.want_no}/${warrant.want_y}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_want_off, desc: warrant.want_off));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_want_d, desc: warrant.want_d));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_ex_d, desc: warrant.ex_d));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_want_name, desc: warrant.want_name));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_prize, desc: warrant.prize));
      formArray.add(FormDetail(isHeader: false, title: 'เลขที่คดี', desc: '${warrant.caseno}/${warrant.caseyear}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_caseorg, desc: warrant.caseorg));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_charge, desc: warrant.charge));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_happenaddr, desc: warrant.happenaddr /*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_police, desc: warrant.police));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_position, desc: warrant.position));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_proc_d, desc: warrant.proc_d));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_proc_off, desc: warrant.proc_off));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลผู้ต้องหา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_idno, desc: warrant.idno));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_pname, desc: warrant.pname));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_fname, desc: warrant.fname));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_midname, desc: warrant.midname));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_lname, desc: warrant.lname));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_engname, desc: warrant.engname));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_office, desc: warrant.office));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_cousin_name, desc: warrant.cousin_name));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_cousin_addr, desc: warrant.cousin_addr));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_spouse_name, desc: warrant.spouse_name));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_spouse_addr, desc: warrant.spouse_addr));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_gang, desc: warrant.gang));
      formArray.add(FormDetail(isHeader: false, title: WarrantCRDConstant.m_gang_name, desc: warrant.gang_name));
    }
    return formArray;
  }

  // WarrantCourtCRD
  List<FormDetail> mapWarrantCourtCRD(WarrantCourtCRDDto? warrant){
    // String charge1 = '';
    // String charge2 = '';
    // String charge21 = '';
    // String charge22 = '';
    // String charge23 = '';
    // String charge3 = '';
    // if(warrant?.charge_type_1=='Yes') charge1='/';
    // if(warrant?.charge_type_2=='Yes') charge2='/';
    // if(warrant?.charge_type_2_1=='Yes') charge21='/';
    // if(warrant?.charge_type_2_2=='Yes') charge22='/';
    // if(warrant?.charge_type_2_3=='Yes') charge23='/';
    // if(warrant?.charge_type_3=='Yes') charge3='/';
    List<FormDetail> formArray = [];
    if(warrant!=null){
      // if(warrant.statusExpired == "1") {// หมดอายุ
      //   formArray.add(FormDetail(isHeader: false,
      //       title: WarrantConstant.m_statusExpired,
      //       desc: "หมายจับหมดอายุ" ,isAlert:true));
      // }
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_woa_type, desc: '${warrant.woa_type}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_req_num_case_type_id, desc: '${warrant.req_num_case_type_id}'));
      formArray.add(FormDetail(isHeader: false, title: 'หมายเลขที่', desc: '${warrant.woa_no}/${warrant.woa_year}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_woa_date, desc: '${warrant.woa_date}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_woa_start_date, desc: '${warrant.woa_start_date}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_woa_end_date, desc: '${warrant.woa_end_date}'));
      formArray.add(FormDetail(isHeader: false, title: 'เลขดำ', desc: '${warrant.black_case_num}/${warrant.black_case_num}'));
      formArray.add(FormDetail(isHeader: false, title: 'เลขแดง', desc: '${warrant.red_case_num}/${warrant.red_case_num}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_fault_type_id, desc: '${warrant.fault_type_id}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_plaintiff, desc: '${warrant.plaintiff}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_accused, desc: '${warrant.accused}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_send_to_name, desc: '${warrant.send_to_name}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_charge, desc: '${warrant.charge}'));
      // formArray.add(FormDetail(isHeader: true, title: "ประเภทข้อหา", desc: ""));
      // formArray.add(FormDetail(isHeader: false, title: charge1, desc: '${WarrantCourtCRDConstant.m_charge_type_1}'));
      // formArray.add(FormDetail(isHeader: false, title: charge2, desc: '${WarrantCourtCRDConstant.m_charge_type_2}'));
      // formArray.add(FormDetail(isHeader: false, title: charge21, desc: '${WarrantCourtCRDConstant.m_charge_type_2_1}'));
      // formArray.add(FormDetail(isHeader: false, title: charge22, desc: '${WarrantCourtCRDConstant.m_charge_type_2_2}'));
      // formArray.add(FormDetail(isHeader: false, title: charge23, desc: '${WarrantCourtCRDConstant.m_charge_type_2_3}'));
      // formArray.add(FormDetail(isHeader: false, title: charge3, desc: '${WarrantCourtCRDConstant.m_charge_type_3}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_charge_other_text, desc: '${warrant.charge_other_text}'));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลผู้ต้องหา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_card_type, desc: warrant.acc_card_type));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_card_id, desc: warrant.acc_card_id));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_full_name, desc: warrant.acc_full_name));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_origin, desc: warrant.acc_origin));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_nation, desc: warrant.acc_nation));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_occupation, desc: warrant.acc_occupation));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_addno, desc: warrant.acc_addno));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_vilno, desc: warrant.acc_vilno));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_soi, desc: warrant.acc_soi));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_road, desc: warrant.acc_road));
      // formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_sub_district, desc: warrant.acc_sub_district));
      // formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_district, desc: warrant.acc_district));
      // formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_province, desc: warrant.acc_province));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_near, desc: warrant.acc_near));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_acc_tel, desc: warrant.acc_tel));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลศาล", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_court_injunction, desc: warrant.court_injunction));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_prescription, desc: '${warrant.prescription}  ${warrant.prescription_unit}'));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_appointment_type, desc: warrant.appointment_type));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_appointment_date, desc: warrant.appointment_date));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_judge_name, desc: warrant.judge_name));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_arrest_status, desc: warrant.arrest_status));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_arrest_date, desc: warrant.arrest_date));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_arrest_result, desc: warrant.arrest_result));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtCRDConstant.m_because, desc: warrant.because));
    }
    return formArray;
  }

  // RedNotice
  List<FormDetail> mapRedNotice(RedNoticeDto? warrant){
    List<FormDetail> formArray = [];
    if(warrant!=null){
      // if(warrant.statusExpired == "1") {// หมดอายุ
      //   formArray.add(FormDetail(isHeader: false,
      //       title: WarrantConstant.m_statusExpired,
      //       desc: "หมายจับหมดอายุ" ,isAlert:true));
      // }
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_sequenceNo, desc: '${warrant.sequenceNo}'));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_policeName, desc: '${warrant.policeName}'));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_suspectName, desc: '${warrant.suspectName}'));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_nationality, desc: '${warrant.nationality}'));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_warrantNumber, desc: warrant.warrantNumber));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_warrantExpire, desc: warrant.warrantExpireStr));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_controlNumber, desc: warrant.controlNumber));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_publishDate, desc: warrant.publishDateStr));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_charge, desc: warrant.charge));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_organizationOwner, desc: warrant.organizationOwner));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_bookNumber, desc: warrant.bookNumber));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_remarkVisited, desc: warrant.remarkVisited));
      formArray.add(FormDetail(isHeader: false, title: RedNoticeConstant.m_divisionOwner, desc: warrant.divisionOwner));

    }
    return formArray;
  }

  // FaceRec
  List<FormDetail> mapFaceRec(FaceDto? data){
    List<FormDetail> formArray = [];
    if(data!=null){
      formArray.add(FormDetail(isHeader: false, title: FaceConstant.m_personalid, desc: '${data.personalid}'));
      formArray.add(FormDetail(isHeader: false, title: FaceConstant.m_countrycode, desc: '${data.countrycode}'));
      formArray.add(FormDetail(isHeader: false, title: FaceConstant.m_score, desc: '${data.score}'));

    }
    return formArray;
  }

  // ------------- OUTER -------------------

  // Car
  List<FormDetail> mapDriverLicenseInfo(DriverLicenseInfoDto? driverLicenseInfo){
    List<FormDetail> formArray = [];
    if(driverLicenseInfo!=null){
      if(driverLicenseInfo.statusExpired == "true") {// หมดอายุ
        formArray.add(FormDetail(isHeader: false,
            title: DriverLicenseInfoConstant.m_statusExpired,
            desc: "ใบอนุญาตหมดอายุ" ,isAlert:true));
      }
      // formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_docType, desc: driverLicenseInfo.docType));
      // formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_pltCode, desc: driverLicenseInfo.pltCode));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_pltDesc, desc: driverLicenseInfo.pltDesc));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_issDate, desc: driverLicenseInfo.issDate));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_expDate, desc: driverLicenseInfo.expDate));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_idNo, desc: driverLicenseInfo.idNo));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_titleDesc, desc: driverLicenseInfo.titleDesc));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_fName, desc: driverLicenseInfo.fName));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_lName, desc: driverLicenseInfo.lName));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_titleEngDesc, desc: driverLicenseInfo.titleEngDesc));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_fNameEng, desc: driverLicenseInfo.fNameEng));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_lNameEng, desc: driverLicenseInfo.lNameEng));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_birthDate, desc: driverLicenseInfo.birthDate));
      // formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_sex, desc: driverLicenseInfo.sex));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_sexDesc, desc: driverLicenseInfo.sexDesc));
      // formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_natCode, desc: driverLicenseInfo.natCode));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_natDesc, desc: driverLicenseInfo.natDesc));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_addrNo, desc: driverLicenseInfo.addrNo));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_bldName, desc: driverLicenseInfo.bldName));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_villageName, desc: driverLicenseInfo.villageName));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_villageNo, desc: driverLicenseInfo.villageNo));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_soi, desc: driverLicenseInfo.soi));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_street, desc: driverLicenseInfo.street));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_tambon, desc: driverLicenseInfo.tambon));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_amphur, desc: driverLicenseInfo.amphur));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_province, desc: driverLicenseInfo.province));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_zipCode, desc: driverLicenseInfo.zipCode));
      // formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_offLocCodeode, desc: driverLicenseInfo.locCode));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_locDesc, desc: driverLicenseInfo.locDesc));
      // formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_offLocCode, desc: driverLicenseInfo.offLocCode));
      // formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_locFullDesc, desc: driverLicenseInfo.locFullDesc));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_rcpNo, desc: driverLicenseInfo.rcpNo));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_pcNo, desc: driverLicenseInfo.pcNo));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_pltNo, desc: driverLicenseInfo.pltNo));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_conditionDesc, desc: driverLicenseInfo.conditionDesc/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_excFee, desc: driverLicenseInfo.getExcFeeMessage(driverLicenseInfo.excFee)));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_rvkFlag, desc: driverLicenseInfo.getRvkFlagMessage(driverLicenseInfo.rvkFlag)));
      formArray.add(FormDetail(isHeader: false, title: DriverLicenseInfoConstant.m_srlNo, desc: driverLicenseInfo.srlNo));
    }
    return formArray;
  }

  List<FormDetail> mapVehicleInfo(VehicleInfoDto? vehicleInfo){
    List<FormDetail> formArray = [];
    if(vehicleInfo!=null){
      if(vehicleInfo.taxExpired == "true") {// หมดอายุ
        formArray.add(FormDetail(isHeader: false,
            title: VehicleInfoConstant.m_taxExpired,
            desc: "สิ้นอายุภาษี" ,isAlert:true));
      }
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_carStatus, desc: vehicleInfo.carStatus));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_expDate, desc: vehicleInfo.expDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_plate1, desc: vehicleInfo.plate1));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_plate2, desc: vehicleInfo.plate2));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_offLocCode, desc: vehicleInfo.offLocCode));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_vehTypeDesc, desc: vehicleInfo.vehTypeDesc/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_kindDesc, desc: vehicleInfo.kindDesc/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_brnDesc, desc: vehicleInfo.brnDesc/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_modelName, desc: vehicleInfo.modelName));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_mfgYear, desc: vehicleInfo.mfgYear));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_numBody, desc: vehicleInfo.numBody));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_color, desc: vehicleInfo.color));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_engBrnDesc, desc: vehicleInfo.engBrnDesc));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_numEng, desc: vehicleInfo.numEng));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_fuelDesc, desc: vehicleInfo.fuelDesc));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_cly, desc: vehicleInfo.cly));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_cc, desc: vehicleInfo.cc));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_wgtCar, desc: vehicleInfo.wgtCar));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_gasNo, desc: vehicleInfo.gasNo));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_lpgGasExpireDate, desc: vehicleInfo.lpgGasExpireDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_gasEndCertDate, desc: vehicleInfo.gasEndCertDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_holdFlag, desc: vehicleInfo.holdFlag));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_regDate, desc: vehicleInfo.regDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_lastSignDate, desc: vehicleInfo.lastSignDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_lastChkDate, desc: vehicleInfo.lastChkDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_oldLastSignDate, desc: vehicleInfo.oldLastSignDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_noteDate, desc: vehicleInfo.noteDate));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_note, desc: vehicleInfo.note/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: true, title: "ผู้ถือกรรมสิทธิ์", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_own_pid, desc: vehicleInfo.own_pid));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_own_fname, desc: vehicleInfo.own_fname));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_own_lname, desc: vehicleInfo.own_lname));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_own_addr, desc: vehicleInfo.own_addr));
      formArray.add(FormDetail(isHeader: true, title: "ผู้ครอบครอง", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_occ_pid, desc: vehicleInfo.occ_pid));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_occ_fname, desc: vehicleInfo.occ_fname));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_occ_lname, desc: vehicleInfo.occ_lname));
      formArray.add(FormDetail(isHeader: false, title: VehicleInfoConstant.m_occ_addr, desc: vehicleInfo.occ_addr));
    }
    return formArray;
  }


  // Civil
  List<FormDetail> mapPerson(PersonDto? person){
    List<FormDetail> formArray = [];
    if(person!=null){
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_pID, desc: person.pID));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_title, desc: person.title));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_firstName, desc: person.firstName));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_lastName, desc: person.lastName));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_birthdate, desc: person.birthdate));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_gender, desc: person.gender));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_age, desc: person.age));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_moveInDate, desc: person.moveInDate));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_peopleStatus, desc: person.peopleStatus));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_nationality, desc: person.nationality));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_houseOwnerStatus, desc: person.houseOwnerStatus));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_address, desc: person.address/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_houseID, desc: person.houseID));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_houseNumber, desc: person.houseNumber));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_moo, desc: person.moo));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_alley, desc: person.alley));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_soi, desc: person.soi));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_road, desc: person.road));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_tambon, desc: person.tambon));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_amphur, desc: person.amphur));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_province, desc: person.province));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_changedNationalityStatus, desc: person.changedNationalityStatus));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_changedNationalityDate, desc: person.changedNationalityDate));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลบิดา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_fatherPID, desc: person.fatherPID));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_fatherName, desc: person.fatherName));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_fatherNationality, desc: person.fatherNationality));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลมารดา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_motherPID, desc: person.motherPID));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_motherName, desc: person.motherName));
      formArray.add(FormDetail(isHeader: false, title: PersonConstant.m_motherNationality, desc: person.motherNationality));
    }
    return formArray;
  }

  // AlienPerson
  List<FormDetail> mapAlienPerson(AlienPersonDto? person){
    List<FormDetail> formArray = [];
    if(person!=null){
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_personalID, desc: person.personalID));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_titleDesc, desc: person.titleDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_firstName, desc: person.firstName));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_lastName, desc: person.lastName));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_dateOfBirth, desc: person.dateOfBirth));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_genderDesc, desc: person.genderDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_bloodType, desc: person.bloodType));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_dateInThai, desc: person.dateInThai));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_doeNumber, desc: person.doeNumber));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_marryStatus, desc: person.marryStatus));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_personAddDate, desc: person.personAddDate));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_religion, desc: person.religion));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_spouseName, desc: person.spouseName));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_statusAdded, desc: person.statusAdded));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_statusOfPersonDesc, desc: person.statusOfPersonDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_terminateDate, desc: person.terminateDate));
      formArray.add(FormDetail(isHeader: true, title: "หนังสือเดินทาง", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_passport_documentNo, desc: person.passport_documentNo));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_passport_documentIssuePlace, desc: person.passport_documentIssuePlace));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_passport_documentType, desc: person.passport_documentType));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_passport_issueDate, desc: person.passport_issueDate));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_passport_expireDate, desc: person.passport_expireDate));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูล VISA", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_visa_documentNo, desc: person.visa_documentNo));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_visa_visaRequestType, desc: person.visa_visaRequestType));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_visa_visaType, desc: person.visa_visaType));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_visa_documentIssuePlace, desc: person.visa_documentIssuePlace));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_visa_issueDate, desc: person.visa_issueDate));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_visa_expireDate, desc: person.visa_expireDate));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลบิดา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_father_personalID, desc: person.father_personalID));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_father_name, desc: person.father_name));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_father_nationalityDesc, desc: person.father_nationalityDesc));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลมารดา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_mother_personalID, desc: person.mother_personalID));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_mother_name, desc: person.mother_name));
      formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_mother_nationalityDesc, desc: person.mother_nationalityDesc));
      // formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่", desc: ""));
      // formArray.add(FormDetail(isHeader: false, title: AlienPersonConstant.m_houseID, desc: person.houseID));

    }
    return formArray;
  }


  // AlienWorker
  List<FormDetail> mapAlienWorker(AlienWorkerDto? person){
    List<FormDetail> formArray = [];
    if(person!=null){
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_personalID, desc: person.personalID));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_titleDesc, desc: person.titleDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_firstName, desc: person.firstName));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_lastName, desc: person.lastName));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_englishName, desc: person.englishName));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_dateOfBirth, desc: person.dateOfBirth));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_genderText, desc: person.genderText));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_nationalityDesc, desc: person.nationalityDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_occupationDesc, desc: person.occupationDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_occupationTypeDesc, desc: person.occupationTypeDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPermitIssueDate, desc: person.workPermitIssueDate));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPerminExpireDate, desc: person.workPerminExpireDate));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_cardIssueDate, desc: person.cardIssueDate));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_cardExpireDate, desc: person.cardExpireDate));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_healthCareProvider, desc: person.healthCareProvider));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_healthCareResult, desc: person.healthCareResult));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลสถานที่ทำงาน", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceDescription, desc: person.workPlaceDescription));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_houseID, desc: person.workPlaceAddress_houseID));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_houseNo, desc: person.workPlaceAddress_houseNo));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_villageNo, desc: person.workPlaceAddress_villageNo));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_alleyWayDesc, desc: person.workPlaceAddress_alleyWayDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_alleyDesc, desc: person.workPlaceAddress_alleyDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_roadDesc, desc: person.workPlaceAddress_roadDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_subdistrictDesc, desc: person.workPlaceAddress_subdistrictDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_districtDesc, desc: person.workPlaceAddress_districtDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_workPlaceAddress_provinceDesc, desc: person.workPlaceAddress_provinceDesc));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลนายจ้าง", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurId, desc: person.entrepreneurId));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurName, desc: person.entrepreneurName));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_houseNo, desc: person.entrepreneurAddress_houseNo));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_villageNo, desc: person.entrepreneurAddress_villageNo));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_alleyWayDesc, desc: person.entrepreneurAddress_alleyWayDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_alleyDesc, desc: person.entrepreneurAddress_alleyDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_roadDesc, desc: person.entrepreneurAddress_roadDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_subdistrictDesc, desc: person.entrepreneurAddress_subdistrictDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_districtDesc, desc: person.entrepreneurAddress_districtDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_entrepreneurAddress_provinceDesc, desc: person.entrepreneurAddress_provinceDesc));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_houseID, desc: person.address_houseID));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_houseNo, desc: person.address_houseNo));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_villageNo, desc: person.address_villageNo));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_alleyWayDesc, desc: person.address_alleyWayDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_alleyDesc, desc: person.address_alleyDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_roadDesc, desc: person.address_roadDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_subdistrictDesc, desc: person.address_subdistrictDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_districtDesc, desc: person.address_districtDesc));
      formArray.add(FormDetail(isHeader: false, title: AlienWorkerConstant.m_address_provinceDesc, desc: person.address_provinceDesc));
    }
    return formArray;
  }

  // PersonNonThai
  List<FormDetail> mapPersonNonThai(PersonNonThaiDto? person){
    List<FormDetail> formArray = [];
    if(person!=null){
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_personalID, desc: person.personalID));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameTH_title, desc: person.nameTH_title));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameTH_firstName, desc: person.nameTH_firstName));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameTH_middleName, desc: person.nameTH_middleName));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameTH_lastName, desc: person.nameTH_lastName));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameEN_title, desc: person.nameEN_title));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameEN_firstName, desc: person.nameEN_firstName));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameEN_middleName, desc: person.nameEN_middleName));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nameEN_lastName, desc: person.nameEN_lastName));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_dateOfBirth, desc: person.dateOfBirth));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_genderText, desc: person.genderText));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_nationalityText, desc: person.nationalityText));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_cardIssueDate, desc: person.cardIssueDate));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_cardExpireDate, desc: person.cardExpireDate));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseNo, desc: person.address_houseNo));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseVillageNo, desc: person.address_houseVillageNo));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseAlleyWay, desc: person.address_houseAlleyWay));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseAlley, desc: person.address_houseAlley));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseRoad, desc: person.address_houseRoad));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseSubDistrict, desc: person.address_houseSubDistrict));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseDistrict, desc: person.address_houseDistrict));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_address_houseProvince, desc: person.address_houseProvince));
    }
    return formArray;
  }

  // PersonNoRegis
  List<FormDetail> mapPersonNoRegis(PersonNoRegisDto? person){
    List<FormDetail> formArray = [];
    if(person!=null){
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_personalID, desc: person.personalID));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_title, desc: person.title));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_firstName, desc: person.firstName));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_lastName, desc: person.lastName));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_dateOfBirth, desc: person.dateOfBirth));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_genderText, desc: person.genderText));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_nationalityText, desc: person.nationalityText));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_cardIssueDate, desc: person.cardIssueDate));
      formArray.add(FormDetail(isHeader: false, title: PersonNonThaiConstant.m_cardExpireDate, desc: person.cardExpireDate));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseNo, desc: person.address_houseNo));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseVillageNo, desc: person.address_houseVillageNo));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseAlleyWay, desc: person.address_houseAlleyWay));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseAlley, desc: person.address_houseAlley));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseRoad, desc: person.address_houseRoad));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseSubDistrict, desc: person.address_houseSubDistrict));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseDistrict, desc: person.address_houseDistrict));
      formArray.add(FormDetail(isHeader: false, title: PersonNoRegisConstant.m_address_houseProvince, desc: person.address_houseProvince));
    }
    return formArray;
  }

  List<FormDetail> mapIdc(IdcDto? idc){
    List<FormDetail> formArray = [];
    if(idc!=null){
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_pB1Number, desc: idc.pB1Number));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_pID, desc: idc.pID));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_title, desc: idc.title));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_firstName, desc: idc.firstName));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_lastName, desc: idc.lastName));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_gender, desc: idc.gender));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_birthDate, desc: idc.birthDate));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_blood, desc: idc.blood));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_religion, desc: idc.religion));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_adress, desc: idc.adress));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_moo, desc: idc.moo));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_tambon, desc: idc.tambon));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_amphur, desc: idc.amphur));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_province, desc: idc.province));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_reqType, desc: idc.reqType));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_reqCardDate, desc: idc.reqCardDate));
      formArray.add(FormDetail(isHeader: false, title: IdcConstant.m_printCardDate, desc: idc.printCardDate));
    }
    return formArray;
  }
  List<FormDetail> mapHouse(HouseDto house){
    List<FormDetail> formArray = [];
    if(house!=null){
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_registerName, desc: house.registerName));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_houseID, desc: house.houseID));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_houseNo, desc: house.houseNo));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_moo, desc: house.moo));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_alley, desc: house.alley));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_soi, desc: house.soi));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_road, desc: house.road));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_tambon, desc: house.tambon));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_amphur, desc: house.amphur));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_province, desc: house.province));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_houseType, desc: house.houseType));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_buildDate, desc: house.buildDate));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_sellDate, desc: house.sellDate));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_villageName, desc: house.villageName));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_buildingName, desc: house.buildingName));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_buildingPlace, desc: house.buildingPlace));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_postcode, desc: house.postcode));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_houseShape, desc: house.houseShape));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_houseSize, desc: house.houseSize));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_areaNumber, desc: house.areaNumber));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_document, desc: house.document));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_documentNo, desc: house.documentNo));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_laneAreaSize, desc: house.laneAreaSize));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_telNumber, desc: house.telNumber));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_approvalNo, desc: house.approvalNo));
      formArray.add(FormDetail(isHeader: false, title: HouseConstant.m_urbanAreaName, desc: house.urbanAreaName));
    }
    return formArray;
  }


  // Foreign
  List<FormDetail> mapWorker(WorkerDto? worker){
    List<FormDetail> formArray = [];
    if(worker!=null){
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_workerID, desc: worker.workerID));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_fullNameEN, desc: worker.fullNameEN));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_firstName, desc: worker.firstName));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_lastName, desc: worker.lastName));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_marryStatus, desc: worker.marryStatus));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_peopleStatus, desc: worker.peopleStatus));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_birthdate, desc: worker.birthdate));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_gender, desc: worker.gender));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_nationality, desc: worker.nationality));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_oldWorkerID, desc: worker.oldWorkerID));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_houseID, desc: worker.houseID));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_houseNumber, desc: worker.houseNumber));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_moo, desc: worker.moo));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_alley, desc: worker.alley));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_soi, desc: worker.soi));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_road, desc: worker.road));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_tambon, desc: worker.tambon));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_amphur, desc: worker.amphur));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_province, desc: worker.province));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_place, desc: worker.place));
      formArray.add(FormDetail(isHeader: false, title: WorkerConstant.m_sellHouseDate, desc: worker.sellHouseDate));
    }
    return formArray;
  }

  // PersonLk
  List<FormDetail> mapPersonLk(PersonLkDto? personLk){
    List<FormDetail> formArray = [];
    if(personLk!=null){
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_pid, desc: personLk.pid));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_fullnameAndRank, desc: personLk.fullnameAndRank));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_genderCode, desc: personLk.genderCode));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_genderDesc, desc: personLk.genderDesc));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_age, desc: personLk.age));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_dateOfBirth, desc: personLk.dateOfBirth));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_nationalityCode, desc: personLk.nationalityCode));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_nationalityDesc, desc: personLk.nationalityDesc));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_ownerStatusDesc, desc: personLk.ownerStatusDesc));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_statusOfPersonCode, desc: personLk.statusOfPersonCode));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_statusOfPersonDesc, desc: personLk.statusOfPersonDesc));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_dateOfMoveIn, desc: personLk.dateOfMoveIn));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลบิดา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_fatherPersonalID, desc: personLk.fatherPersonalID));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_fatherName, desc: personLk.fatherName));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_fatherNationalityCode, desc: personLk.fatherNationalityCode));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_fatherNationalityDesc, desc: personLk.fatherNationalityDesc));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลมารดา", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_motherPersonalID, desc: personLk.motherPersonalID));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_motherName, desc: personLk.motherName));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_motherNationalityCode, desc: personLk.motherNationalityCode));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_motherNationalityDesc, desc: personLk.motherNationalityDesc));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลบุคคลเพิ่มเติม", desc: ""));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_titleCode, desc: personLk.titleCode));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_titleDesc, desc: personLk.titleDesc));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_titleName, desc: personLk.titleName));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_titleSex, desc: personLk.titleSex));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_firstName, desc: personLk.firstName));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_middleName, desc: personLk.middleName));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_lastName, desc: personLk.lastName));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_englishTitleDesc, desc: personLk.englishTitleDesc));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_englishFirstName, desc: personLk.englishFirstName));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_englishMiddleName, desc: personLk.englishMiddleName));
      formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_englishLastName, desc: personLk.englishLastName));
      // formArray.add(FormDetail(isHeader: false, title: PersonLkConstant.m_recordNumber, desc: '${personLk.recordNumber}'));
    }
    return formArray;
  }
  List<FormDetail> mapMakeCardLk(MakeCardLkDto? card){
    List<FormDetail> formArray = [];
    if(card!=null){
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_personalID, desc: card.personalID));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_titleTH, desc: card.titleTH));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_firstNameTH, desc: card.firstNameTH));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_middleNameTH, desc: card.middleNameTH));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_lastNameTH, desc: card.lastNameTH));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_sex, desc: card.sex));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_titleEN, desc: card.titleEN));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_firstNameEN, desc: card.firstNameEN));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_middleNameEN, desc: card.middleNameEN));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_lastNameEN, desc: card.lastNameEN));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_birthDate, desc: card.birthDate));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_blood, desc: card.blood));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_phoneNumber, desc: card.phoneNumber));
      // formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_documentNumber, desc: card.documentNumber));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_issueDate, desc: card.issueDate));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_issueTime, desc: card.issueTime));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_expireDate, desc: card.expireDate));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_cancelCause, desc: card.cancelCause));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_foreignCountry, desc: card.foreignCountry));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_foreignCountryCity, desc: card.foreignCountryCity));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_religion, desc: card.religion));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_religionOther, desc: card.religionOther));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่บนบัตร", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_houseNo, desc: card.houseNo));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_villageNo, desc: card.villageNo));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_alleyWayDesc, desc: card.alleyWayDesc));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_alleyDesc, desc: card.alleyDesc));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_roadDesc, desc: card.roadDesc));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_subdistrictDesc, desc: card.subdistrictDesc));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_districtDesc, desc: card.districtDesc));
      formArray.add(FormDetail(isHeader: false, title: MakeCardLkConstant.m_provinceDesc, desc: card.provinceDesc));
    }
    return formArray;
  }
  List<FormDetail> mapHouseLk(HouseLkDto? house){
    List<FormDetail> formArray = [];
    if(house!=null){
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_houseType, desc: house.houseType));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_houseTypeDesc, desc: house.houseTypeDesc));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_houseID, desc: house.houseID));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_houseNo, desc: house.houseNo));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_villageNo, desc: house.villageNo));
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_alleyWayCode, desc: house.alleyWayCode));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_alleyWayDesc, desc: house.alleyWayDesc));
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_alleyCode, desc: house.alleyCode));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_alleyDesc, desc: house.alleyDesc));
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_roadCode, desc: house.roadCode));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_roadDesc, desc: house.roadDesc));
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_subdistrictCode, desc: house.subdistrictCode));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_subdistrictDesc, desc: house.subdistrictDesc));
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_districtCode, desc: house.districtCode));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_districtDesc, desc: house.districtDesc));
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_provinceCode, desc: house.provinceCode));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_provinceDesc, desc: house.provinceDesc));
      // formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_rcodeCode, desc: house.rcodeCode));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_rcodeDesc, desc: house.rcodeDesc));
      formArray.add(FormDetail(isHeader: false, title: HouseLkConstant.m_dateOfTerminate, desc: house.dateOfTerminate));
    }
    return formArray;
  }

  // Foreign House
  List<FormDetail> mapTm61(Tm61Dto? tm61){
    List<FormDetail> formArray = [];
    if(tm61!=null){
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_fullname, desc: tm61.fullname));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_birthDate, desc: tm61.birthDate));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_nationenm, desc: tm61.nationenm));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_traveldocType, desc: tm61.traveldocType));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_passportPlace, desc: tm61.passportPlace));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_passportNo, desc: tm61.passportNo));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_passportDate, desc: tm61.passportDate));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_countenm, desc: tm61.countenm));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_inDate, desc: tm61.inDate));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_permitDate, desc: tm61.permitDate));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_convenm, desc: tm61.convenm));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_status, desc: tm61.status));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_reason, desc: tm61.reason));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_building, desc: tm61.building));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_addr, desc: tm61.addr));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_road, desc: tm61.road));
      // formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_tmbSeqno, desc: tm61.tmbSeqno));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_tmbDecs, desc: tm61.tmbDecs));
      // formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_ampSeqno, desc: tm61.ampSeqno));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_ampDecs, desc: tm61.ampDecs));
      // formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_pvSeqno, desc: tm61.pvSeqno));
      formArray.add(FormDetail(isHeader: false, title: Tm61Constant.m_pvDecs, desc: tm61.pvDecs));
    }
    return formArray;
  }


  // Health
  List<FormDetail> mapHealth(HealthDto? health){
    List<FormDetail> formArray = [];
    if(health!=null){
      formArray.add(FormDetail(isHeader: false, title: HealthConstant.m_healthFirst, desc: health.healthFirst));
      formArray.add(FormDetail(isHeader: false, title: HealthConstant.m_hospitalFirst, desc: health.hospitalFirst));
      formArray.add(FormDetail(isHeader: false, title: HealthConstant.m_sDateFirst, desc: health.sDateFirst));
      formArray.add(FormDetail(isHeader: false, title: HealthConstant.m_eDateFirst, desc: health.eDateFirst));
      formArray.add(FormDetail(isHeader: false, title: HealthConstant.m_healthSecond, desc: health.healthSecond));
      formArray.add(FormDetail(isHeader: false, title: HealthConstant.m_hospitalSecond, desc: health.hospitalSecond));
    }
    return formArray;
  }


  // Immigration
  // List<FormDetail> mapTravel(TravelDto? travel){
  //   List<FormDetail> formArray = [];
  //   if(travel!=null){
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_tMRunNo, desc: travel.tMRunNo));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_passportNo, desc: travel.passportNo));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_travelDate, desc: travel.travelDate));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_travelType, desc: travel.travelType));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_eFullname, desc: travel.eFullname));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_sex, desc: travel.sex));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_nationENM, desc: travel.nationENM));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_birthDate, desc: travel.birthDate));
  //     formArray.add(FormDetail(isHeader: false, title: TravelConstant.m_tM6No, desc: travel.tM6No));
  //   }
  //   return formArray;
  // }

  // List<FormDetail> mapTravelVisa(TravelVisaDto? travelVisa){
  //   List<FormDetail> formArray = [];
  //   if(travelVisa!=null){
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_visatypenm, desc: travelVisa.visatypenm));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_convregno, desc: travelVisa.convregno));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_conveyance, desc: travelVisa.conveyance));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_depttnm, desc: travelVisa.depttnm));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_efirstnm, desc: travelVisa.efirstnm));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_emiddlenm, desc: travelVisa.emiddlenm));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_efamilynm, desc: travelVisa.efamilynm));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_tfirstnm, desc: travelVisa.tfirstnm));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_tmiddlenm, desc: travelVisa.tmiddlenm));
  //     formArray.add(FormDetail(isHeader: false, title: TravelVisaConstant.m_tfamilynm, desc: travelVisa.tfamilynm));
  //   }
  //   return formArray;
  // }

  // Immigration
  List<FormDetail> mapImm(ImmDto? imm){
    List<FormDetail> formArray = [];
    if(imm!=null){
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_passportType, desc: imm.passportType));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_passportNo, desc: imm.passportNo));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_firstName, desc: imm.firstName));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_middleName, desc: imm.middleName));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_surname, desc: imm.surname));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_birthDate, desc: imm.birthDate));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_gender, desc: imm.gender));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_countryName, desc: imm.countryName));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_issueDate, desc: imm.issueDate));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_expiryDate, desc: imm.expiryDate));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_tripDtm, desc: imm.tripDtm));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_tripType, desc: imm.tripType));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_flightNo, desc: imm.flightNo));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_borderPostName, desc: imm.borderPostName));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_thResidence, desc: imm.thResidence));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_reason, desc: imm.reason));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_visaNumber, desc: imm.visaNumber));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_visaType, desc: imm.visaType));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_visaDesc, desc: imm.visaDesc));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_visaPermitDay, desc: imm.visaPermitDay));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_visaExp, desc: imm.visaExp));
      formArray.add(FormDetail(isHeader: false, title: ImmConstant.m_depCancelDate, desc: imm.depCancelDate));

    }
    return formArray;
  }

  // Extension
  List<FormDetail> mapExtension(ExtensionDto? data){
    List<FormDetail> formArray = [];
    if(data!=null){
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_passportno, desc: data.passportno));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_tm6no, desc: data.tm6no));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_documentno, desc: data.documentno));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_firstname, desc: data.firstname));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_middlename, desc: data.middlename));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_surname, desc: data.surname));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_gender, desc: data.gender));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_dob, desc: data.dob));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_birthplace, desc: data.birthplace));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_nationality, desc: data.nationality));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_country_name_en, desc: data.countryNameEn));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_country_name_th, desc: data.countryNameTh));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_issue_date, desc: data.issueDate));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_expiry_date, desc: data.expiryDate));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_in_date, desc: data.inDate));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_ext_date, desc: data.extDate));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_ext_day, desc: data.extDay));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_flightno, desc: data.flightno));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_visa_desc, desc: data.visaDesc));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_visa_expiry_date, desc: data.visaExpiryDate));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_permit_date, desc: data.permitDate));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_reference, desc: data.reference));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_reason, desc: data.reason));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_tel, desc: data.tel));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_building, desc: data.building));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_address, desc: data.address));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_road, desc: data.road));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_subdistrict, desc: data.subdistrict));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_district, desc: data.district));
      formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_province, desc: data.province));
      // formArray.add(FormDetail(isHeader: false, title: ExtensionConstant.m_livephoto, desc: data.livephoto));

    }
    return formArray;
  }

  // P4
  List<FormDetail> mapGun(GunDto? gun){
    List<FormDetail> formArray = [];
    if(gun!=null){
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_docDate, desc: gun.docDate));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_docPlaceDesc, desc: gun.docPlaceDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_docPlaceProvince, desc: gun.docPlaceProvince));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_docID, desc: gun.docID));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_expireDate, desc: gun.expireDate));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_applicantType, desc: gun.applicantType));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_signTitleDesc, desc: gun.signTitleDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_signFullName, desc: gun.signFullName));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_gunRegistrationId, desc: gun.gunRegistrationId));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_gunSerialNo, desc: gun.gunSerialNo));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_gunType, desc: gun.gunType));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_gunCharacteristic, desc: gun.gunCharacteristic));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_gunSize, desc: gun.gunSize));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_gunProduct, desc: gun.gunProduct));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_remark, desc: gun.remark));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_personalId, desc: gun.personalId));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_titleDesc, desc: gun.titleDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_firstName, desc: gun.firstName));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_middleName, desc: gun.middleName));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_lastName, desc: gun.lastName));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_genderDesc, desc: gun.genderDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_fullNameAndRank, desc: gun.fullNameAndRank));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_hidRcodeDesc, desc: gun.hidRcodeDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_hid, desc: gun.hid));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_hno, desc: gun.hno));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_trok, desc: gun.trok));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_soi, desc: gun.soi));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_thanon, desc: gun.thanon));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_districtDesc, desc: gun.districtDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_amphorDesc, desc: gun.amphorDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_provinceDesc, desc: gun.provinceDesc));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_personalId2, desc: gun.personalId2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_titleDesc2, desc: gun.titleDesc2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_firstName2, desc: gun.firstName2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_middleName2, desc: gun.middleName2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_lastName2, desc: gun.lastName2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_fullNameAndRank2, desc: gun.fullNameAndRank2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_genderDesc2, desc: gun.genderDesc2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_businessType, desc: gun.businessType));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_businessName, desc: gun.businessName));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_hidRcodeDesc2, desc: gun.hidRcodeDesc2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_hid2, desc: gun.hid2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_hno2, desc: gun.hno2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_trok2, desc: gun.trok2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_soi2, desc: gun.soi2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_thanon2, desc: gun.thanon2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_districtDesc2, desc: gun.districtDesc2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_amphorDesc2, desc: gun.amphorDesc2));
      formArray.add(FormDetail(isHeader: false, title: GunConstant.m_provinceDesc2, desc: gun.provinceDesc2));
    }
    return formArray;
  }

  // Social
  List<FormDetail> mapEmployer(EmployerDto? employer){
    List<FormDetail> formArray = [];
    if(employer!=null){
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_accNo, desc: employer.accNo));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_accBranch, desc: employer.accBranch));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyName, desc: employer.companyName));
      // formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyStatus, desc: employer.companyStatus));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyStatusDesc, desc: employer.companyStatusDesc));
      // formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyType, desc: employer.companyType));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyTypeDesc, desc: employer.companyTypeDesc));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyRigNo, desc: employer.companyRigNo));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyAddress, desc: employer.companyAddress));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyZip, desc: employer.companyZip));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_companyTel, desc: employer.companyTel));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_contactAddress, desc: employer.contactAddress));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_contactZip, desc: employer.contactZip));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_contactFax, desc: employer.contactFax));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_contactTel, desc: employer.contactTel));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_branchEmplyeeNo, desc: employer.branchEmplyeeNo));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_totalEmployeeNo, desc: employer.totalEmployeeNo));
      // formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_ssoBranchCode, desc: employer.ssoBranchCode));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_ssoBranchName, desc: employer.ssoBranchName));
      // formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_paySsoBranchCode, desc: employer.paySsoBranchCode));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_paySsoBranchName, desc: employer.paySsoBranchName));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_fdappl, desc: employer.fdappl));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_lddate, desc: employer.lddate));
      formArray.add(FormDetail(isHeader: false, title: EmployerConstant.m_newOperateDate, desc: employer.newOperateDate));
    }
    return formArray;
  }

  List<FormDetail> mapEmployment(EmploymentDto? employment){
    List<FormDetail> formArray = [];
    if(employment!=null){
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_ssoNum, desc: employment.ssoNum));
      // formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_idType, desc: employment.idType));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_idDesc, desc: employment.idDesc));
      // formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_titleCode, desc: employment.titleCode));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_titleCodeDesc, desc: employment.titleCodeDesc));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_firstName, desc: employment.firstName));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_lastName, desc: employment.lastName));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_empBirthDate, desc: employment.empBirthDate));
      // formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_gender, desc: employment.gender));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_genderDesc, desc: employment.genderDesc));
      // formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_activeStatus, desc: employment.activeStatus));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_activeStatusDesc, desc: employment.activeStatusDesc));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_expirationDate, desc: employment.expirationDate));
      // formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_accBran, desc: employment.accBran));
      // formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_accNo, desc: employment.accNo));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_companyName, desc: employment.companyName));
      // formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_employStatus, desc: employment.employStatus));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_employStatusDesc, desc: employment.employStatusDesc));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_expStartDate, desc: employment.expStartDate));
      formArray.add(FormDetail(isHeader: false, title: EmploymentConstant.m_empResignDate, desc: employment.empResignDate));
    }
    return formArray;
  }

  List<FormDetail> mapHospital(HospitalDto? hospital){
    List<FormDetail> formArray = [];
    if(hospital!=null){
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_activeStatus, desc: hospital.activeStatus));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_activeStatusDesc, desc: hospital.activeStatusDesc));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_empBirthDate, desc: hospital.empBirthDate));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_expirationDate, desc: hospital.expirationDate));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_firstName, desc: hospital.firstName));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_gender, desc: hospital.gender));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_genderDesc, desc: hospital.genderDesc));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_idDesc, desc: hospital.idDesc));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_idType, desc: hospital.idType));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_lastName, desc: hospital.lastName));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_ssoNum, desc: hospital.ssoNum));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_titleCode, desc: hospital.titleCode));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_titleCodeDesc, desc: hospital.titleCodeDesc));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_hospitalCode, desc: hospital.hospitalCode));
      formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_hospitalName, desc: hospital.hospitalName));
      formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_medYY, desc: hospital.medYY));
      formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_mselExpireDate, desc: hospital.mselExpireDate));
      formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_mselLastChange, desc: hospital.mselLastChange));
      formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_mselStartDate, desc: hospital.mselStartDate));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_mselStatus, desc: hospital.mselStatus));
      formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_mselStatusDesc, desc: hospital.mselStatusDesc));
      // formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_ssoBranchCode, desc: hospital.ssoBranchCode));
      formArray.add(FormDetail(isHeader: false, title: HospitalConstant.m_ssoBranchName, desc: hospital.ssoBranchName));
    }
    return formArray;
  }


  // Traffic
  List<FormDetail> mapTicket(TicketDto? ticket){
    List<FormDetail> formArray = [];
    if(ticket!=null){
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_ticketStatus, desc: ticket.ticketStatus));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_plate, desc: ticket.plate));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_ticketId, desc: ticket.ticketId));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_cardId, desc: ticket.cardId));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fullname, desc: ticket.fullname));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_occurDt, desc: ticket.occurDt));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_place, desc: ticket.place));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_crossDescHappen, desc: ticket.crossDescHappen));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_soiHappen, desc: ticket.soiHappen));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_roadHappen, desc: ticket.roadHappen));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_subdistrictHappen, desc: ticket.subdistrictHappen));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_districtHappen, desc: ticket.districtHappen));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_atkilometerHappen, desc: ticket.atkilometerHappen));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_accuse1Code, desc: ticket.accuse1Code));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fine1, desc: ticket.fine1));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_accuse2Code, desc: ticket.accuse2Code));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fine2, desc: ticket.fine2));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_accuse3Code, desc: ticket.accuse3Code));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fine3, desc: ticket.fine3));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_accuse4Code, desc: ticket.accuse4Code));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fine4, desc: ticket.fine4));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_accuse5Code, desc: ticket.accuse5Code));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fine5, desc: ticket.fine5));
      // formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_pic1, desc: ticket.pic1));
      // formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_pic2, desc: ticket.pic2));
      // formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_pic3, desc: ticket.pic3));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fineAmt, desc: ticket.fineAmt));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_ticketDate, desc: ticket.ticketDate));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_orgCode, desc: ticket.orgCode));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_orgAbbr, desc: ticket.orgAbbr));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_tel, desc: ticket.tel));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_fineDueDate, desc: ticket.fineDueDate));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_paidDate, desc: ticket.paidDate));
      formArray.add(FormDetail(isHeader: false, title: TicketConstant.m_paidBy, desc: ticket.paidBy));
    }
    return formArray;
  }
  // Prisoner
  List<FormDetail> mapPrisoner(PrisonerDto? prisoner){
    List<FormDetail> formArray = [];
    if(prisoner!=null){
      /*"REC_DATE": "2018-06-20",
      "ROWNUM": "1",
      "GENERAL_BLEMISH": "แผลเป็นที่นิ้วหัวแม่มือขวา  ขาซ้าย รอยสักไม่มี ไม่พิการ",
      "REL_AMPHUR": "บ้านโป่ง",
      "RACE_NAME": "ไทย",
      "NATIONALITY_NAME": "ไทย",
      "REL_TUMBON": "หนองกบ",
      "PRISON_PROVINCE_NAME": "กาญจนบุรี",
      "CASE_BASE": "1.ฉ้อโกง 2.ฉ้อโกง ",
      "IMAGE": "http://10.14.24.35/correction_ws/correct_image.php?pid=6134001735&tkn=f53b360fed28df6f95e74a3815b11c52938a31dfba8ca8394f0154d9a4d5f3f9&imgType=img",
      "PRISON_LNAME": "ริดแก้ว",
      "HIST_ID_CARD": "3700200446809",
      "DIST_DATE": "2018-06-26",
      "PRISONER_ID": "6134001735",
      "AGE": "52",
      "IMPOSE_END_DATE": "-",
      "PRISON_CODE": "340",
      "REL_ADDR_LINE_1": "199/104",
      "REL_ADDR_LINE_2": "5",
      "PRISON_REGION_CODE": "0",
      "GENERAL_DOB": "1968-11-11",
      "REL_CONTACT_NAME": "นางวันเพ็ญ ถิรปรีดา",
      "DOMICILE_PROVINCE_NAME": "ราชบุรี",
      "FINGER": "http://10.14.24.35/correction_ws/correct_finger.php?pid=6134001735&tkn=f53b360fed28df6f95e74a3815b11c52938a31dfba8ca8394f0154d9a4d5f3f9&imgType=img",
      "PRISON_NAME": "เรือนจำจังหวัดกาญจนบุรี",
      "PRISON_AREA_NAME": "เขต 7",
      "IMPOSE_START_DATE": "-",
      "REL_ADDR_LINE_3": "",
      "REL_PROVINCE": "ราชบุรี",
      "CONTACT_TEL_NO_1": "086-3821264"*/
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_histIdCard, desc: prisoner.histIdCard));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_title, desc: prisoner.title));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonerFname, desc: prisoner.prisonFname));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonLname, desc: prisoner.prisonLname));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_age, desc: prisoner.age));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_generalDob, desc: prisoner.generalDob));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_raceName, desc: prisoner.raceName));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_nationalityName, desc: prisoner.nationalityName));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_domicileProvinceName, desc: prisoner.domicileProvinceName));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonerId, desc: prisoner.prisonerId));
      // formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonCode, desc: prisoner.prisonCode));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonName, desc: prisoner.prisonName));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonAreaName, desc: prisoner.prisonAreaName));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonProvinceName, desc: prisoner.prisonProvinceName));
      // formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_prisonRegionCode, desc: prisoner.prisonRegionCode));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_caseBase, desc: prisoner.caseBase));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_generalBlemish, desc: prisoner.generalBlemish/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_recDate, desc: prisoner.recDate));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_distDate, desc: prisoner.distDate));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_imposeStartDate, desc: prisoner.imposeStartDate));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_imposeEndDate, desc: prisoner.imposeEndDate));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_relContactName, desc: prisoner.relContactName));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_contactTelNo1, desc: prisoner.contactTelNo1));
      formArray.add(FormDetail(isHeader: true, title: "ข้อมูลที่อยู่หลังปล่อยตัว", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_relAddrLine1, desc: prisoner.relAddrLine1));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_relAddrLine2, desc: prisoner.relAddrLine2));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_relAddrLine3, desc: prisoner.relAddrLine3));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_relTumbon, desc: prisoner.relTumbon));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_relAmphur, desc: prisoner.relAmphur));
      formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_relProvince, desc: prisoner.relProvince));
      // formArray.add(FormDetail(isHeader: false, title: PrisonerConstant.m_rowNum, desc: prisoner.rowNum));
    }
    return formArray;
  }

  List<FormDetail> mapWarrantCourt(WarrantCourtDto? warrant){
    List<FormDetail> formArray = [];
    if(warrant!=null){
      if(warrant.statusExpired == "1") {// หมดอายุ
        formArray.add(FormDetail(isHeader: false,
            title: WarrantCourtConstant.m_statusExpired,
            desc: "หมายจับหมดอายุ" ,isAlert:true));
      }
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_statusWarrant, desc: warrant.statusWarrant));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_caseType, desc: warrant.caseType));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_court, desc: warrant.court));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_wrNo, desc: warrant.wrNo));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_caseNo, desc: warrant.caseNo));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_suspectId, desc: warrant.suspectId));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_suspectFullname, desc: warrant.suspectFullname));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_statusSuspectArrest, desc: warrant.statusSuspectArrest));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_displayChargePerson, desc: warrant.displayChargePerson/*, isShowDialog:true*/));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_policeFullname, desc: warrant.policeFullname));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_wrStartDate, desc: warrant.wrStartDate));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_wrEndDate, desc: warrant.wrEndDate));
      formArray.add(FormDetail(isHeader: false, title: WarrantCourtConstant.m_wrAge, desc: warrant.wrAge));

    }
    return formArray;
  }
  
  // MockUp Rescue
  // List<FormDetail> mapPersonRescuseVolunteer(PersonRvDto? person){
  //   List<FormDetail> formArray = [];
  //   if(person!=null){
  //     if(person.isexpire == "1") {// หมดอายุ
  //       formArray.add(FormDetail(isHeader: false,
  //           title: PersonRvConstant.m_isexpire,
  //           desc: "บัตรหมดอายุ" ,isAlert:true));
  //     }
  //     formArray.add(FormDetail(isHeader: false, title: PersonRvConstant.m_org_name, desc: person.org_name));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRvConstant.m_pid, desc: person.pid));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRvConstant.m_fullname, desc: person.fullname));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRvConstant.m_issue_date, desc: person.issue_date));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRvConstant.m_expire_date, desc: person.expire_date));
  //   }
  //   return formArray;
  // }

  //mapPersonRescuseTraining
  // List<FormDetail> mapPersonRescuseTraining(PersonRtDto? person){
  //   List<FormDetail> formArray = [];
  //   if(person!=null){
  //     if(person.isexpire == "1") {// หมดอายุ
  //       formArray.add(FormDetail(isHeader: false,
  //           title: PersonRtConstant.m_isexpire,
  //           desc: "หมดอายุ" ,isAlert:true));
  //     }
  //     formArray.add(FormDetail(isHeader: false, title: PersonRtConstant.m_training_results, desc: person.training_results));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRtConstant.m_course_name, desc: person.course_name));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRtConstant.m_training_site, desc: person.training_site));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRtConstant.m_training_date, desc: person.training_date));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRtConstant.m_pid, desc: person.pid));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRtConstant.m_fullname, desc: person.fullname));
  //     formArray.add(FormDetail(isHeader: false, title: PersonRtConstant.m_expire_date, desc: person.expire_date));
  //   }
  //   return formArray;
  // }

  //mapCarFlashingLight
  // List<FormDetail> mapCarFlashingLight(CarFllDto? car){
  //   List<FormDetail> formArray = [];
  //   if(car!=null){
  //     if(car.isexpire == "1") {// หมดอายุ
  //       formArray.add(FormDetail(isHeader: false,
  //           title: CarFllConstant.m_isexpire,
  //           desc: "หมดอายุ" ,isAlert:true));
  //     }
  //
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_use_in_business, desc: car.use_in_business));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_permitted_light_colors, desc: car.permitted_light_colors));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_issue_date, desc: car.issue_date));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_expire_date, desc: car.expire_date));
  //     formArray.add(FormDetail(isHeader: true, title: "หน่วยงานที่ได้รับอนุญาต", desc: ""));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_org_name, desc: car.org_name));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_org_no, desc: car.org_no));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_org_road, desc: car.org_road));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_org_tambon, desc: car.org_tambon));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_org_amphur, desc: car.org_amphur));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_org_province, desc: car.org_province));
  //     formArray.add(FormDetail(isHeader: true, title: "รายละเอียดเกี่ยวกับรถได้รับอนุญาต", desc: ""));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_car_type, desc: car.car_type));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_car_plate, desc: car.car_plate));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_car_brand, desc: car.car_brand));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_car_model, desc: car.car_model));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_car_color, desc: car.car_color));
  //     formArray.add(FormDetail(isHeader: false, title: CarFllConstant.m_car_body, desc: car.car_body));
  //   }
  //   return formArray;
  // }

  //mapCarAmbulance
  // List<FormDetail> mapCarAmbulance(CarAmlDto? car){
  //   List<FormDetail> formArray = [];
  //   if(car!=null){
  //     if(car.isexpire == "1") {// หมดอายุ
  //       formArray.add(FormDetail(isHeader: false,
  //           title: CarAmlConstant.m_isexpire,
  //           desc: "หมดอายุ" ,isAlert:true));
  //     }
  //
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_org_name_allow, desc: car.org_name_allow));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_issue_date, desc: car.issue_date));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_expire_date, desc: car.expire_date));
  //     formArray.add(FormDetail(isHeader: true, title: "รายละเอียดเกี่ยวกับรถได้รับอนุญาต", desc: ""));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_car_type, desc: car.car_type));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_car_plate, desc: car.car_plate));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_car_brand, desc: car.car_brand));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_car_model, desc: car.car_model));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_car_color, desc: car.car_color));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_car_body, desc: car.car_body));
  //     formArray.add(FormDetail(isHeader: true, title: "ผู้ครอบครอง", desc: ""));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_occ_pid, desc: car.occ_pid));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_occ_fullname, desc: car.occ_fullname));
  //     formArray.add(FormDetail(isHeader: true, title: "ผู้ยื่นขออนุญาต", desc: ""));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_applicant_pid, desc: car.applicant_pid));
  //     formArray.add(FormDetail(isHeader: false, title: CarAmlConstant.m_applicant_fullname, desc: car.applicant_fullname));
  //   }
  //   return formArray;
  // }

//WarrantCRD
  List<FormDetail> mapEmergencyCar(EmergencyCarDto? car){
    List<FormDetail> formArray = [];
    if(car!=null){
      if(car.isExpire == "1") {// หมดอายุ
        formArray.add(FormDetail(isHeader: false,
            title: EmergencyCarConstant.m_isExpire,
            desc: "หมดอายุ" ,isAlert:true));
      }
      formArray.add(FormDetail(isHeader: false, title: "ทะเบียนรถ", desc: '${car.noPlateInitial} ${car.noPlateNumber}  ${car.province}'));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_carType, desc: car.carType));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_carBrand, desc: car.carBrand));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_carColor, desc: car.carColor));
      formArray.add(FormDetail(isHeader: true, title: "รายละเอียดการขออนุญาต", desc: ""));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_licenseNumber, desc: car.licenseNumber));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_emergencyVehicleType, desc: car.emergencyVehicleType));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_signalSound, desc: car.signalSound));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_signalColor, desc: car.signalColor));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_onAMission, desc: car.onAMission));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_acceptDate, desc: car.acceptDate));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_expirationDate, desc: car.expirationDate));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_policeStationPermission, desc: car.policeStationPermission));
      formArray.add(FormDetail(isHeader: false, title: "ผู้ขออนุญาต", desc: '${car.permissionRank}${car.permissionFirstName} ${car.permissionSurName}'));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_permissionAddress, desc: car.permissionAddress));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_tmaName, desc: car.tmaName));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_amaName, desc: car.amaName));
      formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_pvaName, desc: car.pvaName));
      // formArray.add(FormDetail(isHeader: true, title: "รายละเอียดผู้อนุมัติ", desc: ""));
      // formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_rankApprove, desc: car.rankApprove));
      // formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_firstNameApprove, desc: car.firstNameApprove));
      // formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_surNameApprove, desc: car.surNameApprove));
      // formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_positionApprove, desc: car.positionApprove));
      // formArray.add(FormDetail(isHeader: false, title: EmergencyCarConstant.m_policeStationApprove, desc: car.policeStationApprove));
    }
    return formArray;
  }

}


