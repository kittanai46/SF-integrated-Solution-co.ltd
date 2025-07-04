// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrantcrd_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantCRDDto _$WarrantCRDDtoFromJson(Map<String, dynamic> json) =>
    WarrantCRDDto(
      card_id: json['CARD_ID'] as String?,
      pname: json['PNAME'] as String?,
      fname: json['FNAME'] as String?,
      midname: json['MIDNAME'] as String?,
      lname: json['LNAME'] as String?,
      engname: json['ENGNAME'] as String?,
      idno: json['IDNO'] as String?,
      charge: json['CHARGE'] as String?,
      caseno: json['CASENO'] as String?,
      caseyear: json['CASEYEAR'] as String?,
      orgcode: json['ORGCODE'] as String?,
      caseorg: json['CASEORG'] as String?,
      cousin_name: json['COUSIN_NAME'] as String?,
      cousin_addr: json['COUSIN_ADDR'] as String?,
      credte: json['CREDTE'] as String?,
      creusr: json['CREUSR'] as String?,
      ex_d: json['EX_D'] as String?,
      gang: json['GANG'] as String?,
      gang_name: json['GANG_NAME'] as String?,
      happenaddr: json['HAPPENADDR'] as String?,
      office: json['OFFICE'] as String?,
      police: json['POLICE'] as String?,
      position: json['POSITION'] as String?,
      prize: json['PRIZE'] as String?,
      proc_d: json['PROC_D'] as String?,
      proc_no: json['PROC_NO'] as String?,
      proc_off: json['PROC_OFF'] as String?,
      spouse_addr: json['SPOUSE_ADDR'] as String?,
      spouse_name: json['SPOUSE_NAME'] as String?,
      upd_date: json['UPD_DATE'] as String?,
      upd_id: json['UPD_ID'] as String?,
      want_d: json['WANT_D'] as String?,
      want_name: json['WANT_NAME'] as String?,
      want_no: json['WANT_NO'] as String?,
      want_off: json['WANT_OFF'] as String?,
      want_y: json['WANT_Y'] as String?,
      warrant_doc: json['WARRANT_DOC'] as String?,
      statusExpired: json['STATUSEXPIRED'] as String?,
    );

Map<String, dynamic> _$WarrantCRDDtoToJson(WarrantCRDDto instance) =>
    <String, dynamic>{
      'CARD_ID': instance.card_id,
      'PNAME': instance.pname,
      'FNAME': instance.fname,
      'MIDNAME': instance.midname,
      'LNAME': instance.lname,
      'ENGNAME': instance.engname,
      'IDNO': instance.idno,
      'CHARGE': instance.charge,
      'CASENO': instance.caseno,
      'CASEYEAR': instance.caseyear,
      'ORGCODE': instance.orgcode,
      'CASEORG': instance.caseorg,
      'COUSIN_NAME': instance.cousin_name,
      'COUSIN_ADDR': instance.cousin_addr,
      'CREDTE': instance.credte,
      'CREUSR': instance.creusr,
      'EX_D': instance.ex_d,
      'GANG': instance.gang,
      'GANG_NAME': instance.gang_name,
      'HAPPENADDR': instance.happenaddr,
      'OFFICE': instance.office,
      'POLICE': instance.police,
      'POSITION': instance.position,
      'PRIZE': instance.prize,
      'PROC_D': instance.proc_d,
      'PROC_NO': instance.proc_no,
      'PROC_OFF': instance.proc_off,
      'SPOUSE_ADDR': instance.spouse_addr,
      'SPOUSE_NAME': instance.spouse_name,
      'UPD_DATE': instance.upd_date,
      'UPD_ID': instance.upd_id,
      'WANT_D': instance.want_d,
      'WANT_NAME': instance.want_name,
      'WANT_NO': instance.want_no,
      'WANT_OFF': instance.want_off,
      'WANT_Y': instance.want_y,
      'WARRANT_DOC': instance.warrant_doc,
      'STATUSEXPIRED': instance.statusExpired,
    };

ListWarrantCRDDto _$ListWarrantCRDDtoFromJson(Map<String, dynamic> json) =>
    ListWarrantCRDDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WarrantCRDDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWarrantCRDDtoToJson(ListWarrantCRDDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
