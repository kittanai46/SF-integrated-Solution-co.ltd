// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crimecase_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrimeCaseDto _$CrimeCaseDtoFromJson(Map<String, dynamic> json) => CrimeCaseDto(
      statusMagenta: json['STATUSMAGENTA'] as String?,
      caseStatus: json['CASESTATUS'] as String?,
      caseNo: json['CASENO'] as String?,
      crimeCaseNo: json['CRIMECASENO'] as String?,
      crimeCaseYear: json['CRIMECASEYEAR'] as String?,
      caseAcceptDate: json['CASEACCEPTDATE'] as String?,
      occureDateTimeFrom: json['OCCUREDDATETIMEFROM'] as String?,
      occureDateTimeTo: json['OCCUREDDATETIMETO'] as String?,
      policeFullName: json['POLICEFULLNAME'] as String?,
      displayVictimsName: json['DISPLAYVICTIMSNAME'] as String?,
      displaySuspectName: json['DISPLAYSUSPECTNAME'] as String?,
      displayCharge: json['DISPLAYCHARGE'] as String?,
      provinceName: json['PROVINCENAME'] as String?,
      amphurName: json['AMPHURNAME'] as String?,
      tambonName: json['TAMBONNAME'] as String?,
      provinceCode: json['PROVINCECODE'] as String?,
      amphur: json['AMPHURCODE'] as String?,
      tambon: json['TAMBONCODE'] as String?,
      crimeLocationRoad: json['CRIMELOCATIONROAD'] as String?,
      crimeLocationLane: json['CRIMELOCATIONLANE'] as String?,
      displayResultCase_investigator:
          json['DISPLAYRESULTCASE_INVESTIGATOR'] as String?,
      displayResultC_headInvestigato:
          json['DISPLAYRESULTC_HEADINVESTIGATO'] as String?,
      bk: json['BK'] as String?,
      bh: json['BH'] as String?,
      orgCode: json['ORGCODE'] as String?,
      stationName: json['STATIONNAME'] as String?,
      ccid: json['CCID'] as String?,
      fullcaseNo: json['FULLCASENO'] as String?,
    );

Map<String, dynamic> _$CrimeCaseDtoToJson(CrimeCaseDto instance) =>
    <String, dynamic>{
      'STATUSMAGENTA': instance.statusMagenta,
      'CASESTATUS': instance.caseStatus,
      'CASENO': instance.caseNo,
      'CRIMECASENO': instance.crimeCaseNo,
      'CRIMECASEYEAR': instance.crimeCaseYear,
      'CASEACCEPTDATE': instance.caseAcceptDate,
      'OCCUREDDATETIMEFROM': instance.occureDateTimeFrom,
      'OCCUREDDATETIMETO': instance.occureDateTimeTo,
      'POLICEFULLNAME': instance.policeFullName,
      'DISPLAYVICTIMSNAME': instance.displayVictimsName,
      'DISPLAYSUSPECTNAME': instance.displaySuspectName,
      'DISPLAYCHARGE': instance.displayCharge,
      'PROVINCENAME': instance.provinceName,
      'AMPHURNAME': instance.amphurName,
      'TAMBONNAME': instance.tambonName,
      'PROVINCECODE': instance.provinceCode,
      'AMPHURCODE': instance.amphur,
      'TAMBONCODE': instance.tambon,
      'CRIMELOCATIONROAD': instance.crimeLocationRoad,
      'CRIMELOCATIONLANE': instance.crimeLocationLane,
      'DISPLAYRESULTCASE_INVESTIGATOR': instance.displayResultCase_investigator,
      'DISPLAYRESULTC_HEADINVESTIGATO': instance.displayResultC_headInvestigato,
      'BK': instance.bk,
      'BH': instance.bh,
      'ORGCODE': instance.orgCode,
      'STATIONNAME': instance.stationName,
      'CCID': instance.ccid,
      'FULLCASENO': instance.fullcaseNo,
    };

ListCrimeCaseDto _$ListCrimeCaseDtoFromJson(Map<String, dynamic> json) =>
    ListCrimeCaseDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CrimeCaseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCrimeCaseDtoToJson(ListCrimeCaseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
