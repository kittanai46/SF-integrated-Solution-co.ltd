// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_noregis_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonNoRegisDto _$PersonNoRegisDtoFromJson(Map<String, dynamic> json) =>
    PersonNoRegisDto(
      personalID: json['personalID'] as String?,
      address_houseAlley: json['address.houseAlley'] as String?,
      address_houseAlleyWay: json['address.houseAlleyWay'] as String?,
      address_houseDistrict: json['address.houseDistrict'] as String?,
      address_houseNo: json['address.houseNo'] as String?,
      address_houseProvince: json['address.houseProvince'] as String?,
      address_houseRoad: json['address.houseRoad'] as String?,
      address_houseSubDistrict: json['address.houseSubDistrict'] as String?,
      address_houseVillageNo: json['address.houseVillageNo'] as String?,
      cardExpireDate: json['cardExpireDate'] as String?,
      cardIssueDate: json['cardIssueDate'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      firstName: json['firstName'] as String?,
      genderText: json['genderText'] as String?,
      lastName: json['lastName'] as String?,
      nationalityCode: json['nationalityCode'] as String?,
      nationalityText: json['nationalityText'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$PersonNoRegisDtoToJson(PersonNoRegisDto instance) =>
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
      'cardExpireDate': instance.cardExpireDate,
      'cardIssueDate': instance.cardIssueDate,
      'dateOfBirth': instance.dateOfBirth,
      'firstName': instance.firstName,
      'genderText': instance.genderText,
      'lastName': instance.lastName,
      'nationalityCode': instance.nationalityCode,
      'nationalityText': instance.nationalityText,
      'title': instance.title,
    };

ListPersonNoRegisDto _$ListPersonNoRegisDtoFromJson(
        Map<String, dynamic> json) =>
    ListPersonNoRegisDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PersonNoRegisDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPersonNoRegisDtoToJson(
        ListPersonNoRegisDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
