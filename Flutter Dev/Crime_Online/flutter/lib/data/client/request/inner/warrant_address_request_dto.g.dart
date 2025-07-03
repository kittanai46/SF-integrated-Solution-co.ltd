// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrant_address_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantAddressRequestDto _$WarrantAddressRequestDtoFromJson(
        Map<String, dynamic> json) =>
    WarrantAddressRequestDto(
      conType: json['con_type'] as String?,
      province: json['province'] as String?,
      amphur: json['amphur'] as String?,
      tambon: json['tambon'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WarrantAddressRequestDtoToJson(
        WarrantAddressRequestDto instance) =>
    <String, dynamic>{
      'con_type': instance.conType,
      'province': instance.province,
      'amphur': instance.amphur,
      'tambon': instance.tambon,
      'lat': instance.lat,
      'lon': instance.lon,
    };
