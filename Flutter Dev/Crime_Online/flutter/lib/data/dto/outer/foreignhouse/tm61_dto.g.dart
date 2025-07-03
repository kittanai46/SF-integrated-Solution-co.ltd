// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tm61_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tm61Dto _$Tm61DtoFromJson(Map<String, dynamic> json) => Tm61Dto(
      fullname: json['Fullname'] as String?,
      birthDate: json['BirthDate'] as String?,
      nationenm: json['Nationenm'] as String?,
      traveldocType: json['TraveldocType'] as String?,
      passportPlace: json['PassportPlace'] as String?,
      passportNo: json['PassportNo'] as String?,
      passportDate: json['PassportDate'] as String?,
      countenm: json['Countenm'] as String?,
      inDate: json['inDate'] as String?,
      permitDate: json['PermitDate'] as String?,
      convenm: json['Convenm'] as String?,
      status: json['Status'] as String?,
      reason: json['Reason'] as String?,
      building: json['Building'] as String?,
      addr: json['Addr'] as String?,
      road: json['Road'] as String?,
      tmbSeqno: json['tmbSeqno'] as String?,
      tmbDecs: json['tmbDecs'] as String?,
      ampSeqno: json['ampSeqno'] as String?,
      ampDecs: json['ampDecs'] as String?,
      pvSeqno: json['pvSeqno'] as String?,
      pvDecs: json['pvDecs'] as String?,
    );

Map<String, dynamic> _$Tm61DtoToJson(Tm61Dto instance) => <String, dynamic>{
      'Fullname': instance.fullname,
      'BirthDate': instance.birthDate,
      'Nationenm': instance.nationenm,
      'TraveldocType': instance.traveldocType,
      'PassportPlace': instance.passportPlace,
      'PassportNo': instance.passportNo,
      'PassportDate': instance.passportDate,
      'Countenm': instance.countenm,
      'inDate': instance.inDate,
      'PermitDate': instance.permitDate,
      'Convenm': instance.convenm,
      'Status': instance.status,
      'Reason': instance.reason,
      'Building': instance.building,
      'Addr': instance.addr,
      'Road': instance.road,
      'tmbSeqno': instance.tmbSeqno,
      'tmbDecs': instance.tmbDecs,
      'ampSeqno': instance.ampSeqno,
      'ampDecs': instance.ampDecs,
      'pvSeqno': instance.pvSeqno,
      'pvDecs': instance.pvDecs,
    };

ListTm61Dto _$ListTm61DtoFromJson(Map<String, dynamic> json) => ListTm61Dto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Tm61Dto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTm61DtoToJson(ListTm61Dto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
