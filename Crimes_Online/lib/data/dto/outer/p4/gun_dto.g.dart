// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gun_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GunDto _$GunDtoFromJson(Map<String, dynamic> json) => GunDto(
      docDate: json['docDate'] as String?,
      docPlaceDesc: json['docPlaceDesc'] as String?,
      docPlaceProvince: json['docPlaceProvince'] as String?,
      docID: json['docID'] as String?,
      expireDate: json['expireDate'] as String?,
      applicantType: json['applicantType'] as String?,
      signTitleDesc: json['signTitleDesc'] as String?,
      signFullName: json['signFullName'] as String?,
      gunRegistrationId: json['gunRegistrationId'] as String?,
      gunSerialNo: json['gunSerialNo'] as String?,
      gunType: json['gunType'] as String?,
      gunCharacteristic: json['gunCharacteristic'] as String?,
      gunSize: json['gunSize'] as String?,
      gunProduct: json['gunProduct'] as String?,
      remark: json['remark'] as String?,
      personalId: json['personalId'] as String?,
      titleDesc: json['titleDesc'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      genderDesc: json['genderDesc'] as String?,
      fullNameAndRank: json['fullNameAndRank'] as String?,
      hid: json['hid'] as String?,
      hidRcodeDesc: json['hidRcodeDesc'] as String?,
      hno: json['hno'] as String?,
      trok: json['trok'] as String?,
      soi: json['soi'] as String?,
      thanon: json['thanon'] as String?,
      districtDesc: json['districtDesc'] as String?,
      amphorDesc: json['amphorDesc'] as String?,
      provinceDesc: json['provinceDesc'] as String?,
      personalId2: json['personalId2'] as String?,
      titleDesc2: json['titleDesc2'] as String?,
      firstName2: json['firstName2'] as String?,
      middleName2: json['middleName2'] as String?,
      lastName2: json['lastName2'] as String?,
      fullNameAndRank2: json['fullNameAndRank2'] as String?,
      genderDesc2: json['genderDesc2'] as String?,
      businessType: json['businessType'] as String?,
      businessName: json['businessName'] as String?,
      hid2: json['hid2'] as String?,
      hidRcodeDesc2: json['hidRcodeDesc2'] as String?,
      hno2: json['hno2'] as String?,
      trok2: json['trok2'] as String?,
      soi2: json['soi2'] as String?,
      thanon2: json['thanon2'] as String?,
      districtDesc2: json['districtDesc2'] as String?,
      amphorDesc2: json['amphorDesc2'] as String?,
      provinceDesc2: json['provinceDesc2'] as String?,
    );

Map<String, dynamic> _$GunDtoToJson(GunDto instance) => <String, dynamic>{
      'docDate': instance.docDate,
      'docPlaceDesc': instance.docPlaceDesc,
      'docPlaceProvince': instance.docPlaceProvince,
      'docID': instance.docID,
      'expireDate': instance.expireDate,
      'applicantType': instance.applicantType,
      'signTitleDesc': instance.signTitleDesc,
      'signFullName': instance.signFullName,
      'gunRegistrationId': instance.gunRegistrationId,
      'gunSerialNo': instance.gunSerialNo,
      'gunType': instance.gunType,
      'gunCharacteristic': instance.gunCharacteristic,
      'gunSize': instance.gunSize,
      'gunProduct': instance.gunProduct,
      'remark': instance.remark,
      'personalId': instance.personalId,
      'titleDesc': instance.titleDesc,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'genderDesc': instance.genderDesc,
      'fullNameAndRank': instance.fullNameAndRank,
      'hid': instance.hid,
      'hidRcodeDesc': instance.hidRcodeDesc,
      'hno': instance.hno,
      'trok': instance.trok,
      'soi': instance.soi,
      'thanon': instance.thanon,
      'districtDesc': instance.districtDesc,
      'amphorDesc': instance.amphorDesc,
      'provinceDesc': instance.provinceDesc,
      'personalId2': instance.personalId2,
      'titleDesc2': instance.titleDesc2,
      'firstName2': instance.firstName2,
      'middleName2': instance.middleName2,
      'lastName2': instance.lastName2,
      'fullNameAndRank2': instance.fullNameAndRank2,
      'genderDesc2': instance.genderDesc2,
      'businessType': instance.businessType,
      'businessName': instance.businessName,
      'hid2': instance.hid2,
      'hidRcodeDesc2': instance.hidRcodeDesc2,
      'hno2': instance.hno2,
      'trok2': instance.trok2,
      'soi2': instance.soi2,
      'thanon2': instance.thanon2,
      'districtDesc2': instance.districtDesc2,
      'amphorDesc2': instance.amphorDesc2,
      'provinceDesc2': instance.provinceDesc2,
    };

ListGunDto _$ListGunDtoFromJson(Map<String, dynamic> json) => ListGunDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GunDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListGunDtoToJson(ListGunDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
