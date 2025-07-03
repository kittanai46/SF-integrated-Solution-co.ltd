// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imm_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImmDto _$ImmDtoFromJson(Map<String, dynamic> json) => ImmDto(
      mvmntId: json['MVMNTID'] as String?,
      passportNo: json['PASSPORTNO'] as String?,
      countryCode: json['COUNTRYCODE'] as String?,
      countryName: json['COUNTRYNAME'] as String?,
      firstName: json['FIRSTNAME'] as String?,
      middleName: json['MIDDLENAME'] as String?,
      surname: json['SURNAME'] as String?,
      issueDate: json['ISSUEDATE'] as String?,
      expiryDate: json['EXPIRYDATE'] as String?,
      birthDate: json['BIRTHDATE'] as String?,
      gender: json['GENDER'] as String?,
      passportType: json['PASSPORTTYPE'] as String?,
      tripDtm: json['TRIPDTM'] as String?,
      tripDtmSort: json['TRIPDTM_SORT'] as String?,
      flightNo: json['FLIGHTNO'] as String?,
      tripType: json['TRIPTYPE'] as String?,
      visaType: json['VISATYPE'] as String?,
      visaDesc: json['VISADESC'] as String?,
      reason: json['REASON'] as String?,
      borderPostName: json['BORDERPOSTNAME'] as String?,
      visaPermitDay: json['VISAPERMITDAY'] as String?,
      depCancelDate: json['DEPCANCELDATE'] as String?,
      thResidence: json['THRESIDENCE'] as String?,
      visaNumber: json['VISA_NUMBER'] as String?,
      visaExp: json['VISA_EXP'] as String?,
      insAt: json['INS_AT'] as String?,
    );

Map<String, dynamic> _$ImmDtoToJson(ImmDto instance) => <String, dynamic>{
      'MVMNTID': instance.mvmntId,
      'PASSPORTNO': instance.passportNo,
      'COUNTRYCODE': instance.countryCode,
      'COUNTRYNAME': instance.countryName,
      'FIRSTNAME': instance.firstName,
      'MIDDLENAME': instance.middleName,
      'SURNAME': instance.surname,
      'ISSUEDATE': instance.issueDate,
      'EXPIRYDATE': instance.expiryDate,
      'BIRTHDATE': instance.birthDate,
      'GENDER': instance.gender,
      'PASSPORTTYPE': instance.passportType,
      'TRIPDTM': instance.tripDtm,
      'TRIPDTM_SORT': instance.tripDtmSort,
      'FLIGHTNO': instance.flightNo,
      'TRIPTYPE': instance.tripType,
      'VISATYPE': instance.visaType,
      'VISADESC': instance.visaDesc,
      'REASON': instance.reason,
      'BORDERPOSTNAME': instance.borderPostName,
      'VISAPERMITDAY': instance.visaPermitDay,
      'DEPCANCELDATE': instance.depCancelDate,
      'THRESIDENCE': instance.thResidence,
      'VISA_NUMBER': instance.visaNumber,
      'VISA_EXP': instance.visaExp,
      'INS_AT': instance.insAt,
    };

ListImmDto _$ListImmDtoFromJson(Map<String, dynamic> json) => ListImmDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ImmDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListImmDtoToJson(ListImmDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
