// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtensionDto _$ExtensionDtoFromJson(Map<String, dynamic> json) => ExtensionDto(
      passportno: json['passportno'] as String?,
      tm6no: json['tm6no'] as String?,
      documentno: json['documentno'] as String?,
      firstname: json['firstname'] as String?,
      middlename: json['middlename'] as String?,
      surname: json['surname'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      birthplace: json['birthplace'] as String?,
      nationality: json['nationality'] as String?,
      countryNameEn: json['country_name_en'] as String?,
      countryNameTh: json['country_name_th'] as String?,
      issueDate: json['issue_date'] as String?,
      expiryDate: json['expiry_date'] as String?,
      inDate: json['in_date'] as String?,
      extDate: json['ext_date'] as String?,
      extDay: json['ext_day'] as String?,
      flightno: json['flightno'] as String?,
      visaDesc: json['visa_desc'] as String?,
      visaExpiryDate: json['visa_expiry_date'] as String?,
      building: json['building'] as String?,
      address: json['address'] as String?,
      road: json['road'] as String?,
      province: json['province'] as String?,
      district: json['district'] as String?,
      subdistrict: json['subdistrict'] as String?,
      postcode: json['postcode'] as String?,
      tel: json['tel'] as String?,
      permitDate: json['permit_date'] as String?,
      reference: json['reference'] as String?,
      reason: json['reason'] as String?,
      imgpass: json['imgpass'] as String?,
      livephoto: json['livephoto'] as String?,
    );

Map<String, dynamic> _$ExtensionDtoToJson(ExtensionDto instance) =>
    <String, dynamic>{
      'passportno': instance.passportno,
      'tm6no': instance.tm6no,
      'documentno': instance.documentno,
      'firstname': instance.firstname,
      'middlename': instance.middlename,
      'surname': instance.surname,
      'gender': instance.gender,
      'dob': instance.dob,
      'birthplace': instance.birthplace,
      'nationality': instance.nationality,
      'country_name_en': instance.countryNameEn,
      'country_name_th': instance.countryNameTh,
      'issue_date': instance.issueDate,
      'expiry_date': instance.expiryDate,
      'in_date': instance.inDate,
      'ext_date': instance.extDate,
      'ext_day': instance.extDay,
      'flightno': instance.flightno,
      'visa_desc': instance.visaDesc,
      'visa_expiry_date': instance.visaExpiryDate,
      'building': instance.building,
      'address': instance.address,
      'road': instance.road,
      'province': instance.province,
      'district': instance.district,
      'subdistrict': instance.subdistrict,
      'postcode': instance.postcode,
      'tel': instance.tel,
      'permit_date': instance.permitDate,
      'reference': instance.reference,
      'reason': instance.reason,
      'imgpass': instance.imgpass,
      'livephoto': instance.livephoto,
    };

ListExtensionDto _$ListExtensionDtoFromJson(Map<String, dynamic> json) =>
    ListExtensionDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ExtensionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListExtensionDtoToJson(ListExtensionDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
