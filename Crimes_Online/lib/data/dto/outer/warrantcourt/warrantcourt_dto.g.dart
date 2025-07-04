// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrantcourt_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantCourtDto _$WarrantCourtDtoFromJson(Map<String, dynamic> json) =>
    WarrantCourtDto(
      caseNo: json['CASENO'] as String?,
      court: json['COURT'] as String?,
      displayChargePerson: json['DISPLAYCHARGEPERSON'] as String?,
      statusSuspectArrest: json['STATUSSUSPECTARREST'] as String?,
      statusWarrant: json['STATUSWARRANT'] as String?,
      suspectFullname: json['SUSPECTFULLNAME'] as String?,
      suspectId: json['SUSPECTID'] as String?,
      wrNo: json['WR_NO'] as String?,
      wrId: json['WRID'] as String?,
      caseType: json['CASETYPE'] as String?,
      wrFileId: json['WRFILEID'] as String?,
      updateDate: json['UPDATE_DATE'] as String?,
      wrStartDate: json['WR_STARTDATE'] as String?,
      wrEndDate: json['WR_ENDDATE'] as String?,
      statusExpired: json['STATUSEXPIRED'] as String?,
      orgCode: json['ORGCODE'] as String?,
      policeFullname: json['POLICEFULLNAME'] as String?,
      suspectProvince: json['SUSPECTPROVINCE'] as String?,
      suspectAmphur: json['SUSPECTAMPHUR'] as String?,
      suspectTambom: json['SUSPECTTAMBON'] as String?,
      wrAge: json['WR_AGE'] as String?,
    );

Map<String, dynamic> _$WarrantCourtDtoToJson(WarrantCourtDto instance) =>
    <String, dynamic>{
      'CASENO': instance.caseNo,
      'COURT': instance.court,
      'DISPLAYCHARGEPERSON': instance.displayChargePerson,
      'STATUSSUSPECTARREST': instance.statusSuspectArrest,
      'STATUSWARRANT': instance.statusWarrant,
      'SUSPECTFULLNAME': instance.suspectFullname,
      'SUSPECTID': instance.suspectId,
      'WR_NO': instance.wrNo,
      'WRID': instance.wrId,
      'CASETYPE': instance.caseType,
      'WRFILEID': instance.wrFileId,
      'UPDATE_DATE': instance.updateDate,
      'WR_STARTDATE': instance.wrStartDate,
      'WR_ENDDATE': instance.wrEndDate,
      'STATUSEXPIRED': instance.statusExpired,
      'ORGCODE': instance.orgCode,
      'POLICEFULLNAME': instance.policeFullname,
      'SUSPECTPROVINCE': instance.suspectProvince,
      'SUSPECTAMPHUR': instance.suspectAmphur,
      'SUSPECTTAMBON': instance.suspectTambom,
      'WR_AGE': instance.wrAge,
    };

ListWarrantCourtDto _$ListWarrantCourtDtoFromJson(Map<String, dynamic> json) =>
    ListWarrantCourtDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WarrantCourtDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWarrantCourtDtoToJson(
        ListWarrantCourtDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
