// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_lk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonLkDto _$PersonLkDtoFromJson(Map<String, dynamic> json) => PersonLkDto(
      age: json['age'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      dateOfMoveIn: json['dateOfMoveIn'] as String?,
      englishFirstName: json['englishFirstName'] as String?,
      englishLastName: json['englishLastName'] as String?,
      englishMiddleName: json['englishMiddleName'] as String?,
      englishTitleDesc: json['englishTitleDesc'] as String?,
      fatherName: json['fatherName'] as String?,
      fatherNationalityCode: json['fatherNationalityCode'] as String?,
      fatherNationalityDesc: json['fatherNationalityDesc'] as String?,
      fatherPersonalID: json['fatherPersonalID'] as String?,
      firstName: json['firstName'] as String?,
      fullnameAndRank: json['fullnameAndRank'] as String?,
      genderCode: json['genderCode'] as String?,
      genderDesc: json['genderDesc'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      motherName: json['motherName'] as String?,
      motherNationalityCode: json['motherNationalityCode'] as String?,
      motherNationalityDesc: json['motherNationalityDesc'] as String?,
      motherPersonalID: json['motherPersonalID'] as String?,
      nationalityCode: json['nationalityCode'] as String?,
      nationalityDesc: json['nationalityDesc'] as String?,
      ownerStatusDesc: json['ownerStatusDesc'] as String?,
      pid: json['pid'] as String?,
      recordNumber: json['recordNumber'] as int?,
      statusOfPersonCode: json['statusOfPersonCode'] as String?,
      statusOfPersonDesc: json['statusOfPersonDesc'] as String?,
      titleCode: json['titleCode'] as String?,
      titleDesc: json['titleDesc'] as String?,
      titleName: json['titleName'] as String?,
      titleSex: json['titleSex'] as String?,
      totalRecord: json['totalRecord'] as int?,
    );

Map<String, dynamic> _$PersonLkDtoToJson(PersonLkDto instance) =>
    <String, dynamic>{
      'age': instance.age,
      'dateOfBirth': instance.dateOfBirth,
      'dateOfMoveIn': instance.dateOfMoveIn,
      'englishFirstName': instance.englishFirstName,
      'englishLastName': instance.englishLastName,
      'englishMiddleName': instance.englishMiddleName,
      'englishTitleDesc': instance.englishTitleDesc,
      'fatherName': instance.fatherName,
      'fatherNationalityCode': instance.fatherNationalityCode,
      'fatherNationalityDesc': instance.fatherNationalityDesc,
      'fatherPersonalID': instance.fatherPersonalID,
      'firstName': instance.firstName,
      'fullnameAndRank': instance.fullnameAndRank,
      'genderCode': instance.genderCode,
      'genderDesc': instance.genderDesc,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'motherName': instance.motherName,
      'motherNationalityCode': instance.motherNationalityCode,
      'motherNationalityDesc': instance.motherNationalityDesc,
      'motherPersonalID': instance.motherPersonalID,
      'nationalityCode': instance.nationalityCode,
      'nationalityDesc': instance.nationalityDesc,
      'ownerStatusDesc': instance.ownerStatusDesc,
      'pid': instance.pid,
      'recordNumber': instance.recordNumber,
      'statusOfPersonCode': instance.statusOfPersonCode,
      'statusOfPersonDesc': instance.statusOfPersonDesc,
      'titleCode': instance.titleCode,
      'titleDesc': instance.titleDesc,
      'titleName': instance.titleName,
      'titleSex': instance.titleSex,
      'totalRecord': instance.totalRecord,
    };

ListPersonLkDto _$ListPersonLkDtoFromJson(Map<String, dynamic> json) =>
    ListPersonLkDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PersonLkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPersonLkDtoToJson(ListPersonLkDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
