// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerDto _$WorkerDtoFromJson(Map<String, dynamic> json) => WorkerDto(
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
    );

Map<String, dynamic> _$WorkerDtoToJson(WorkerDto instance) => <String, dynamic>{
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
    };

ListWorkerDto _$ListWorkerDtoFromJson(Map<String, dynamic> json) =>
    ListWorkerDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WorkerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWorkerDtoToJson(ListWorkerDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
