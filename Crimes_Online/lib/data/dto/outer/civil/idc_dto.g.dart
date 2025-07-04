// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdcDto _$IdcDtoFromJson(Map<String, dynamic> json) => IdcDto(
      pB1Number: json['PB1Number'] as String?,
      pID: json['PID'] as String?,
      title: json['Title'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      gender: json['Gender'] as String?,
      birthDate: json['BirthDate'] as String?,
      blood: json['Blood'] as String?,
      adress: json['Adress'] as String?,
      moo: json['Moo'] as String?,
      tambon: json['Tambon'] as String?,
      amphur: json['Amphur'] as String?,
      province: json['Province'] as String?,
      reqType: json['ReqType'] as String?,
      reqCardDate: json['ReqCardDate'] as String?,
      printCardDate: json['PrintCardDate'] as String?,
      religion: json['Religion'] as String?,
    );

Map<String, dynamic> _$IdcDtoToJson(IdcDto instance) => <String, dynamic>{
      'PB1Number': instance.pB1Number,
      'PID': instance.pID,
      'Title': instance.title,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Gender': instance.gender,
      'BirthDate': instance.birthDate,
      'Blood': instance.blood,
      'Adress': instance.adress,
      'Moo': instance.moo,
      'Tambon': instance.tambon,
      'Amphur': instance.amphur,
      'Province': instance.province,
      'ReqType': instance.reqType,
      'ReqCardDate': instance.reqCardDate,
      'PrintCardDate': instance.printCardDate,
      'Religion': instance.religion,
    };

ListIdcDto _$ListIdcDtoFromJson(Map<String, dynamic> json) => ListIdcDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => IdcDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListIdcDtoToJson(ListIdcDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
