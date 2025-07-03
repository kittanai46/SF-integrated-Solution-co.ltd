// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalDto _$HospitalDtoFromJson(Map<String, dynamic> json) => HospitalDto(
      activeStatus: json['activeStatus'] as String?,
      activeStatusDesc: json['activeStatusDesc'] as String?,
      empBirthDate: json['empBirthDate'] as String?,
      expirationDate: json['expirationDate'] as String?,
      firstName: json['firstName'] as String?,
      gender: json['gender'] as String?,
      genderDesc: json['genderDesc'] as String?,
      idDesc: json['idDesc'] as String?,
      idType: json['idType'] as String?,
      lastName: json['lastName'] as String?,
      ssoNum: json['ssoNum'] as String?,
      titleCode: json['titleCode'] as String?,
      titleCodeDesc: json['titleCodeDesc'] as String?,
      hospitalCode: json['hospitalCode'] as String?,
      hospitalName: json['hospitalName'] as String?,
      medYY: json['medYY'] as String?,
      mselExpireDate: json['mselExpireDate'] as String?,
      mselLastChange: json['mselLastChange'] as String?,
      mselStartDate: json['mselStartDate'] as String?,
      mselStatus: json['mselStatus'] as String?,
      mselStatusDesc: json['mselStatusDesc'] as String?,
      ssoBranchCode: json['ssoBranchCode'] as String?,
      ssoBranchName: json['ssoBranchName'] as String?,
    );

Map<String, dynamic> _$HospitalDtoToJson(HospitalDto instance) =>
    <String, dynamic>{
      'activeStatus': instance.activeStatus,
      'activeStatusDesc': instance.activeStatusDesc,
      'empBirthDate': instance.empBirthDate,
      'expirationDate': instance.expirationDate,
      'firstName': instance.firstName,
      'gender': instance.gender,
      'genderDesc': instance.genderDesc,
      'idDesc': instance.idDesc,
      'idType': instance.idType,
      'lastName': instance.lastName,
      'ssoNum': instance.ssoNum,
      'titleCode': instance.titleCode,
      'titleCodeDesc': instance.titleCodeDesc,
      'hospitalCode': instance.hospitalCode,
      'hospitalName': instance.hospitalName,
      'medYY': instance.medYY,
      'mselExpireDate': instance.mselExpireDate,
      'mselLastChange': instance.mselLastChange,
      'mselStartDate': instance.mselStartDate,
      'mselStatus': instance.mselStatus,
      'mselStatusDesc': instance.mselStatusDesc,
      'ssoBranchCode': instance.ssoBranchCode,
      'ssoBranchName': instance.ssoBranchName,
    };

ListHospitalDto _$ListHospitalDtoFromJson(Map<String, dynamic> json) =>
    ListHospitalDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HospitalDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHospitalDtoToJson(ListHospitalDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
