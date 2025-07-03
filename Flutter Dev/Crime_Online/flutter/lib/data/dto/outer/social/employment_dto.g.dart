// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentDto _$EmploymentDtoFromJson(Map<String, dynamic> json) =>
    EmploymentDto(
      ssoNum: json['ssoNum'] as String?,
      idType: json['idType'] as String?,
      idDesc: json['idDesc'] as String?,
      titleCode: json['titleCode'] as String?,
      titleCodeDesc: json['titleCodeDesc'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      empBirthDate: json['empBirthDate'] as String?,
      gender: json['gender'] as String?,
      genderDesc: json['genderDesc'] as String?,
      activeStatus: json['activeStatus'] as String?,
      activeStatusDesc: json['activeStatusDesc'] as String?,
      expirationDate: json['expirationDate'] as String?,
      accBran: json['accBran'] as String?,
      accNo: json['accNo'] as String?,
      companyName: json['companyName'] as String?,
      employStatus: json['employStatus'] as String?,
      employStatusDesc: json['employStatusDesc'] as String?,
      empResignDate: json['empResignDate'] as String?,
      expStartDate: json['expStartDate'] as String?,
    );

Map<String, dynamic> _$EmploymentDtoToJson(EmploymentDto instance) =>
    <String, dynamic>{
      'ssoNum': instance.ssoNum,
      'idType': instance.idType,
      'idDesc': instance.idDesc,
      'titleCode': instance.titleCode,
      'titleCodeDesc': instance.titleCodeDesc,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'empBirthDate': instance.empBirthDate,
      'gender': instance.gender,
      'genderDesc': instance.genderDesc,
      'activeStatus': instance.activeStatus,
      'activeStatusDesc': instance.activeStatusDesc,
      'expirationDate': instance.expirationDate,
      'accBran': instance.accBran,
      'accNo': instance.accNo,
      'companyName': instance.companyName,
      'employStatus': instance.employStatus,
      'employStatusDesc': instance.employStatusDesc,
      'empResignDate': instance.empResignDate,
      'expStartDate': instance.expStartDate,
    };

ListEmploymentDto _$ListEmploymentDtoFromJson(Map<String, dynamic> json) =>
    ListEmploymentDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmploymentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListEmploymentDtoToJson(ListEmploymentDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
