// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idc_bp1_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdcBp1Dto _$IdcBp1DtoFromJson(Map<String, dynamic> json) => IdcBp1Dto(
      pB1Number: json['PB1Number'] as String?,
      pID: json['PID'] as String?,
      birthDate: json['BirthDate'] as String?,
      gender: json['Gender'] as String?,
      blood: json['Blood'] as String?,
      microNo: json['MicroNo'] as String?,
      marryStatus: json['MarryStatus'] as String?,
      religion: json['Religion'] as String?,
      occupation: json['Occupation'] as String?,
      reqHaveCardNo: json['ReqHaveCardNo'] as String?,
      reqCardNo: json['ReqCardNo'] as String?,
      cardStatus: json['CardStatus'] as String?,
      printCardDate: json['PrintCardDate'] as String?,
      lostCardDate: json['LostCardDate'] as String?,
      causeCardCancel: json['CauseCardCancel'] as String?,
      causeCardCancelDesc: json['CauseCardCancelDesc'] as String?,
      cardCancelDate: json['CardCancelDate'] as String?,
      houseID: json['HouseID'] as String?,
      zipCode: json['ZipCode'] as String?,
      title: json['Title'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      lastNameDesc: json['LastNameDesc'] as String?,
      religionDesc: json['ReligionDesc'] as String?,
      printCardBy: json['PrintCardBy'] as String?,
      regOffName: json['RegOffName'] as String?,
      houseNo: json['HouseNo'] as String?,
      moo: json['Moo'] as String?,
      alley: json['Alley'] as String?,
      soi: json['Soi'] as String?,
      road: json['Road'] as String?,
      tambon: json['Tambon'] as String?,
      amphur: json['Amphur'] as String?,
      province: json['Province'] as String?,
      tel: json['Tel'] as String?,
      record: json['Record'] as String?,
    );

Map<String, dynamic> _$IdcBp1DtoToJson(IdcBp1Dto instance) => <String, dynamic>{
      'PB1Number': instance.pB1Number,
      'PID': instance.pID,
      'BirthDate': instance.birthDate,
      'Gender': instance.gender,
      'Blood': instance.blood,
      'MicroNo': instance.microNo,
      'MarryStatus': instance.marryStatus,
      'Religion': instance.religion,
      'Occupation': instance.occupation,
      'ReqHaveCardNo': instance.reqHaveCardNo,
      'ReqCardNo': instance.reqCardNo,
      'CardStatus': instance.cardStatus,
      'PrintCardDate': instance.printCardDate,
      'LostCardDate': instance.lostCardDate,
      'CauseCardCancel': instance.causeCardCancel,
      'CauseCardCancelDesc': instance.causeCardCancelDesc,
      'CardCancelDate': instance.cardCancelDate,
      'HouseID': instance.houseID,
      'ZipCode': instance.zipCode,
      'Title': instance.title,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'LastNameDesc': instance.lastNameDesc,
      'ReligionDesc': instance.religionDesc,
      'PrintCardBy': instance.printCardBy,
      'RegOffName': instance.regOffName,
      'HouseNo': instance.houseNo,
      'Moo': instance.moo,
      'Alley': instance.alley,
      'Soi': instance.soi,
      'Road': instance.road,
      'Tambon': instance.tambon,
      'Amphur': instance.amphur,
      'Province': instance.province,
      'Tel': instance.tel,
      'Record': instance.record,
    };

ListIdcBp1Dto _$ListIdcBp1DtoFromJson(Map<String, dynamic> json) =>
    ListIdcBp1Dto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => IdcBp1Dto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListIdcBp1DtoToJson(ListIdcBp1Dto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
