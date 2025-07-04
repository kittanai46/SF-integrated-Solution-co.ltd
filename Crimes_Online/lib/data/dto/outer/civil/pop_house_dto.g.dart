// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pop_house_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopHouseDto _$PopHouseDtoFromJson(Map<String, dynamic> json) => PopHouseDto(
      pID: json['PID'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      gender: json['Gender'] as String?,
      birthDate: json['BirthDate'] as String?,
      houseID: json['HouseID'] as String?,
    );

Map<String, dynamic> _$PopHouseDtoToJson(PopHouseDto instance) =>
    <String, dynamic>{
      'PID': instance.pID,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Gender': instance.gender,
      'BirthDate': instance.birthDate,
      'HouseID': instance.houseID,
    };

ListPopHouseDto _$ListPopHouseDtoFromJson(Map<String, dynamic> json) =>
    ListPopHouseDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PopHouseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPopHouseDtoToJson(ListPopHouseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
