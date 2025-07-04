import 'package:crimes/data/dto/inner/crimecase/crimecase_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_person_dto.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_vehicle_dto.dart';
import 'package:crimes/data/dto/inner/emergency/emergency_car_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_person_dto.dart';
import 'package:crimes/data/dto/inner/trafficcase/trafficcase_vehicle_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrant_dto.dart';
import 'package:crimes/data/dto/inner/warrant/warrantcrd_dto.dart';
import 'package:crimes/data/dto/outer/car/driver_license_info_dto.dart';
import 'package:crimes/data/dto/outer/car/vehicle_info_dto.dart';
import 'package:crimes/data/dto/outer/civil/person_dto.dart';
import 'package:crimes/data/dto/outer/foreign/worker_dto.dart';
import 'package:crimes/data/dto/outer/foreignhouse/tm61_dto.dart';
import 'package:crimes/data/dto/outer/health/health_dto.dart';
import 'package:crimes/data/dto/outer/immigration/imm_dto.dart';
import 'package:crimes/data/dto/outer/immigration/person_migwis_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_visa_dto.dart';
import 'package:crimes/data/dto/outer/linkage/person_lk_dto.dart';
import 'package:crimes/data/dto/outer/p4/gun_dto.dart';
import 'package:crimes/data/dto/outer/rescue/car_flashing_light_license_dto.dart';
import 'package:crimes/data/dto/outer/social/employer_dto.dart';
import 'package:crimes/data/dto/outer/social/employment_dto.dart';
import 'package:crimes/data/dto/outer/social/hospital_dto.dart';
import 'package:crimes/data/dto/outer/traffic/ticket_dto.dart';
import 'package:crimes/data/dto/outer/prisoner/prisoner_dto.dart';
import 'package:crimes/data/dto/outer/warrantcourt/warrantcourt_dto.dart';
import 'package:crimes/data/entity/group_result.dart';
import 'package:crimes/data/mapper/form_mapper.dart';

import '../dto/inner/warrant/rednotice_dto.dart';
import '../dto/inner/warrant/warrantcourtcrd_dto.dart';
import '../dto/outer/cib/face_dto.dart';
import '../dto/outer/immigration/extension_dto.dart';
import '../dto/outer/linkage/alien_person_dto.dart';
import '../dto/outer/linkage/alien_worker_dto.dart';
import '../dto/outer/linkage/person_nonthai_dto.dart';
import '../dto/outer/linkage/person_noregis_dto.dart';
import '../dto/outer/rescue/car_ambulance_license_dto.dart';
import '../dto/outer/rescue/person_rescue_training_dto.dart';
import '../dto/outer/rescue/person_rescue_volunteer_dto.dart';

class ResultMapper {

  // ------------- INNER -------------------

