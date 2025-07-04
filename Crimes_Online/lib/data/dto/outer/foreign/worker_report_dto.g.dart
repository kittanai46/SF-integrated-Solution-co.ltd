// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportWorkerDto _$ReportWorkerDtoFromJson(Map<String, dynamic> json) =>
    ReportWorkerDto(
      workerID: json['WorkerID'] as String?,
      fullNameEN: json['FullNameEN'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      marryStatus: json['MarryStatus'] as String?,
      peopleStatus: json['PeopleStatus'] as String?,
      birthdate: json['Birthdate'] as String?,
      gender: json['Gender'] as String?,
      nationality: json['Nationality'] as String?,
      oldWorkerID: json['OldWorkerID'] as String?,
      houseID: json['HouseID'] as String?,
      houseNumber: json['HouseNumber'] as String?,
      moo: json['Moo'] as String?,
      alley: json['Alley'] as String?,
      soi: json['Soi'] as String?,
      road: json['Road'] as String?,
      tambon: json['Tambon'] as String?,
      amphur: json['Amphur'] as String?,
      province: json['Province'] as String?,
      place: json['Place'] as String?,
      sellHouseDate: json['SellHouseDate'] as String?,
      img: json['Img'] as String?,
    );

Map<String, dynamic> _$ReportWorkerDtoToJson(ReportWorkerDto instance) =>
    <String, dynamic>{
      'WorkerID': instance.workerID,
      'FullNameEN': instance.fullNameEN,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'MarryStatus': instance.marryStatus,
      'PeopleStatus': instance.peopleStatus,
      'Birthdate': instance.birthdate,
      'Gender': instance.gender,
      'Nationality': instance.nationality,
      'OldWorkerID': instance.oldWorkerID,
      'HouseID': instance.houseID,
      'HouseNumber': instance.houseNumber,
      'Moo': instance.moo,
      'Alley': instance.alley,
      'Soi': instance.soi,
      'Road': instance.road,
      'Tambon': instance.tambon,
      'Amphur': instance.amphur,
      'Province': instance.province,
      'Place': instance.place,
      'SellHouseDate': instance.sellHouseDate,
      'Img': instance.img,
    };
