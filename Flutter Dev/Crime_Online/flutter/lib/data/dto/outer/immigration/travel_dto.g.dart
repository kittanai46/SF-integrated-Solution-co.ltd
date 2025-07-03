// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelDto _$TravelDtoFromJson(Map<String, dynamic> json) => TravelDto(
      tMRunNo: json['TMRunNo'] as String?,
      passportNo: json['PassportNo'] as String?,
      travelDate: json['TravelDate'] as String?,
      travelType: json['TravelType'] as String?,
      eFullname: json['EFullname'] as String?,
      sex: json['Sex'] as String?,
      nationENM: json['NationENM'] as String?,
      birthDate: json['BirthDate'] as String?,
      tM6No: json['TM6No'] as String?,
      isInputPassport: json['isInputPassport'] as bool?,
    );

Map<String, dynamic> _$TravelDtoToJson(TravelDto instance) => <String, dynamic>{
      'TMRunNo': instance.tMRunNo,
      'PassportNo': instance.passportNo,
      'TravelDate': instance.travelDate,
      'TravelType': instance.travelType,
      'EFullname': instance.eFullname,
      'Sex': instance.sex,
      'NationENM': instance.nationENM,
      'BirthDate': instance.birthDate,
      'TM6No': instance.tM6No,
      'isInputPassport': instance.isInputPassport,
    };

ListTravelDto _$ListTravelDtoFromJson(Map<String, dynamic> json) =>
    ListTravelDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TravelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTravelDtoToJson(ListTravelDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