  List<Result> mapCrimeCase(List<CrimeCaseDto>? crimeCaseArray){
    List<Result> resultArray = [];
    if(crimeCaseArray!=null){
      for(int i=0; i<crimeCaseArray.length; i++){
        CrimeCaseDto crimeCase = crimeCaseArray[i];
        final title = 'เลขคดี: ${crimeCase.caseNo} สน./สภ.: ${crimeCase.stationName}';
        final line1 = 'พงส.: ${crimeCase.policeFullName}';
        final line2 = 'สถานะคดี: ${crimeCase.getStatusMagentaMessage(crimeCase.statusMagenta)}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapCrimeCase(crimeCase), data: crimeCase);
        result.excelTitle = [CrimeCaseConstant.m_caseNo, CrimeCaseConstant.m_displayVictimsName, CrimeCaseConstant.m_statusMagenta];
        result.excelValue = ['${crimeCase.caseNo}', '${crimeCase.displayVictimsName}', '${crimeCase.getStatusMagentaMessage(crimeCase.statusMagenta)}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  List<Result> mapCrimeCasePerson(List<CrimeCasePersonDto>? crimeCasePersonArray){
    List<Result> resultArray = [];
    if(crimeCasePersonArray!=null){
      for(int i=0; i<crimeCasePersonArray.length; i++){
        CrimeCasePersonDto crimeCasePerson = crimeCasePersonArray[i];
        final title = 'เลขคดี: ${crimeCasePerson.caseNo} สน./สภ.: ${crimeCasePerson.stationName}';
        final line1 = 'ชื่อ-สกุล: ${crimeCasePerson.suspectFullName}';
        // final line2 = 'เกี่ยวข้องกับคดี: ${crimeCasePerson.getStatusVictimOrSuspectMessage(crimeCasePerson.statusVictimOrSuspect)}';
        String line2 = 'เกี่ยวข้องกับคดี: ${crimeCasePerson.getStatusVictimOrSuspectMessage(crimeCasePerson.statusVictimOrSuspect)}';
        if('${crimeCasePerson.statusVictimOrSuspect}'=="ผู้ต้องหา"){
          line2 = line2+' ข้อหา: ${crimeCasePerson.displayChargePerson}';
        }
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapCrimeCasePerson(crimeCasePerson), data: crimeCasePerson);
        result.excelTitle = ['เลขบัตรประชาชน', 'เลขพาสปอร์ต', 'ชื่อ - นามสกุล', 'เพศ', 'อายุ', 'เลขคดี/ปี', CrimeCasePersonConstant.m_statusVictimOrSuspect, 'สน/สภ.'];
        result.excelValue = ['${crimeCasePerson.suspectId}', '${crimeCasePerson.passportNumber}', '${crimeCasePerson.suspectFullName}', '${crimeCasePerson.gender}', '${crimeCasePerson.age}', '${crimeCasePerson.caseNo}/${crimeCasePerson.crimeCaseYear}', '${crimeCasePerson.statusVictimOrSuspect}', '${crimeCasePerson.stationName}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  List<Result> mapCrimeCaseVehicle(List<CrimeCaseVehicleDto>? crimeCaseVehicleArray){
    List<Result> resultArray = [];
    if(crimeCaseVehicleArray!=null){
      for(int i=0; i<crimeCaseVehicleArray.length; i++){
        CrimeCaseVehicleDto crimeCaseVehicle = crimeCaseVehicleArray[i];
        final title = 'เลขคดี: ${crimeCaseVehicle.caseNo} สน./สภ.: ${crimeCaseVehicle.stationName}';
        final line1 = 'ทะเบียนรถ: ${crimeCaseVehicle.noPlate_initial}-${crimeCaseVehicle.noPlate_number} ${crimeCaseVehicle.provinceName}';
        final line2 = 'ยี่ห้อ: ${crimeCaseVehicle.brandString} สี: ${crimeCaseVehicle.color}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapCrimeCaseVehicle(crimeCaseVehicle), data: crimeCaseVehicle);
        result.excelTitle = [CrimeCaseVehicleConstant.m_noPlate_initial, CrimeCaseVehicleConstant.m_noPlate_number, CrimeCaseVehicleConstant.m_provinceName, CrimeCaseVehicleConstant.m_brandString, CrimeCaseVehicleConstant.m_modelString, CrimeCaseVehicleConstant.m_color, 'เลขคดี/ปี', CrimeCaseVehicleConstant.m_isLostCar, 'สน.ภ'];
        result.excelValue = ['${crimeCaseVehicle.noPlate_initial}', '${crimeCaseVehicle.noPlate_number}', '${crimeCaseVehicle.provinceName}', '${crimeCaseVehicle.brandString}', '${crimeCaseVehicle.modelString}', '${crimeCaseVehicle.color}', '${crimeCaseVehicle.caseNo}/${crimeCaseVehicle.crimeCaseYear}', '${crimeCaseVehicle.getIsLostCarMessage(crimeCaseVehicle.isLostCar)}', '${crimeCaseVehicle.stationName}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  List<Result> mapCrimeCaseVehicleLost(List<CrimeCaseVehicleDto>? crimeCaseVehicleArray){
    List<Result> resultArray = [];
    if(crimeCaseVehicleArray!=null){
      for(int i=0; i<crimeCaseVehicleArray.length; i++){
        CrimeCaseVehicleDto crimeCaseVehicle = crimeCaseVehicleArray[i];
        final title = 'เลขคดี: ${crimeCaseVehicle.caseNo} สน./สภ.: ${crimeCaseVehicle.stationName}';
        final line1 = 'ทะเบียนรถ: ${crimeCaseVehicle.noPlate_initial}-${crimeCaseVehicle.noPlate_number} ${crimeCaseVehicle.provinceName}';
        final line2 = 'ยี่ห้อ: ${crimeCaseVehicle.brandString} สี: ${crimeCaseVehicle.color}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapCrimeCaseVehicleLost(crimeCaseVehicle), data: crimeCaseVehicle);
        result.excelTitle = [CrimeCaseVehicleConstant.m_noPlate_initial, CrimeCaseVehicleConstant.m_noPlate_number, CrimeCaseVehicleConstant.m_provinceName, CrimeCaseVehicleConstant.m_brandString, CrimeCaseVehicleConstant.m_modelString, CrimeCaseVehicleConstant.m_color, 'เลขคดี/ปี', CrimeCaseVehicleConstant.m_isLostCar, 'สน.ภ'];
        result.excelValue = ['${crimeCaseVehicle.noPlate_initial}', '${crimeCaseVehicle.noPlate_number}', '${crimeCaseVehicle.provinceName}', '${crimeCaseVehicle.brandString}', '${crimeCaseVehicle.modelString}', '${crimeCaseVehicle.color}', '${crimeCaseVehicle.caseNo}/${crimeCaseVehicle.crimeCaseYear}', '${crimeCaseVehicle.getIsLostCarMessage(crimeCaseVehicle.isLostCar)}', '${crimeCaseVehicle.stationName}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  List<Result> mapCrimeCaseVehicleWanted(List<CrimeCaseVehicleDto>? crimeCaseVehicleArray){
    List<Result> resultArray = [];
    if(crimeCaseVehicleArray!=null){
      for(int i=0; i<crimeCaseVehicleArray.length; i++){
        CrimeCaseVehicleDto crimeCaseVehicle = crimeCaseVehicleArray[i];
        final title = 'เลขคดี: ${crimeCaseVehicle.caseNo} สน./สภ.: ${crimeCaseVehicle.stationName}';
        final line1 = 'ทะเบียนรถ: ${crimeCaseVehicle.noPlate_initial}-${crimeCaseVehicle.noPlate_number} ${crimeCaseVehicle.provinceName}';
        final line2 = 'ยี่ห้อ: ${crimeCaseVehicle.brandString} สี: ${crimeCaseVehicle.color}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapCrimeCaseVehicleWanted(crimeCaseVehicle), data: crimeCaseVehicle);
        result.excelTitle = [CrimeCaseVehicleConstant.m_noPlate_initial, CrimeCaseVehicleConstant.m_noPlate_number, CrimeCaseVehicleConstant.m_provinceName, CrimeCaseVehicleConstant.m_brandString, CrimeCaseVehicleConstant.m_modelString, CrimeCaseVehicleConstant.m_color, 'เลขคดี/ปี', CrimeCaseVehicleConstant.m_isLostCar, 'สน.ภ'];
        result.excelValue = ['${crimeCaseVehicle.noPlate_initial}', '${crimeCaseVehicle.noPlate_number}', '${crimeCaseVehicle.provinceName}', '${crimeCaseVehicle.brandString}', '${crimeCaseVehicle.modelString}', '${crimeCaseVehicle.color}', '${crimeCaseVehicle.caseNo}/${crimeCaseVehicle.crimeCaseYear}', '${crimeCaseVehicle.getIsLostCarMessage(crimeCaseVehicle.isLostCar)}', '${crimeCaseVehicle.stationName}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


  List<Result> mapTrafficCase(List<TrafficCaseDto>? trafficCaseArray){
    List<Result> resultArray = [];
    if(trafficCaseArray!=null){
      for(int i=0; i<trafficCaseArray.length; i++){
        TrafficCaseDto trafficCase = trafficCaseArray[i];
        final title = 'เลขคดี: ${trafficCase.caseNo} สน./สภ.ซ ${trafficCase.stationName}';
        final line1 = 'พงส.: ${trafficCase.policeFullName}';
        final line2 = 'สถานะคดี: ${trafficCase.getStatusMagentaMessage(trafficCase.statusMagenta)}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapTrafficCase(trafficCase), data: trafficCase);
        result.excelTitle = [TrafficCaseConstant.m_caseNo, TrafficCaseConstant.m_displayVictimsName, TrafficCaseConstant.m_statusMagenta];
        result.excelValue = ['${trafficCase.caseNo}', '${trafficCase.displayVictimsName}', '${trafficCase.getStatusMagentaMessage(trafficCase.statusMagenta)}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  List<Result> mapTrafficCasePerson(List<TrafficCasePersonDto>? trafficCasePersonArray, String pid, String pasId){
    List<Result> resultArray = [];
    if(trafficCasePersonArray!=null){
      for(int i=0; i<trafficCasePersonArray.length; i++){
        TrafficCasePersonDto trafficCasePerson = trafficCasePersonArray[i];
        final title = 'เลขคดี: ${trafficCasePerson.caseNo} สน./สภ.: ${trafficCasePerson.stationName}';
        final line1 = 'ชื่อ-สกุล: ${trafficCasePerson.suspectFullName}';
        // final line2 = 'เกี่ยวข้องกับคดี: ${trafficCasePerson.getStatusVictimOrSuspectMessage(trafficCasePerson.statusVictimOrSuspect)}';
        String line2 = 'เกี่ยวข้องกับคดี: ${trafficCasePerson.getStatusVictimOrSuspectMessage(trafficCasePerson.statusVictimOrSuspect)}';
        if('${trafficCasePerson.statusVictimOrSuspect}'=="ผู้ต้องหา"){
          line2 = line2+' ข้อหา: ${trafficCasePerson.displayChargePerson}';
        }
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapTrafficCasePerson(trafficCasePerson), data: trafficCasePerson);
        if(pid!=null && pid.isNotEmpty){
          result.excelTitle = ['เลขบัตรประชาชน', 'ชื่อ - นามสกุล', 'เพศ', 'อายุ', 'เลขคดี/ปี', TrafficCasePersonConstant.m_statusVictimOrSuspect, 'สน/สภ.'];
          result.excelTitle = ['${trafficCasePerson.suspectId}', '${trafficCasePerson.suspectFullName}', '${trafficCasePerson.gender}', '${trafficCasePerson.age}', '${trafficCasePerson.caseNo}/${trafficCasePerson.crimeCaseYear}', '${trafficCasePerson.statusVictimOrSuspect}', '${trafficCasePerson.stationName}'];
        }else{
          result.excelTitle = ['เลขพาสปอร์ต', 'ชื่อ - นามสกุล', 'เพศ', 'อายุ', 'เลขคดี/ปี', TrafficCasePersonConstant.m_statusVictimOrSuspect, 'สน/สภ.'];
          result.excelTitle = ['${trafficCasePerson.passportNumber}', '${trafficCasePerson.suspectFullName}', '${trafficCasePerson.gender}', '${trafficCasePerson.age}', '${trafficCasePerson.caseNo}/${trafficCasePerson.crimeCaseYear}', '${trafficCasePerson.statusVictimOrSuspect}', '${trafficCasePerson.stationName}'];
        }
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  List<Result> mapTrafficCaseVehicle(List<TrafficCaseVehicleDto>? trafficCaseVehicleArray){
    List<Result> resultArray = [];
    if(trafficCaseVehicleArray!=null){
      for(int i=0; i<trafficCaseVehicleArray.length; i++){
        TrafficCaseVehicleDto trafficCaseVehicle = trafficCaseVehicleArray[i];
        /*final title = 'เลขคดี: ${crimeCaseVehicle.caseNo} สน./สภ.: ${crimeCaseVehicle.stationName}';
      final line1 = 'ทะเบียนรถ: ${crimeCaseVehicle.noPlate_initial}-${crimeCaseVehicle.noPlate_number} ${crimeCaseVehicle.provinceName}';
      final line2 = '${CrimeCaseVehicleConstant.m_isLostCar}: ${crimeCaseVehicle.getIsLostCarMessage(crimeCaseVehicle.isLostCar)}';*/
        final title = 'เลขคดี: ${trafficCaseVehicle.caseNo} สน./สภ.: ${trafficCaseVehicle.stationName}';
        final line1 = 'ทะเบียนรถ: ${trafficCaseVehicle.noPlate_initial} ${trafficCaseVehicle.noPlate_number} ${trafficCaseVehicle.provinceName}';
        final line2 = '${TrafficCaseVehicleConstant.m_isLostCar}: ${trafficCaseVehicle.getIsLostCarMessage(trafficCaseVehicle.isLostCar)}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapTrafficCaseVehicle(trafficCaseVehicle), data: trafficCaseVehicle);
        result.excelTitle = [TrafficCaseVehicleConstant.m_noPlate_initial, TrafficCaseVehicleConstant.m_noPlate_number, TrafficCaseVehicleConstant.m_provinceName, TrafficCaseVehicleConstant.m_brandString, TrafficCaseVehicleConstant.m_modelString, TrafficCaseVehicleConstant.m_color, 'เลขคดี/ปี', TrafficCaseVehicleConstant.m_isLostCar, 'สน.ภ'];
        result.excelValue = ['${trafficCaseVehicle.noPlate_initial}', '${trafficCaseVehicle.noPlate_number}', '${trafficCaseVehicle.provinceName}', '${trafficCaseVehicle.brandString}', '${trafficCaseVehicle.modelString}', '${trafficCaseVehicle.color}', '${trafficCaseVehicle.caseNo}/${trafficCaseVehicle.crimeCaseYear}', '${trafficCaseVehicle.getIsLostCarMessage(trafficCaseVehicle.isLostCar)}', '${trafficCaseVehicle.stationName}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


  List<Result> mapWarrant(List<WarrantDto>? warrantArray){
    List<Result> resultArray = [];
    if(warrantArray!=null){
      for(int i=0; i<warrantArray.length; i++){
        WarrantDto warrant = warrantArray[i];
        final title = 'ผู้ต้องหา: ${warrant.suspectFullname}';
        final line1 = 'เลขหมายจับ: ${warrant.wrNo}  สถานี: ${warrant.stationName}';
        final line2 = 'สถานะ: ${warrant.statusWarrant}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapWarrant(warrant), data: warrant);
        result.excelTitle = [WarrantConstant.m_statusWarrant, WarrantConstant.m_suspectId, WarrantConstant.m_suspectFullname, WarrantConstant.m_caseNo, WarrantConstant.m_wrNo, WarrantConstant.m_stationName];
        result.excelValue = ['${warrant.statusWarrant}', '${warrant.suspectId}', '${warrant.suspectFullname}', '${warrant.caseNo}', '${warrant.wrNo}', '${warrant.stationName}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  //warrant court
  List<Result> mapWarrantCourt(List<WarrantCourtDto>? warrantArray){
    List<Result> resultArray = [];
    if(warrantArray!=null){
      for(int i=0; i<warrantArray.length; i++){
        WarrantCourtDto warrant = warrantArray[i];
        final title = 'ผู้ต้องหา: ${warrant.suspectFullname}';
        final line1 = 'เลขหมายจับ: ${warrant.wrNo} ';
        final line2 = 'สถานะ: ${warrant.statusWarrant}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapWarrantCourt(warrant), data: warrant);
        result.excelTitle = [WarrantCourtConstant.m_statusWarrant, WarrantCourtConstant.m_suspectId, WarrantCourtConstant.m_suspectFullname, WarrantCourtConstant.m_caseNo, WarrantCourtConstant.m_wrNo, WarrantCourtConstant.m_court];
        result.excelValue = ['${warrant.statusWarrant}', '${warrant.suspectId}', '${warrant.suspectFullname}', '${warrant.caseNo}', '${warrant.wrNo}', '${warrant.court}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // WarrantCRD
  List<Result> mapWarrantCRD(List<WarrantCRDDto>? warrantArray){
    List<Result> resultArray = [];
    if(warrantArray!=null){
      for(int i=0; i<warrantArray.length; i++){
        WarrantCRDDto warrant = warrantArray[i];
        final title = 'ผู้ต้องหา: ${warrant.pname}${warrant.fname}  ${warrant.lname}';
        final line1 = 'เลขหมายจับ: ${warrant.want_no}/${warrant.want_y}  ${WarrantCRDConstant.m_caseorg}: ${warrant.caseorg}';
        final line2 = 'หมายจับหมดอายุ: ${warrant.ex_d}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapWarrantCRD(warrant), data: warrant);
        result.excelTitle = [WarrantCRDConstant.m_ex_d, WarrantCRDConstant.m_idno, 'ผู้ต้องหา', 'เลขที่คดี', 'เลขที่หมายจับ', WarrantCRDConstant.m_caseorg];
        result.excelValue = ['${warrant.ex_d}', '${warrant.idno}', '${warrant.pname}${warrant.fname}  ${warrant.lname}', '${warrant.caseno}/${warrant.caseyear}', '${warrant.want_no}/${warrant.want_y}', '${warrant.caseorg}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // WarrantCourtCRD
  List<Result> mapWarrantCourtCRD(List<WarrantCourtCRDDto>? warrantArray){
    List<Result> resultArray = [];
    if(warrantArray!=null){
      for(int i=0; i<warrantArray.length; i++){
        WarrantCourtCRDDto warrant = warrantArray[i];
        final title = 'ผู้ต้องหา: ${warrant.acc_full_name}';
        final line1 = 'หมายเลขที่: ${warrant.woa_no}/${warrant.woa_year}  หมดอายุ: ${warrant.woa_end_date}';
        final line2 = '${WarrantCourtCRDConstant.m_arrest_status}: ${warrant.arrest_status}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapWarrantCourtCRD(warrant), data: warrant);
        result.excelTitle = ['หมดอายุ', WarrantCourtCRDConstant.m_acc_card_id, WarrantCourtCRDConstant.m_acc_full_name, 'หมายเลขที่', WarrantCourtCRDConstant.m_woa_type, WarrantCourtCRDConstant.m_court_code, WarrantCourtCRDConstant.m_police_station_id, WarrantCourtCRDConstant.m_arrest_status, WarrantCourtCRDConstant.m_arrest_date, WarrantCourtCRDConstant.m_arrest_result];
        result.excelValue = ['${warrant.woa_end_date}', '${warrant.acc_card_id}', '${warrant.acc_full_name}', '${warrant.woa_no}/${warrant.woa_year}', '${warrant.woa_type}', '${warrant.court_code}', '${warrant.police_station_id}', '${warrant.arrest_status}', '${warrant.arrest_date}', '${warrant.arrest_result}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // RedNotice
  List<Result> mapRedNotice(List<RedNoticeDto>? warrantArray){
    List<Result> resultArray = [];
    if(warrantArray!=null){
      for(int i=0; i<warrantArray.length; i++){
        RedNoticeDto warrant = warrantArray[i];
        final title = 'ผู้ต้องหา: ${warrant.suspectName}';
        final line1 = 'หมายเลขที่: ${warrant.warrantNumber}';
        final line2 = 'หมดอายุ: ${warrant.warrantExpireStr}';
        //final line2 = '${RedNoticeConstant.m_charge}: ${warrant.charge}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapRedNotice(warrant), data: warrant);
        result.excelTitle = [ RedNoticeConstant.m_policeName, RedNoticeConstant.m_suspectName, RedNoticeConstant.m_nationality, RedNoticeConstant.m_warrantNumber, RedNoticeConstant.m_warrantExpire, RedNoticeConstant.m_controlNumber, RedNoticeConstant.m_publishDate, RedNoticeConstant.m_charge, RedNoticeConstant.m_organizationOwner, RedNoticeConstant.m_bookNumber, RedNoticeConstant.m_remarkVisited, RedNoticeConstant.m_divisionOwner];
        result.excelValue = ['${warrant.policeName}', '${warrant.suspectName}', '${warrant.nationality}', '${warrant.warrantNumber}', '${warrant.warrantExpire}', '${warrant.controlNumber}', '${warrant.publishDate}', '${warrant.charge}', '${warrant.organizationOwner}', '${warrant.bookNumber}', '${warrant.remarkVisited}', '${warrant.divisionOwner}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // FaceRec
  List<Result> mapFaceRec(List<FaceDto>? array){
    List<Result> resultArray = [];
    if(array!=null){
      for(int i=0; i<array.length; i++){
        FaceDto data = array[i];
        final title = '${FaceConstant.m_personalid}: ${data.personalid}';
        final line1 = '${FaceConstant.m_countrycode}: ${data.countrycode}';
        final line2 = '${FaceConstant.m_score}: ${data.score}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapFaceRec(data), data: data);
        result.excelTitle = [ FaceConstant.m_personalid, FaceConstant.m_countrycode, FaceConstant.m_score];
        result.excelValue = ['${data.personalid}', '${data.countrycode}', '${data.score}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


  // ------------- OUTER -------------------


  // Civil
  List<Result> mapPerson(List<PersonDto>? personArray){
    List<Result> resultArray = [];
    if(personArray!=null){
      for(int i=0; i<personArray.length; i++){
        PersonDto person = personArray[i];
        final title = '${PersonConstant.m_pID}: ${person.pID}';
        final line1 = '${PersonConstant.m_firstName} - ${PersonConstant.m_lastName}: ${person.title}${person.firstName} ${person.lastName}';
        final line2 = '${PersonConstant.m_birthdate}: ${person.birthdate}  ${PersonConstant.m_gender}: ${person.gender}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapPerson(person), data: person);
        result.excelTitle = [PersonConstant.m_pID, '${PersonConstant.m_firstName} - ${PersonConstant.m_lastName}', PersonConstant.m_gender, PersonConstant.m_birthdate];
        result.excelValue = ['${person.pID}', '${person.title} ${person.firstName} ${person.lastName}', '${person.gender}', '${person.birthdate}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


  // Foreign
  List<Result> mapWorker(List<WorkerDto>? workerArray){
    List<Result> resultArray = [];
    if(workerArray!=null){
      for(int i=0; i<workerArray.length; i++){
        WorkerDto worker = workerArray[i];
        final title = '${WorkerConstant.m_workerID}: ${worker.workerID}';
        final line1 = '${WorkerConstant.m_firstName} - ${WorkerConstant.m_lastName}: ${worker.firstName} ${worker.lastName}';
        final line2 = '${WorkerConstant.m_birthdate}: ${worker.birthdate}  ${WorkerConstant.m_gender}: ${worker.gender}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapWorker(worker), data: worker);
        result.excelTitle = [WorkerConstant.m_workerID, '${WorkerConstant.m_firstName} - ${WorkerConstant.m_lastName}', WorkerConstant.m_gender, WorkerConstant.m_birthdate];
        result.excelValue = ['${worker.workerID}', '${worker.firstName} ${worker.lastName}', '${worker.gender}', '${worker.birthdate}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // PersonLk
  List<Result> mapPersonLk(List<PersonLkDto>? personLkArray){
    List<Result> resultArray = [];
    if(personLkArray!=null){
      for(int i=0; i<personLkArray.length; i++){
        PersonLkDto personLk = personLkArray[i];
        final title = '${PersonLkConstant.m_pid}: ${personLk.pid}';
        final line1 = '${PersonLkConstant.m_firstName} - ${PersonLkConstant.m_lastName}: ${personLk.titleDesc} ${personLk.firstName} ${personLk.lastName}';
        final line2 = '${PersonLkConstant.m_dateOfBirth}: ${personLk.dateOfBirth}  ${PersonLkConstant.m_genderDesc}: ${personLk.genderDesc}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapPersonLk(personLk), data: personLk);
        result.excelTitle = [PersonLkConstant.m_pid, PersonLkConstant.m_titleDesc, PersonLkConstant.m_firstName, PersonLkConstant.m_lastName, PersonLkConstant.m_age, PersonLkConstant.m_genderDesc, PersonLkConstant.m_dateOfBirth];
        result.excelValue = ['${personLk.pid}', '${personLk.titleDesc}', '${personLk.firstName}', '${personLk.lastName}', '${personLk.age}', '${personLk.genderDesc}', '${personLk.dateOfBirth}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // AlienPerson
  List<Result> mapAlienPerson(List<AlienPersonDto>? alienPersonArray){
    List<Result> resultArray = [];
    if(alienPersonArray!=null){
      for(int i=0; i<alienPersonArray.length; i++){
        AlienPersonDto person = alienPersonArray[i];
        final title = '${AlienPersonConstant.m_personalID}: ${person.personalID}';
        final line1 = '${AlienPersonConstant.m_firstName} - ${AlienPersonConstant.m_lastName}: ${person.titleDesc} ${person.firstName} ${person.lastName}';
        final line2 = '${AlienPersonConstant.m_dateOfBirth}: ${person.dateOfBirth}  ${AlienPersonConstant.m_genderDesc}: ${person.genderDesc}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapAlienPerson(person), data: person);
        result.excelTitle = [AlienPersonConstant.m_personalID, AlienPersonConstant.m_titleDesc, AlienPersonConstant.m_firstName, AlienPersonConstant.m_lastName, AlienPersonConstant.m_genderDesc, AlienPersonConstant.m_dateOfBirth];
        result.excelValue = ['${person.personalID}', '${person.titleDesc}', '${person.firstName}', '${person.lastName}', '${person.genderDesc}', '${person.dateOfBirth}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // AlienWorker
  List<Result> mapAlienWorker(List<AlienWorkerDto>? alienWorkerArray){
    List<Result> resultArray = [];
    if(alienWorkerArray!=null){
      for(int i=0; i<alienWorkerArray.length; i++){
        AlienWorkerDto person = alienWorkerArray[i];
        final title = '${AlienWorkerConstant.m_personalID}: ${person.personalID}';
        final line1 = '${AlienWorkerConstant.m_firstName} - ${AlienWorkerConstant.m_lastName}: ${person.titleDesc} ${person.firstName} ${person.lastName}';
        final line2 = '${AlienWorkerConstant.m_dateOfBirth}: ${person.dateOfBirth}  ${AlienWorkerConstant.m_genderText}: ${person.genderText}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapAlienWorker(person), data: person);
        result.excelTitle = [AlienWorkerConstant.m_personalID, AlienWorkerConstant.m_titleDesc, AlienWorkerConstant.m_firstName, AlienWorkerConstant.m_lastName, AlienWorkerConstant.m_genderText, AlienWorkerConstant.m_dateOfBirth];
        result.excelValue = ['${person.personalID}', '${person.titleDesc}', '${person.firstName}', '${person.lastName}', '${person.genderText}', '${person.dateOfBirth}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // PersonNonThai
  List<Result> mapPersonNonThai(List<PersonNonThaiDto>? personNonThaiArray){
    List<Result> resultArray = [];
    if(personNonThaiArray!=null){
      for(int i=0; i<personNonThaiArray.length; i++){
        PersonNonThaiDto person = personNonThaiArray[i];
        final title = '${PersonNonThaiConstant.m_personalID}: ${person.personalID}';
        final line1 = '${PersonNonThaiConstant.m_nameTH_firstName} - ${PersonNonThaiConstant.m_nameTH_lastName}: ${person.nameTH_title} ${person.nameTH_firstName} ${person.nameTH_lastName}';
        final line2 = '${PersonNonThaiConstant.m_dateOfBirth}: ${person.dateOfBirth}  ${PersonNonThaiConstant.m_genderText}: ${person.genderText}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapPersonNonThai(person), data: person);
        result.excelTitle = [PersonNonThaiConstant.m_personalID, PersonNonThaiConstant.m_nameTH_title, PersonNonThaiConstant.m_nameTH_firstName, PersonNonThaiConstant.m_nameTH_lastName, PersonNonThaiConstant.m_genderText, PersonNonThaiConstant.m_dateOfBirth];
        result.excelValue = ['${person.personalID}', '${person.nameTH_title}', '${person.nameTH_firstName}', '${person.nameTH_lastName}', '${person.genderText}', '${person.dateOfBirth}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // PersonNoRegis
  List<Result> mapPersonNoRegis(List<PersonNoRegisDto>? personNoRegisArray){
    List<Result> resultArray = [];
    if(personNoRegisArray!=null){
      for(int i=0; i<personNoRegisArray.length; i++){
        PersonNoRegisDto person = personNoRegisArray[i];
        final title = '${PersonNoRegisConstant.m_personalID}: ${person.personalID}';
        final line1 = '${PersonNoRegisConstant.m_firstName} - ${PersonNoRegisConstant.m_lastName}: ${person.title} ${person.firstName} ${person.lastName}';
        final line2 = '${PersonNoRegisConstant.m_dateOfBirth}: ${person.dateOfBirth}  ${PersonNoRegisConstant.m_genderText}: ${person.genderText}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapPersonNoRegis(person), data: person);
        result.excelTitle = [PersonNoRegisConstant.m_personalID, PersonNoRegisConstant.m_title, PersonNoRegisConstant.m_firstName, PersonNoRegisConstant.m_lastName, PersonNoRegisConstant.m_genderText, PersonNoRegisConstant.m_dateOfBirth];
        result.excelValue = ['${person.personalID}', '${person.title}', '${person.firstName}', '${person.lastName}', '${person.genderText}', '${person.dateOfBirth}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


// PersonMigwis
List<Result> mapPersonMigwis(List<PersonMigwisDto>? migwisisArray) {
  List<Result> resultArray = [];
  if (migwisisArray != null) {
    for (int i = 0; i < migwisisArray.length; i++) {
      PersonMigwisDto person = migwisisArray[i];

      final title = '${PersonMigwisConstant.m_ALIEN_NUMBER}: ${person.alienNumber}';
      final line1 = '${PersonMigwisConstant.m_ALIEN_GIVENNAME} - ${PersonMigwisConstant.m_ALIEN_SURNAME}: ${person.alienGivenname} ${person.alienSurname}';
      final line2 = '${PersonMigwisConstant.m_ALIEN_NATIONALITY}: ${person.alienNationality}  ${PersonMigwisConstant.m_ALIEN_SEX}: ${person.alienSex}';
      final result = Result(
        title: title,
        line1: line1,
        line2: line2,
        formArray: FormMapper().mapPersonMigwis(person),
        data: person,
      );
      result.excelTitle = [
        PersonMigwisConstant.m_ALIEN_NUMBER,
        PersonMigwisConstant.m_ALIEN_GIVENNAME,
        PersonMigwisConstant.m_ALIEN_SURNAME,
        PersonMigwisConstant.m_ALIEN_SEX,
        PersonMigwisConstant.m_ALIEN_NATIONALITY
      ];

      result.excelValue = [
        '${person.alienNumber}',
        '${person.alienGivenname}',
        '${person.alienSurname}',
        '${person.alienSex}',
        '${person.alienNationality}',
      ];

      resultArray.add(result);
    }
  }
  return resultArray;
}


  // Car
  List<Result> mapDriverLicense(List<DriverLicenseInfoDto>? driverLicenseArray){
    List<Result> resultArray = [];
    if(driverLicenseArray!=null){
      for(int i=0; i<driverLicenseArray.length; i++){
        DriverLicenseInfoDto driverLicense = driverLicenseArray[i];
        final title =  '${DriverLicenseInfoConstant.m_idNo}: ${driverLicense.idNo}';
        final line1 = '${DriverLicenseInfoConstant.m_fName} - ${DriverLicenseInfoConstant.m_lName}: ${driverLicense.titleDesc}${driverLicense.fName} ${driverLicense.lName}';
        final line2 = '${DriverLicenseInfoConstant.m_expDate}: ${driverLicense.expDate}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapDriverLicenseInfo(driverLicense), data: driverLicense);
        result.excelTitle = [DriverLicenseInfoConstant.m_idNo, DriverLicenseInfoConstant.m_fName, DriverLicenseInfoConstant.m_lName, DriverLicenseInfoConstant.m_natDesc, DriverLicenseInfoConstant.m_issDate, DriverLicenseInfoConstant.m_pltDesc];
        result.excelValue = ['${driverLicense.idNo}', '${driverLicense.fName}', '${driverLicense.lName}', '${driverLicense.natDesc}', '${driverLicense.issDate}', '${driverLicense.pltDesc}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  List<Result> mapVehicleInfo(List<VehicleInfoDto>? vehicleInfoArray){
    List<Result> resultArray = [];
    if(vehicleInfoArray!=null){
      for(int i=0; i<vehicleInfoArray.length; i++){
        VehicleInfoDto vehicleInfo = vehicleInfoArray[i];
        final title = 'ทะเบียน: ${vehicleInfo.plate1} ${vehicleInfo.plate2} ${vehicleInfo.offLocCode}  ';
        final line1 = '${VehicleInfoConstant.m_carStatus}: ${vehicleInfo.carStatus}  ${VehicleInfoConstant.m_brnDesc}: ${vehicleInfo.brnDesc}   ${VehicleInfoConstant.m_modelName}: ${vehicleInfo.modelName}';
        final line2 = 'ผู้ครอบครอง: ${vehicleInfo.occ_fname} ${vehicleInfo.occ_lname}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapVehicleInfo(vehicleInfo), data: vehicleInfo);
        result.excelTitle = ['ทะเบียน', VehicleInfoConstant.m_vehTypeDesc, VehicleInfoConstant.m_brnDesc, VehicleInfoConstant.m_modelName, VehicleInfoConstant.m_occ_fname, VehicleInfoConstant.m_occ_lname, VehicleInfoConstant.m_occ_pid];
        result.excelValue = ['${vehicleInfo.plate1} ${vehicleInfo.plate2} ${vehicleInfo.offLocCode}', '${vehicleInfo.vehTypeDesc}', '${vehicleInfo.brnDesc}', '${vehicleInfo.modelName}', '${vehicleInfo.occ_fname}', '${vehicleInfo.occ_lname}', '${vehicleInfo.occ_pid}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // Foreign House
  List<Result> mapTm61(List<Tm61Dto>? tm61Array){
    List<Result> resultArray = [];
    if(tm61Array!=null){
      for(int i=0; i<tm61Array.length; i++){
        Tm61Dto tm61 = tm61Array[i];
        final title = '${Tm61Constant.m_passportNo}: ${tm61.passportNo}  ${Tm61Constant.m_nationenm}: ${tm61.nationenm}';
        final line1 = '${Tm61Constant.m_fullname}: ${tm61.fullname}';
        final line2 = '${Tm61Constant.m_status}: ${tm61.status}  ${Tm61Constant.m_permitDate}: ${tm61.permitDate}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapTm61(tm61), data: tm61);
        result.excelTitle = [Tm61Constant.m_passportNo, Tm61Constant.m_passportPlace, Tm61Constant.m_passportDate, Tm61Constant.m_fullname, Tm61Constant.m_countenm, Tm61Constant.m_inDate, Tm61Constant.m_permitDate, Tm61Constant.m_status];
        result.excelValue = ['${tm61.passportNo}', '${tm61.passportPlace}', '${tm61.passportDate}', '${tm61.fullname}', '${tm61.countenm}', '${tm61.inDate}', '${tm61.permitDate}', '${tm61.status}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


  // Health
  List<Result> mapHealth(List<HealthDto>? healthArray){
    List<Result> resultArray = [];
    if(healthArray!=null){
      for(int i=0; i<healthArray.length; i++){
        HealthDto health = healthArray[i];
        final title = '${HealthConstant.m_healthFirst}: ${health.healthFirst}';
        final line1 = '${HealthConstant.m_hospitalFirst}: ${health.hospitalFirst}';
        final line2 = '${HealthConstant.m_sDateFirst}: ${health.sDateFirst}  ${HealthConstant.m_eDateFirst}: ${health.eDateFirst}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapHealth(health), data: health);
        result.excelTitle = [HealthConstant.m_healthFirst, HealthConstant.m_hospitalFirst, HealthConstant.m_sDateFirst, HealthConstant.m_eDateFirst];
        result.excelValue = ['${health.healthFirst}', '${health.hospitalFirst}', '${health.sDateFirst}', '${health.eDateFirst}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


  // Immigration
  // List<Result> mapTravel(List<TravelDto>? travelArray){
  //   List<Result> resultArray = [];
  //   if(travelArray!=null){
  //     for(int i=0; i<travelArray.length; i++){
  //       TravelDto travel = travelArray[i];
  //       final title = '${TravelConstant.m_passportNo}: ${travel.passportNo}  ${TravelConstant.m_nationENM}: ${travel.nationENM}';
  //       final line1 = '${TravelConstant.m_eFullname}: ${travel.eFullname}  ${TravelConstant.m_sex}: ${travel.sex}';
  //       final line2 = '${TravelConstant.m_travelDate}: ${travel.travelDate}  ${TravelConstant.m_travelType}: ${travel.travelType}';
  //       final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapTravel(travel), data: travel);
  //       result.excelTitle = [TravelConstant.m_tMRunNo, TravelConstant.m_passportNo, TravelConstant.m_travelType, TravelConstant.m_travelDate, TravelConstant.m_eFullname, TravelConstant.m_sex, TravelConstant.m_nationENM, TravelConstant.m_birthDate, TravelConstant.m_tM6No];
  //       result.excelValue = ['${travel.tMRunNo}', '${travel.passportNo}', '${travel.travelType}', '${travel.travelDate}', '${travel.eFullname}', '${travel.sex}', '${travel.nationENM}', '${travel.birthDate}', '${travel.tM6No}'];
  //       resultArray.add(result);
  //     }
  //   }
  //   return resultArray;
  // }

  // List<Result> mapTravelVisa(List<TravelVisaDto> travelVisaArray){
  //   List<Result> resultArray = [];
  //   for(int i=0; i<travelVisaArray.length; i++){
  //     TravelVisaDto travelVisa = travelVisaArray[i];
  //     final title = 'ผู้โดยสาร: ${travelVisa.efirstnm} ${travelVisa.emiddlenm} ${travelVisa.efamilynm}';
  //     final line1 = '${TravelVisaConstant.m_convregno}: ${travelVisa.convregno}';
  //     final line2 = '${TravelVisaConstant.m_visatypenm}: ${travelVisa.visatypenm}';
  //     final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapTravelVisa(travelVisa), data: travelVisa);
  //     resultArray.add(result);
  //   }
  //   return resultArray;
  // }

  // Immigration
  List<Result> mapImm(List<ImmDto>? immArray){
    List<Result> resultArray = [];
    if(immArray!=null){
      for(int i=0; i<immArray.length; i++){
        ImmDto imm = immArray[i];
        final title = '${ImmConstant.m_passportNo}: ${imm.passportNo} ${ImmConstant.m_gender}: ${imm.gender}';
        final line1 = 'ชื่อ-นามสกุล: ${imm.firstName} ${imm.middleName != '-' ? imm.middleName : ''} ${imm.surname}';
        final line2 = 'เดินทาง: ${imm.tripDtm} (${imm.tripType})';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapImm(imm), data: imm);
        result.excelTitle = [ImmConstant.m_passportType, ImmConstant.m_passportNo, ImmConstant.m_firstName, ImmConstant.m_middleName, ImmConstant.m_surname, ImmConstant.m_birthDate, ImmConstant.m_gender, ImmConstant.m_birthDate, ImmConstant.m_countryName, ImmConstant.m_issueDate, ImmConstant.m_expiryDate, ImmConstant.m_tripDtm, ImmConstant.m_tripType, ImmConstant.m_flightNo, ImmConstant.m_borderPostName, ImmConstant.m_thResidence, ImmConstant.m_reason, ImmConstant.m_visaNumber, ImmConstant.m_visaType, ImmConstant.m_visaDesc, ImmConstant.m_visaPermitDay, ImmConstant.m_visaExp, ImmConstant.m_depCancelDate];
        result.excelValue = ['${imm.passportType}', '${imm.passportNo}', '${imm.firstName}', '${imm.middleName}', '${imm.surname}', '${imm.birthDate}', '${imm.gender}', '${imm.birthDate}', '${imm.countryName}', '${imm.issueDate}', '${imm.expiryDate}', '${imm.tripDtm}', '${imm.tripType}', '${imm.flightNo}', '${imm.borderPostName}', '${imm.thResidence}', '${imm.reason}', '${imm.visaNumber}', '${imm.visaType}', '${imm.visaDesc}', '${imm.visaPermitDay}', '${imm.visaExp}', '${imm.depCancelDate}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // Immigration
  List<Result> mapExtension(List<ExtensionDto>? array){
    List<Result> resultArray = [];
    if(array!=null){
      for(int i=0; i<array.length; i++){
        ExtensionDto data = array[i];
        final title = '${ExtensionConstant.m_passportno}: ${data.passportno} ${ExtensionConstant.m_gender}: ${data.gender}';
        final line1 = 'ชื่อ-นามสกุล: ${data.firstname} ${data.middlename != '-' ? data.middlename : ''} ${data.surname}';
        final line2 = 'วันที่รับเรี่อง: ${data.extDate}  (จำนวน ${data.extDay} วัน)';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapExtension(data), data: data);
        //result.excelTitle = [ImmConstant.m_passportType, ImmConstant.m_passportNo, ImmConstant.m_firstName, ImmConstant.m_middleName, ImmConstant.m_surname, ImmConstant.m_birthDate, ImmConstant.m_gender, ImmConstant.m_birthDate, ImmConstant.m_countryName];
        //result.excelValue = ['${imm.passportType}', '${imm.passportNo}', '${imm.firstName}', '${imm.middleName}', '${imm.surname}', '${imm.birthDate}', '${imm.gender}', '${imm.birthDate}', '${imm.countryName}''];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // Linkage P4
  List<Result> mapGun(List<GunDto>? gunArray){
    List<Result> resultArray = [];
    if(gunArray!=null){
      for(int i=0; i<gunArray.length; i++){
        GunDto gun = gunArray[i];
        // final title = '${GunConstant.m_personalId}: ${gun.personalId}';
        final title = 'เลขบัตรประชาชน: ${gun.personalId}';
        final line1 = 'ชื่อ - สกุล: ${gun.titleDesc} ${gun.firstName} ${gun.lastName}';
        final line2 = '${GunConstant.m_docID}: ${gun.docID}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapGun(gun), data: gun);
        result.excelTitle = [GunConstant.m_docDate, GunConstant.m_docPlaceDesc, GunConstant.m_docPlaceProvince, GunConstant.m_expireDate, GunConstant.m_personalId, GunConstant.m_fullNameAndRank, GunConstant.m_genderDesc, GunConstant.m_gunRegistrationId, GunConstant.m_gunSerialNo, GunConstant.m_gunType, GunConstant.m_gunCharacteristic, GunConstant.m_gunSize, GunConstant.m_gunProduct];
        result.excelValue = ['${gun.docDate}', '${gun.docPlaceDesc}', '${gun.docPlaceProvince}', '${gun.expireDate}', '${gun.personalId}', '${gun.fullNameAndRank}', '${gun.genderDesc}', '${gun.gunRegistrationId}', '${gun.gunSerialNo}', '${gun.gunType}', '${gun.gunCharacteristic}', '${gun.gunSize}', '${gun.gunProduct}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }


  // Social
  // List<Result> mapEmployer(List<EmployerDto> employerArray){
  //   List<Result> resultArray = [];
  //   for(int i=0; i<employerArray.length; i++){
  //     EmployerDto employer = employerArray[i];
  //     final title = '${EmployerConstant.m_companyName}: ${employer.companyName}';
  //     final line1 = '${EmployerConstant.m_accNo}: ${employer.accNo}';
  //     final line2 = '${EmployerConstant.m_companyStatusDesc}: ${employer.companyStatusDesc}';
  //     final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapEmployer(employer), data: employer);
  //     resultArray.add(result);
  //   }
  //   return resultArray;
  // }

  List<Result> mapEmployment(List<EmploymentDto>? employmentArray){
    List<Result> resultArray = [];
    if(employmentArray!=null){
      for(int i=0; i<employmentArray.length; i++){
        EmploymentDto employment = employmentArray[i];
        // final title = '${EmploymentConstant.m_ssoNum}: ${employment.ssoNum}';
        final title = '${EmploymentConstant.m_companyName}: ${employment.companyName}';
        final line1 = 'ชื่อ - สกุล: ${employment.titleCodeDesc}${employment.firstName} ${employment.lastName}';
        final line2 = '${EmploymentConstant.m_employStatusDesc}: ${employment.employStatusDesc}  ${EmploymentConstant.m_empResignDate}: ${employment.empResignDate}';
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapEmployment(employment), data: employment);
        result.excelTitle = [EmploymentConstant.m_ssoNum, 'ชื่อ - สกุล', EmploymentConstant.m_activeStatusDesc, EmploymentConstant.m_companyName, EmploymentConstant.m_expStartDate, EmploymentConstant.m_empResignDate, EmploymentConstant.m_employStatusDesc];
        result.excelValue = ['${employment.ssoNum}', '${employment.firstName} ${employment.lastName}', '${employment.activeStatusDesc}', '${employment.companyName}', '${employment.expStartDate}', '${employment.empResignDate}', '${employment.employStatusDesc}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

  // List<Result> mapHospital(List<HospitalDto> hospitalArray){
  //   List<Result> resultArray = [];
  //   for(int i=0; i<hospitalArray.length; i++){
  //     HospitalDto hospital = hospitalArray[i];
  //     final title = '${HospitalConstant.m_hospitalName}: ${hospital.hospitalName}';
  //     final line1 = 'ชื่อ - สกุล: ${hospital.firstName} ${hospital.lastName}';
  //     final line2 = '${HospitalConstant.m_activeStatusDesc}: ${hospital.activeStatusDesc}';
  //     final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapHospital(hospital), data: hospital);
  //     resultArray.add(result);
  //   }
  //   return resultArray;
  // }


  // Traffic
  List<Result> mapTicket(List<TicketDto>? ticketArray) {
    List<Result> resultArray = [];
    if(ticketArray!=null){
      for (int i = 0; i < ticketArray.length; i++) {
        TicketDto ticket = ticketArray[i];
        final title = '${TicketConstant.m_plate}: ${ticket.plate}';
        // final line1 = '${TicketConstant.m_cardId}: ${ticket.cardId}   ${TicketConstant.m_ticketStatus}: ${ticket.ticketStatus}';
        final line1 = '${TicketConstant.m_ticketStatus}: ${ticket.ticketStatus}';
        final line2 = '${TicketConstant.m_fullname}: ${ticket.fullname}';
        final result = Result(title: title,
            line1: line1,
            line2: line2,
            formArray: FormMapper().mapTicket(ticket),
            data: ticket);
        result.excelTitle = [TicketConstant.m_cardId, TicketConstant.m_ticketStatus, TicketConstant.m_ticketId, TicketConstant.m_fullname, TicketConstant.m_plate, TicketConstant.m_occurDt, TicketConstant.m_place, TicketConstant.m_atkilometerHappen, TicketConstant.m_accuse1Code, TicketConstant.m_fine1, TicketConstant.m_fineAmt, TicketConstant.m_ticketDate, TicketConstant.m_orgAbbr, TicketConstant.m_tel, TicketConstant.m_paidBy];
        result.excelValue = ['${ticket.cardId}', '${ticket.ticketStatus}', '${ticket.ticketId}', '${ticket.fullname}', '${ticket.plate}', '${ticket.occurDt}', '${ticket.place}', '${ticket.atkilometerHappen}', '${ticket.accuse1Code}', '${ticket.fine1}', '${ticket.fineAmt}', '${ticket.ticketDate}', '${ticket.orgAbbr}', '${ticket.tel}', '${ticket.paidBy}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

    // Prisoner
    List<Result> mapPrisoner(List<PrisonerDto>? prisonerArray){
      List<Result> resultArray = [];
      if(prisonerArray!=null){
        for(int i=0; i<prisonerArray.length; i++){
          PrisonerDto prisoner = prisonerArray[i];
          String? prisonName = prisoner.prisonName;
          if(prisonName == null) prisonName = '';
          if(prisonName.length>25){
            prisonName = prisonName.substring(0,25)+"...";
          }
          final title = 'ชื่อ-สกุล: ${prisoner.title}  ${prisoner.prisonFname} ${prisoner.prisonLname}';
          final line1 = prisonName+' ปล่อยตัว: ${prisoner.distDate}';
          final line2 = 'ข้อหา: ${prisoner.caseBase}';
          final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapPrisoner(prisoner), data: prisoner);
          resultArray.add(result);
        }
      }
      return resultArray;
    }

  // RescueVolunteer
  // List<Result> mapRescueVolunteer(List<PersonRvDto>? personRvArray){
  //   List<Result> resultArray = [];
  //   if(personRvArray!=null){
  //     for(int i=0; i<personRvArray.length; i++){
  //       PersonRvDto person = personRvArray[i];
  //       final title = '${PersonRvConstant.m_org_name}: ${person.org_name}';
  //       final line1 = '${PersonRvConstant.m_fullname}: ${person.fullname}';
  //       final line2 = '${PersonRvConstant.m_issue_date}: ${person.issue_date}';
  //       final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapPersonRescuseVolunteer(person), data: person);
  //       resultArray.add(result);
  //     }
  //   }
  //   return resultArray;
  // }

  // List<Result> mapRescueTraining(List<PersonRtDto>? personRtArray){
  //   List<Result> resultArray = [];
  //   if(personRtArray!=null){
  //     for(int i=0; i<personRtArray.length; i++){
  //       PersonRtDto person = personRtArray[i];
  //       final title = '${PersonRtConstant.m_course_name}: ${person.course_name}';
  //       final line1 = '${PersonRtConstant.m_fullname}: ${person.fullname}';
  //       final line2 = '${PersonRtConstant.m_training_date}: ${person.training_date}  ${PersonRtConstant.m_training_results}: ${person.training_results}';
  //       final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapPersonRescuseTraining(person), data: person);
  //       resultArray.add(result);
  //     }
  //   }
  //   return resultArray;
  // }

  // List<Result> mapCarFlashingLight(List<CarFllDto>? carFllArray){
  //   List<Result> resultArray = [];
  //   if(carFllArray!=null){
  //     for(int i=0; i<carFllArray.length; i++){
  //       CarFllDto car = carFllArray[i];
  //       final title = '${CarFllConstant.m_org_name}: ${car.org_name}';
  //       final line1 = '${CarFllConstant.m_car_plate}: ${car.car_plate}  ${CarFllConstant.m_car_brand}: ${car.car_brand}  ${CarFllConstant.m_car_model}: ${car.car_model}' ;
  //       final line2 = '${CarFllConstant.m_use_in_business}: ${car.use_in_business}  ${CarFllConstant.m_permitted_light_colors}: ${car.permitted_light_colors}';
  //       final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapCarFlashingLight(car), data: car);
  //       resultArray.add(result);
  //     }
  //   }
  //   return resultArray;
  // }

  // List<Result> mapCarAmbulance(List<CarAmlDto>? carAmlArray){
  //   List<Result> resultArray = [];
  //   if(carAmlArray!=null){
  //     for(int i=0; i<carAmlArray.length; i++){
  //       CarAmlDto car = carAmlArray[i];
  //       final title = '${CarAmlConstant.m_org_name_allow}: ${car.org_name_allow}';
  //       final line1 = '${CarFllConstant.m_car_plate}: ${car.car_plate}  ${CarFllConstant.m_car_brand}: ${car.car_brand}  ${CarFllConstant.m_car_model}: ${car.car_model}' ;
  //       final line2 = '${CarAmlConstant.m_applicant_fullname}: ${car.applicant_fullname}';
  //       final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapCarAmbulance(car), data: car);
  //       resultArray.add(result);
  //     }
  //   }
  //   return resultArray;
  // }


  // EmergencyCar
  List<Result> mapEmergencyCar(List<EmergencyCarDto>? emergencyCarArray){
    List<Result> resultArray = [];
    if(emergencyCarArray!=null){
      for(int i=0; i<emergencyCarArray.length; i++){
        EmergencyCarDto car = emergencyCarArray[i];
        final title = '${car.emergencyVehicleType} (${car.carType})';
        final line1 = 'ทะเบียนรถ: ${car.noPlateInitial} ${car.noPlateNumber}  ${car.province} ';
        //final line2 = 'ผู้ขออนุญาต: ${car.permissionRank}${car.permissionFirstName} ${car.permissionSurName}  วันที่หมดอายุ: ${car.expirationDate}' ;
        final line2 = 'ยี่ห้อ: ${car.carBrand} สี: ${car.carColor}  วันที่หมดอายุ: ${car.expirationDate}' ;
        final result = Result(title: title, line1: line1, line2: line2, formArray: FormMapper().mapEmergencyCar(car), data: car);
        result.excelTitle = [EmergencyCarConstant.m_emergencyVehicleType,EmergencyCarConstant.m_carType, 'ทะเบียนรถ', EmergencyCarConstant.m_carBrand, EmergencyCarConstant.m_carColor, EmergencyCarConstant.m_expirationDate];
        result.excelValue = ['${car.emergencyVehicleType}','${car.carType}', '${car.noPlateInitial} ${car.noPlateNumber}  ${car.province}', '${car.carBrand}', '${car.carColor}', '${car.expirationDate}'];
        resultArray.add(result);
      }
    }
    return resultArray;
  }

}
