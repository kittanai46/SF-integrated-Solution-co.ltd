// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_card_lk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeCardLkDto _$MakeCardLkDtoFromJson(Map<String, dynamic> json) =>
    MakeCardLkDto(
      alleyDesc: json['address.alleyDesc'] as String?,
      alleyWayDesc: json['address.alleyWayDesc'] as String?,
      districtDesc: json['address.districtDesc'] as String?,
      houseNo: json['address.houseNo'] as String?,
      provinceDesc: json['address.provinceDesc'] as String?,
      roadDesc: json['address.roadDesc'] as String?,
      subdistrictDesc: json['address.subdistrictDesc'] as String?,
      villageNo: json['address.villageNo'] as String?,
      birthDate: json['birthDate'] as String?,
      blood: json['blood'] as String?,
      cancelCause: json['cancelCause'] as String?,
      documentNumber: json['documentNumber'] as String?,
      expireDate: json['expireDate'] as String?,
      foreignCountry: json['foreignCountry'] as String?,
      foreignCountryCity: json['foreignCountryCity'] as String?,
      issueDate: json['issueDate'] as String?,
      issueTime: json['issueTime'] as String?,
      firstNameEN: json['nameEN.firstName'] as String?,
      lastNameEN: json['nameEN.lastName'] as String?,
      middleNameEN: json['nameEN.middleName'] as String?,
      titleEN: json['nameEN.title'] as String?,
      firstNameTH: json['nameTH.firstName'] as String?,
      lastNameTH: json['nameTH.lastName'] as String?,
      middleNameTH: json['nameTH.middleName'] as String?,
      titleTH: json['nameTH.title'] as String?,
      religion: json['religion'] as String?,
      religionOther: json['religionOther'] as String?,
      sex: json['sex'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      personalID: json['personalID'] as String?,
    );

Map<String, dynamic> _$MakeCardLkDtoToJson(MakeCardLkDto instance) =>
    <String, dynamic>{
      'address.alleyDesc': instance.alleyDesc,
      'address.alleyWayDesc': instance.alleyWayDesc,
      'address.districtDesc': instance.districtDesc,
      'address.houseNo': instance.houseNo,
      'address.provinceDesc': instance.provinceDesc,
      'address.roadDesc': instance.roadDesc,
      'address.subdistrictDesc': instance.subdistrictDesc,
      'address.villageNo': instance.villageNo,
      'birthDate': instance.birthDate,
      'blood': instance.blood,
      'cancelCause': instance.cancelCause,
      'documentNumber': instance.documentNumber,
      'expireDate': instance.expireDate,
      'foreignCountry': instance.foreignCountry,
      'foreignCountryCity': instance.foreignCountryCity,
      'issueDate': instance.issueDate,
      'issueTime': instance.issueTime,
      'nameEN.firstName': instance.firstNameEN,
      'nameEN.lastName': instance.lastNameEN,
      'nameEN.middleName': instance.middleNameEN,
      'nameEN.title': instance.titleEN,
      'nameTH.firstName': instance.firstNameTH,
      'nameTH.lastName': instance.lastNameTH,
      'nameTH.middleName': instance.middleNameTH,
      'nameTH.title': instance.titleTH,
      'religion': instance.religion,
      'religionOther': instance.religionOther,
      'sex': instance.sex,
      'phoneNumber': instance.phoneNumber,
      'personalID': instance.personalID,
    };

ListMakeCardLkDto _$ListMakeCardLkDtoFromJson(Map<String, dynamic> json) =>
    ListMakeCardLkDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MakeCardLkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListMakeCardLkDtoToJson(ListMakeCardLkDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
