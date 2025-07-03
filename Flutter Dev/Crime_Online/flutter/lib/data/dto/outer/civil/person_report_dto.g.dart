// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportPersonDto _$ReportPersonDtoFromJson(Map<String, dynamic> json) =>
    ReportPersonDto(
      pID: json['PID'] as String?,
      title: json['Title'] as String?,
      firstName: json['Firstname'] as String?,
      lastName: json['Lastname'] as String?,
      birthdate: json['Birthdate'] as String?,
      gender: json['Gender'] as String?,
      age: json['Age'] as String?,
      moveInDate: json['MoveInDate'] as String?,
      peopleStatus: json['PeopleStatus'] as String?,
      nationality: json['Nationality'] as String?,
      houseOwnerStatus: json['HouseOwnerStatus'] as String?,
      fatherPID: json['FatherPID'] as String?,
      fatherName: json['FatherName'] as String?,
      fatherNationality: json['FatherNationality'] as String?,
      motherPID: json['MotherPID'] as String?,
      motherName: json['MotherName'] as String?,
      motherNationality: json['MotherNationality'] as String?,
      houseID: json['HouseID'] as String?,
      houseNumber: json['HouseNumber'] as String?,
      moo: json['Moo'] as String?,
      alley: json['Alley'] as String?,
      soi: json['Soi'] as String?,
      road: json['Road'] as String?,
      tambon: json['Tambon'] as String?,
      amphur: json['Amphur'] as String?,
      province: json['Province'] as String?,
      changedNationalityStatus: json['ChangedNationalityStatus'] as String?,
      changedNationalityDate: json['ChangedNationalityDate'] as String?,
      address: json['Address'] as String?,
      img: json['Img'] as String?,
    );

Map<String, dynamic> _$ReportPersonDtoToJson(ReportPersonDto instance) =>
    <String, dynamic>{
      'PID': instance.pID,
      'Title': instance.title,
      'Firstname': instance.firstName,
      'Lastname': instance.lastName,
      'Birthdate': instance.birthdate,
      'Gender': instance.gender,
      'Age': instance.age,
      'MoveInDate': instance.moveInDate,
      'PeopleStatus': instance.peopleStatus,
      'Nationality': instance.nationality,
      'HouseOwnerStatus': instance.houseOwnerStatus,
      'FatherPID': instance.fatherPID,
      'FatherName': instance.fatherName,
      'FatherNationality': instance.fatherNationality,
      'MotherPID': instance.motherPID,
      'MotherName': instance.motherName,
      'MotherNationality': instance.motherNationality,
      'HouseID': instance.houseID,
      'HouseNumber': instance.houseNumber,
      'Moo': instance.moo,
      'Alley': instance.alley,
      'Soi': instance.soi,
      'Road': instance.road,
      'Tambon': instance.tambon,
      'Amphur': instance.amphur,
      'Province': instance.province,
      'ChangedNationalityStatus': instance.changedNationalityStatus,
      'ChangedNationalityDate': instance.changedNationalityDate,
      'Address': instance.address,
      'Img': instance.img,
    };
