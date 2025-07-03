// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_nonthai_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonNonThaiDto _$PersonNonThaiDtoFromJson(Map<String, dynamic> json) =>
    PersonNonThaiDto(
      personalID: json['personalID'] as String?,
      address_houseAlley: json['address.houseAlley'] as String?,
      address_houseAlleyWay: json['address.houseAlleyWay'] as String?,
      address_houseDistrict: json['address.houseDistrict'] as String?,
      address_houseNo: json['address.houseNo'] as String?,
      address_houseProvince: json['address.houseProvince'] as String?,
      address_houseRoad: json['address.houseRoad'] as String?,
      address_houseSubDistrict: json['address.houseSubDistrict'] as String?,
      address_houseVillageNo: json['address.houseVillageNo'] as String?,
      blood: json['blood'] as String?,
      cardExpireDate: json['cardExpireDate'] as String?,
      cardIssueDate: json['cardIssueDate'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      genderText: json['genderText'] as String?,
      nameEN_firstName: json['nameEN.firstName'] as String?,
      nameEN_lastName: json['nameEN.lastName'] as String?,
      nameEN_middleName: json['nameEN.middleName'] as String?,
      nameEN_title: json['nameEN.title'] as String?,
      nameTH_firstName: json['nameTH.firstName'] as String?,
      nameTH_lastName: json['nameTH.lastName'] as String?,
      nameTH_middleName: json['nameTH.middleName'] as String?,
      nameTH_title: json['nameTH.title'] as String?,
      nationalityCode: json['nationalityCode'] as String?,
      nationalityText: json['nationalityText'] as String?,
    );

Map<String, dynamic> _$PersonNonThaiDtoToJson(PersonNonThaiDto instance) =>
    <String, dynamic>{
      'personalID': instance.personalID,
      'address.houseAlley': instance.address_houseAlley,
      'address.houseAlleyWay': instance.address_houseAlleyWay,
      'address.houseDistrict': instance.address_houseDistrict,
      'address.houseNo': instance.address_houseNo,
      'address.houseProvince': instance.address_houseProvince,
      'address.houseRoad': instance.address_houseRoad,
      'address.houseSubDistrict': instance.address_houseSubDistrict,
      'address.houseVillageNo': instance.address_houseVillageNo,
      'blood': instance.blood,
      'cardExpireDate': instance.cardExpireDate,
      'cardIssueDate': instance.cardIssueDate,
      'dateOfBirth': instance.dateOfBirth,
      'genderText': instance.genderText,
      'nameEN.firstName': instance.nameEN_firstName,
      'nameEN.lastName': instance.nameEN_lastName,
      'nameEN.middleName': instance.nameEN_middleName,
      'nameEN.title': instance.nameEN_title,
      'nameTH.firstName': instance.nameTH_firstName,
      'nameTH.lastName': instance.nameTH_lastName,
      'nameTH.middleName': instance.nameTH_middleName,
      'nameTH.title': instance.nameTH_title,
      'nationalityCode': instance.nationalityCode,
      'nationalityText': instance.nationalityText,
    };

ListPersonNonThaiDto _$ListPersonNonThaiDtoFromJson(
        Map<String, dynamic> json) =>
    ListPersonNonThaiDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PersonNonThaiDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPersonNonThaiDtoToJson(
        ListPersonNonThaiDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
