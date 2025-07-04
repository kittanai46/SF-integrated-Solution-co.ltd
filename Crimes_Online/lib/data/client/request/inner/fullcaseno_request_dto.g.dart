// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fullcaseno_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullcaseNoRequestDto _$FullcaseNoRequestDtoFromJson(
        Map<String, dynamic> json) =>
    FullcaseNoRequestDto(
      orgCode: json['orgcode'] as String?,
      crimeCaseYear: json['crimecaseyear'] as String?,
      crimeCaseNo: json['crimecaseno'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FullcaseNoRequestDtoToJson(
        FullcaseNoRequestDto instance) =>
    <String, dynamic>{
      'orgcode': instance.orgCode,
      'crimecaseyear': instance.crimeCaseYear,
      'crimecaseno': instance.crimeCaseNo,
      'lat': instance.lat,
      'lon': instance.lon,
    };
