// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trafficcase_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrafficCaseDto _$TrafficCaseDtoFromJson(Map<String, dynamic> json) =>
    TrafficCaseDto(
      statusMagenta: json['STATUSMAGENTA'] as String?,
      caseStatus: json['CASESTATUS'] as String?,
      caseNo: json['CASENO'] as String?,
      crimeCaseNo: json['CRIMECASENO'] as String?,
      crimeCaseYear: json['CRIMECASEYEAR'] as String?,
      caseAcceptDate: json['CASEACCEPTDATE'] as String?,
      policeFullName: json['POLICEFULLNAME'] as String?,
      displayVictimsName: json['DISPLAYVICTIMSNAME'] as String?,
      displaySuspectName: json['DISPLAYSUSPECTSNAME'] as String?,
      displayCharge: json['DISPLAYCHARGE'] as String?,
      provinceName: json['PROVINCENAME'] as String?,
      amphurName: json['AMPHURNAME'] as String?,
      tambonName: json['TAMBONNAME'] as String?,
      provinceCode: json['PROVINCECODE'] as String?,
      amphur: json['AMPHURCODE'] as String?,
      tambon: json['TAMBONCODE'] as String?,
      road: json['ROAD'] as String?,
      soi: json['SOI'] as String?,
      displayResultCase_investigator:
          json['DISPLAYRESULTCASE_INVESTIGATOR'] as String?,
      displayResultC_headInvestigato:
          json['DISPLAYRESULTC_HEADINVESTIGATO'] as String?,
      bk: json['BK'] as String?,
      bh: json['BH'] as String?,
      orgCode: json['ORGCODE'] as String?,
      stationName: json['STATIONNAME'] as String?,
      tcid: json['TCID'] as String?,
      fullcaseNo: json['FULLCASENO'] as String?,
      evenStartDate: json['EVENTSTARTDATE'] as String?,
      evenEndDate: json['EVENTENDDATE'] as String?,
    );

Map<String, dynamic> _$TrafficCaseDtoToJson(TrafficCaseDto instance) =>
    <String, dynamic>{
      'STATUSMAGENTA': instance.statusMagenta,
      'CASESTATUS': instance.caseStatus,
      'CASENO': instance.caseNo,
      'CRIMECASENO': instance.crimeCaseNo,
      'CRIMECASEYEAR': instance.crimeCaseYear,
      'CASEACCEPTDATE': instance.caseAcceptDate,
      'POLICEFULLNAME': instance.policeFullName,
      'DISPLAYVICTIMSNAME': instance.displayVictimsName,
      'DISPLAYSUSPECTSNAME': instance.displaySuspectName,
      'DISPLAYCHARGE': instance.displayCharge,
      'PROVINCENAME': instance.provinceName,
      'AMPHURNAME': instance.amphurName,
      'TAMBONNAME': instance.tambonName,
      'PROVINCECODE': instance.provinceCode,
      'AMPHURCODE': instance.amphur,
      'TAMBONCODE': instance.tambon,
      'ROAD': instance.road,
      'SOI': instance.soi,
      'DISPLAYRESULTCASE_INVESTIGATOR': instance.displayResultCase_investigator,
      'DISPLAYRESULTC_HEADINVESTIGATO': instance.displayResultC_headInvestigato,
      'BK': instance.bk,
      'BH': instance.bh,
      'ORGCODE': instance.orgCode,
      'STATIONNAME': instance.stationName,
      'TCID': instance.tcid,
      'FULLCASENO': instance.fullcaseNo,
      'EVENTSTARTDATE': instance.evenStartDate,
      'EVENTENDDATE': instance.evenEndDate,
    };

ListTrafficCaseDto _$ListTrafficCaseDtoFromJson(Map<String, dynamic> json) =>
    ListTrafficCaseDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TrafficCaseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTrafficCaseDtoToJson(ListTrafficCaseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
