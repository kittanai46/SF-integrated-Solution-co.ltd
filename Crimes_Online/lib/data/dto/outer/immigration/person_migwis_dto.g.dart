// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_migwis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonMigwisDto _$PersonMigwisDtoFromJson(Map<String, dynamic> json) =>
    PersonMigwisDto(
      keyValue: json['KEY_VALUE'] as String?,
      alienNumber: json['ALIEN_NUMBER'] as String?,
      alienNationality: json['ALIEN_NATIONALITY'] as String?,
      alienDocNumber: json['ALIEN_DOC_NUMBER'] as String?,
      alienDocExpirydate: json['ALIEN_DOC_EXPIRYDATE'] as String?,
      alienDocIssuectry: json['ALIEN_DOC_ISSUECTRY'] as String?,
      alienSurname: json['ALIEN_SURNAME'] as String?,
      alienGivenname: json['ALIEN_GIVENNAME'] as String?,
      alienMiddlename: json['ALIEN_MIDDLENAME'] as String?,
      alienDob: json['ALIEN_DOB'] as String?,
      alienSex: json['ALIEN_SEX'] as String?,
      enrollmentReason: json['ENROLLMENT_REASON'] as String?,
      contact: json['CONTACT'] as String?,
      note: json['NOTE'] as String?,
      insAt: json['INS_AT'] as String?,
      createdBy: json['CREATED_BY'] as String?,
      borderpost: json['BORDERPOST'] as String?,
      images: json['IMAGES'] as String?,
      createdate: json['CREATEDATE'] as String?,
    );

Map<String, dynamic> _$PersonMigwisDtoToJson(PersonMigwisDto instance) =>
    <String, dynamic>{
      'KEY_VALUE': instance.keyValue,
      'ALIEN_NUMBER': instance.alienNumber,
      'ALIEN_NATIONALITY': instance.alienNationality,
      'ALIEN_DOC_NUMBER': instance.alienDocNumber,
      'ALIEN_DOC_EXPIRYDATE': instance.alienDocExpirydate,
      'ALIEN_DOC_ISSUECTRY': instance.alienDocIssuectry,
      'ALIEN_SURNAME': instance.alienSurname,
      'ALIEN_GIVENNAME': instance.alienGivenname,
      'ALIEN_MIDDLENAME': instance.alienMiddlename,
      'ALIEN_DOB': instance.alienDob,
      'ALIEN_SEX': instance.alienSex,
      'ENROLLMENT_REASON': instance.enrollmentReason,
      'CONTACT': instance.contact,
      'NOTE': instance.note,
      'INS_AT': instance.insAt,
      'CREATED_BY': instance.createdBy,
      'BORDERPOST': instance.borderpost,
      'IMAGES': instance.images,
      'CREATEDATE': instance.createdate,
    };

ListMigwisDto _$ListMigwisDtoFromJson(Map<String, dynamic> json) =>
    ListMigwisDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PersonMigwisDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListMigwisDtoToJson(ListMigwisDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
