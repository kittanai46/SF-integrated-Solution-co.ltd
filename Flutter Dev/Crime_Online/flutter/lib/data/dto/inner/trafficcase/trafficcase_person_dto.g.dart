// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trafficcase_person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrafficCasePersonDto _$TrafficCasePersonDtoFromJson(
        Map<String, dynamic> json) =>
    TrafficCasePersonDto(
      bh: json['BH'] as String?,
      bk: json['BK'] as String?,
      orgCode: json['ORGCODE'] as String?,
      stationName: json['STATIONNAME'] as String?,
      caseNo: json['CASENO'] as String?,
      crimeCaseNo: json['CRIMECASENO'] as String?,
      crimeCaseYear: json['CRIMECASEYEAR'] as String?,
      suspectId: json['SUSPECTID'] as String?,
      passportNumber: json['PASSPORTNUMBER'] as String?,
      firstNameTh: json['FIRSTNAMETH'] as String?,
      surNameTh: json['SURNAMETH'] as String?,
      suspectFullName: json['SUSPECTFULLNAME'] as String?,
      gender: json['GENDER'] as String?,
      age: json['AGE'] as String?,
      nationality: json['NATIONALITY'] as String?,
      displayChargePerson: json['DISPLAYCHARGEPERSON'] as String?,
      statusAboutWarrant: json['STATUSABOUTWARRANT'] as String?,
      statusVictimOrSuspect: json['STATUSVICTIMORSUSPECT'] as String?,
      displayResultCase_investigator:
          json['DISPLAYRESULTCASE_INVESTIGATOR'] as String?,
      investigator_result: json['INVESTIGATOR_RESULT'] as String?,
      headinvest_result: json['HEADINVEST_RESULT'] as String?,
      prosecutor_result: json['PROSECUTOR_RESULT'] as String?,
      civilcourt_result: json['CIVILCOURT_RESULT'] as String?,
      psId: json['PSID'] as String?,
      tcId: json['TCID'] as String?,
      fullPid: json['FULLPID'] as String?,
      fullPasId: json['FULLPASID'] as String?,
      fullSusName: json['FULLSUSNAME'] as String?,
      fullcaseNo: json['FULLCASENO'] as String?,
      eventStartDate: json['EVENTSTARTDATE'] as String?,
      caseAcceptDate: json['CASEACCEPTDATE'] as String?,
    );

Map<String, dynamic> _$TrafficCasePersonDtoToJson(
        TrafficCasePersonDto instance) =>
    <String, dynamic>{
      'BH': instance.bh,
      'BK': instance.bk,
      'ORGCODE': instance.orgCode,
      'STATIONNAME': instance.stationName,
      'CASENO': instance.caseNo,
      'CRIMECASENO': instance.crimeCaseNo,
      'CRIMECASEYEAR': instance.crimeCaseYear,
      'SUSPECTID': instance.suspectId,
      'PASSPORTNUMBER': instance.passportNumber,
      'FIRSTNAMETH': instance.firstNameTh,
      'SURNAMETH': instance.surNameTh,
      'SUSPECTFULLNAME': instance.suspectFullName,
      'GENDER': instance.gender,
      'AGE': instance.age,
      'NATIONALITY': instance.nationality,
      'DISPLAYCHARGEPERSON': instance.displayChargePerson,
      'STATUSABOUTWARRANT': instance.statusAboutWarrant,
      'STATUSVICTIMORSUSPECT': instance.statusVictimOrSuspect,
      'DISPLAYRESULTCASE_INVESTIGATOR': instance.displayResultCase_investigator,
      'INVESTIGATOR_RESULT': instance.investigator_result,
      'HEADINVEST_RESULT': instance.headinvest_result,
      'PROSECUTOR_RESULT': instance.prosecutor_result,
      'CIVILCOURT_RESULT': instance.civilcourt_result,
      'PSID': instance.psId,
      'TCID': instance.tcId,
      'FULLPID': instance.fullPid,
      'FULLPASID': instance.fullPasId,
      'FULLSUSNAME': instance.fullSusName,
      'FULLCASENO': instance.fullcaseNo,
      'EVENTSTARTDATE': instance.eventStartDate,
      'CASEACCEPTDATE': instance.caseAcceptDate,
    };

ListTrafficCasePersonDto _$ListTrafficCasePersonDtoFromJson(
        Map<String, dynamic> json) =>
    ListTrafficCasePersonDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TrafficCasePersonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTrafficCasePersonDtoToJson(
        ListTrafficCasePersonDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
