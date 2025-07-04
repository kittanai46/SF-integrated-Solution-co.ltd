// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployerDto _$EmployerDtoFromJson(Map<String, dynamic> json) => EmployerDto(
      accNo: json['accNo'] as String?,
      accBranch: json['accBranch'] as String?,
      branchEmplyeeNo: json['branchEmplyeeNo'] as String?,
      companyAddress: json['companyAddress'] as String?,
      companyName: json['companyName'] as String?,
      companyRigNo: json['companyRigNo'] as String?,
      companyStatus: json['companyStatus'] as String?,
      companyStatusDesc: json['companyStatusDesc'] as String?,
      companyTel: json['companyTel'] as String?,
      companyType: json['companyType'] as String?,
      companyTypeDesc: json['companyTypeDesc'] as String?,
      companyZip: json['companyZip'] as String?,
      contactAddress: json['contactAddress'] as String?,
      contactFax: json['contactFax'] as String?,
      contactTel: json['contactTel'] as String?,
      contactZip: json['contactZip'] as String?,
      fdappl: json['fdappl'] as String?,
      lddate: json['lddate'] as String?,
      newOperateDate: json['newOperateDate'] as String?,
      paySsoBranchCode: json['paySsoBranchCode'] as String?,
      paySsoBranchName: json['paySsoBranchName'] as String?,
      ssoBranchCode: json['ssoBranchCode'] as String?,
      ssoBranchName: json['ssoBranchName'] as String?,
      totalEmployeeNo: json['totalEmployeeNo'] as String?,
    );

Map<String, dynamic> _$EmployerDtoToJson(EmployerDto instance) =>
    <String, dynamic>{
      'accNo': instance.accNo,
      'accBranch': instance.accBranch,
      'branchEmplyeeNo': instance.branchEmplyeeNo,
      'companyAddress': instance.companyAddress,
      'companyName': instance.companyName,
      'companyRigNo': instance.companyRigNo,
      'companyStatus': instance.companyStatus,
      'companyStatusDesc': instance.companyStatusDesc,
      'companyTel': instance.companyTel,
      'companyType': instance.companyType,
      'companyTypeDesc': instance.companyTypeDesc,
      'companyZip': instance.companyZip,
      'contactAddress': instance.contactAddress,
      'contactFax': instance.contactFax,
      'contactTel': instance.contactTel,
      'contactZip': instance.contactZip,
      'fdappl': instance.fdappl,
      'lddate': instance.lddate,
      'newOperateDate': instance.newOperateDate,
      'paySsoBranchCode': instance.paySsoBranchCode,
      'paySsoBranchName': instance.paySsoBranchName,
      'ssoBranchCode': instance.ssoBranchCode,
      'ssoBranchName': instance.ssoBranchName,
      'totalEmployeeNo': instance.totalEmployeeNo,
    };

ListEmployerDto _$ListEmployerDtoFromJson(Map<String, dynamic> json) =>
    ListEmployerDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListEmployerDtoToJson(ListEmployerDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
