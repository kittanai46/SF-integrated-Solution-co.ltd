// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alien_person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlienPersonDto _$AlienPersonDtoFromJson(Map<String, dynamic> json) =>
    AlienPersonDto(
      personalID: json['personalID'] as String?,
      bloodType: json['bloodType'] as String?,
      dateInThai: json['dateInThai'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      doeNumber: json['doeNumber'] as String?,
      father_name: json['father.name'] as String?,
      father_nationalityDesc: json['father.nationalityDesc'] as String?,
      father_personalID: json['father.personalID'] as String?,
      firstName: json['firstName'] as String?,
      genderDesc: json['genderDesc'] as String?,
      houseID: json['houseID'] as String?,
      lastName: json['lastName'] as String?,
      marryStatus: json['marryStatus'] as String?,
      mother_name: json['mother.name'] as String?,
      mother_nationalityDesc: json['mother.nationalityDesc'] as String?,
      mother_personalID: json['mother.personalID'] as String?,
      nationalityDesc: json['nationalityDesc'] as String?,
      passport_expireDate: json['passport.expireDate'] as String?,
      passport_documentNo: json['passport.documentNo'] as String?,
      passport_documentIssuePlace:
          json['passport.documentIssuePlace'] as String?,
      passport_documentType: json['passport.documentType'] as String?,
      passport_issueDate: json['passport.issueDate'] as String?,
      personAddDate: json['personAddDate'] as String?,
      religion: json['religion'] as String?,
      spouseName: json['spouseName'] as String?,
      statusAdded: json['statusAdded'] as String?,
      statusOfPersonDesc: json['statusOfPersonDesc'] as String?,
      terminateDate: json['terminateDate'] as String?,
      titleDesc: json['titleDesc'] as String?,
      visa_documentIssuePlace: json['visa.documentIssuePlace'] as String?,
      visa_documentNo: json['visa.documentNo'] as String?,
      visa_expireDate: json['visa.expireDate'] as String?,
      visa_issueDate: json['visa.issueDate'] as String?,
      visa_visaRequestType: json['visa.visaRequestType'] as String?,
      visa_visaType: json['visa.visaType'] as String?,
    );

Map<String, dynamic> _$AlienPersonDtoToJson(AlienPersonDto instance) =>
    <String, dynamic>{
      'personalID': instance.personalID,
      'bloodType': instance.bloodType,
      'dateInThai': instance.dateInThai,
      'dateOfBirth': instance.dateOfBirth,
      'doeNumber': instance.doeNumber,
      'father.name': instance.father_name,
      'father.nationalityDesc': instance.father_nationalityDesc,
      'father.personalID': instance.father_personalID,
      'firstName': instance.firstName,
      'genderDesc': instance.genderDesc,
      'houseID': instance.houseID,
      'lastName': instance.lastName,
      'marryStatus': instance.marryStatus,
      'mother.name': instance.mother_name,
      'mother.nationalityDesc': instance.mother_nationalityDesc,
      'mother.personalID': instance.mother_personalID,
      'nationalityDesc': instance.nationalityDesc,
      'passport.expireDate': instance.passport_expireDate,
      'passport.documentNo': instance.passport_documentNo,
      'passport.documentIssuePlace': instance.passport_documentIssuePlace,
      'passport.documentType': instance.passport_documentType,
      'passport.issueDate': instance.passport_issueDate,
      'personAddDate': instance.personAddDate,
      'religion': instance.religion,
      'spouseName': instance.spouseName,
      'statusAdded': instance.statusAdded,
      'statusOfPersonDesc': instance.statusOfPersonDesc,
      'terminateDate': instance.terminateDate,
      'titleDesc': instance.titleDesc,
      'visa.documentIssuePlace': instance.visa_documentIssuePlace,
      'visa.documentNo': instance.visa_documentNo,
      'visa.expireDate': instance.visa_expireDate,
      'visa.issueDate': instance.visa_issueDate,
      'visa.visaRequestType': instance.visa_visaRequestType,
      'visa.visaType': instance.visa_visaType,
    };

ListAlienPersonDto _$ListAlienPersonDtoFromJson(Map<String, dynamic> json) =>
    ListAlienPersonDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AlienPersonDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListAlienPersonDtoToJson(ListAlienPersonDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
