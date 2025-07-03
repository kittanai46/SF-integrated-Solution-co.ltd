// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantDto _$WarrantDtoFromJson(Map<String, dynamic> json) => WarrantDto(
      bh: json['BH'] as String?,
      caseNo: json['CASENO'] as String?,
      court: json['COURT'] as String?,
      displayChargePerson: json['DISPLAYCHARGEPERSON'] as String?,
      stationName: json['STATIONNAME'] as String?,
      statusSuspectArrest: json['STATUSSUSPECTARREST'] as String?,
      statusWarrant: json['STATUSWARRANT'] as String?,
      suspectFullname: json['SUSPECTFULLNAME'] as String?,
      suspectId: json['SUSPECTID'] as String?,
      wrNo: json['WR_NO'] as String?,
      wrId: json['WRID'] as String?,
      caseType: json['CASETYPE'] as String?,
      wrFileId: json['WRFILEID'] as String?,
      statusExpired: json['STATUSEXPIRED'] as String?,
      orgCode: json['ORGCODE'] as String?,
      policeFullname: json['POLICEFULLNAME'] as String?,
      wrAge: json['WR_AGE'] as String?,
    )
      ..updateDate = json['UPDATE_DATE'] as String?
      ..bk = json['BK'] as String?
      ..wrStartDate = json['WR_STARTDATE'] as String?
      ..wrEndDate = json['WR_ENDDATE'] as String?
      ..wrDate = json['WR_DATE'] as String?
      ..suspectProvince = json['SUSPECTPROVINCE'] as String?
      ..suspectAmphur = json['SUSPECTAMPHUR'] as String?
      ..suspectTambom = json['SUSPECTTAMBON'] as String?;

Map<String, dynamic> _$WarrantDtoToJson(WarrantDto instance) =>
    <String, dynamic>{
      'BH': instance.bh,
      'CASENO': instance.caseNo,
      'COURT': instance.court,
      'DISPLAYCHARGEPERSON': instance.displayChargePerson,
      'STATIONNAME': instance.stationName,
      'STATUSSUSPECTARREST': instance.statusSuspectArrest,
      'STATUSWARRANT': instance.statusWarrant,
      'SUSPECTFULLNAME': instance.suspectFullname,
      'SUSPECTID': instance.suspectId,
      'WR_NO': instance.wrNo,
      'WRID': instance.wrId,
      'CASETYPE': instance.caseType,
      'WRFILEID': instance.wrFileId,
      'UPDATE_DATE': instance.updateDate,
      'BK': instance.bk,
      'WR_STARTDATE': instance.wrStartDate,
      'WR_ENDDATE': instance.wrEndDate,
      'STATUSEXPIRED': instance.statusExpired,
      'ORGCODE': instance.orgCode,
      'POLICEFULLNAME': instance.policeFullname,
      'WR_DATE': instance.wrDate,
      'SUSPECTPROVINCE': instance.suspectProvince,
      'SUSPECTAMPHUR': instance.suspectAmphur,
      'SUSPECTTAMBON': instance.suspectTambom,
      'WR_AGE': instance.wrAge,
    };

ListWarrantDto _$ListWarrantDtoFromJson(Map<String, dynamic> json) =>
    ListWarrantDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WarrantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWarrantDtoToJson(ListWarrantDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
