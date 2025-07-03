// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_inhouse_lk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInHouseLkDto _$PersonInHouseLkDtoFromJson(Map<String, dynamic> json) =>
    PersonInHouseLkDto(
      age: json['personalInHouse.age'] as String?,
      fullName: json['personalInHouse.fullName'] as String?,
      gender: json['personalInHouse.gender'] as String?,
      personalID: json['personalInHouse.personalID'] as String?,
      statusOfPersonDesc: json['personalInHouse.statusOfPersonDesc'] as String?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PersonInHouseLkDtoToJson(PersonInHouseLkDto instance) =>
    <String, dynamic>{
      'personalInHouse.age': instance.age,
      'personalInHouse.fullName': instance.fullName,
      'personalInHouse.gender': instance.gender,
      'personalInHouse.personalID': instance.personalID,
      'personalInHouse.statusOfPersonDesc': instance.statusOfPersonDesc,
      'total': instance.total,
    };

ListPersonInHouseLkDto _$ListPersonInHouseLkDtoFromJson(
        Map<String, dynamic> json) =>
    ListPersonInHouseLkDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PersonInHouseLkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPersonInHouseLkDtoToJson(
        ListPersonInHouseLkDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
