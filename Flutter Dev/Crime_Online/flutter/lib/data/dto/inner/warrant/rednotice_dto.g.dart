// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rednotice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedNoticeDto _$RedNoticeDtoFromJson(Map<String, dynamic> json) => RedNoticeDto(
      sequenceNo: json['SEQUENCENO'] as String?,
      policeName: json['POLICENAME'] as String?,
      suspectName: json['SUSPECTNAME'] as String?,
      nationality: json['NATIONALITY'] as String?,
      warrantNumber: json['WARRANTNUMBER'] as String?,
      warrantExpire: json['WARRANTEXPIRE'] as String?,
      warrantExpireStr: json['WARRANTEXPIRE_STR'] as String?,
      controlNumber: json['CONTROLNUMBER'] as String?,
      publishDate: json['PUBLISHDATE'] as String?,
      publishDateStr: json['PUBLISHDATE_STR'] as String?,
      charge: json['CHARGE'] as String?,
      organizationOwner: json['ORGANIZATIONOWNER'] as String?,
      bookNumber: json['BOOKNUMBER'] as String?,
      remarkVisited: json['REMARKVISITED'] as String?,
      divisionOwner: json['DIVISIONOWNER'] as String?,
    );

Map<String, dynamic> _$RedNoticeDtoToJson(RedNoticeDto instance) =>
    <String, dynamic>{
      'SEQUENCENO': instance.sequenceNo,
      'POLICENAME': instance.policeName,
      'SUSPECTNAME': instance.suspectName,
      'NATIONALITY': instance.nationality,
      'WARRANTNUMBER': instance.warrantNumber,
      'WARRANTEXPIRE': instance.warrantExpire,
      'WARRANTEXPIRE_STR': instance.warrantExpireStr,
      'CONTROLNUMBER': instance.controlNumber,
      'PUBLISHDATE': instance.publishDate,
      'PUBLISHDATE_STR': instance.publishDateStr,
      'CHARGE': instance.charge,
      'ORGANIZATIONOWNER': instance.organizationOwner,
      'BOOKNUMBER': instance.bookNumber,
      'REMARKVISITED': instance.remarkVisited,
      'DIVISIONOWNER': instance.divisionOwner,
    };

ListRedNoticeDto _$ListRedNoticeDtoFromJson(Map<String, dynamic> json) =>
    ListRedNoticeDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RedNoticeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListRedNoticeDtoToJson(ListRedNoticeDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
