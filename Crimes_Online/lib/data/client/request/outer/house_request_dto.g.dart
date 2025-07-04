// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseRequestDto _$HouseRequestDtoFromJson(Map<String, dynamic> json) =>
    HouseRequestDto(
      houseno: json['houseno'] as String?,
      moo: json['moo'] as String?,
      lane: json['lane'] as String?,
      soiCode: json['SoiCode'] as String?,
      roadCode: json['RoadCode'] as String?,
      tambonCode: json['TambonCode'] as String?,
      amphurCode: json['AmphurCode'] as String?,
      provinceCode: json['ProvinceCode'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HouseRequestDtoToJson(HouseRequestDto instance) =>
    <String, dynamic>{
      'houseno': instance.houseno,
      'moo': instance.moo,
      'lane': instance.lane,
      'SoiCode': instance.soiCode,
      'RoadCode': instance.roadCode,
      'TambonCode': instance.tambonCode,
      'AmphurCode': instance.amphurCode,
      'ProvinceCode': instance.provinceCode,
      'lat': instance.lat,
      'lon': instance.lon,
    };
