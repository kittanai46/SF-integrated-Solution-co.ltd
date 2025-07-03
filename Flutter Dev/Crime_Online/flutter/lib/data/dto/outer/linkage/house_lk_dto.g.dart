// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_lk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseLkDto _$HouseLkDtoFromJson(Map<String, dynamic> json) => HouseLkDto(
      alleyCode: json['alleyCode'] as String?,
      alleyDesc: json['alleyDesc'] as String?,
      alleyWayCode: json['alleyWayCode'] as String?,
      alleyWayDesc: json['alleyWayDesc'] as String?,
      dateOfTerminate: json['dateOfTerminate'] as String?,
      districtCode: json['districtCode'] as String?,
      districtDesc: json['districtDesc'] as String?,
      houseID: json['houseID'] as String?,
      houseNo: json['houseNo'] as String?,
      houseType: json['houseType'] as String?,
      houseTypeDesc: json['houseTypeDesc'] as String?,
      provinceCode: json['provinceCode'] as String?,
      provinceDesc: json['provinceDesc'] as String?,
      rcodeCode: json['rcodeCode'] as String?,
      rcodeDesc: json['rcodeDesc'] as String?,
      roadCode: json['roadCode'] as String?,
      roadDesc: json['roadDesc'] as String?,
      subdistrictCode: json['subdistrictCode'] as String?,
      subdistrictDesc: json['subdistrictDesc'] as String?,
      villageNo: json['villageNo'] as String?,
    );

Map<String, dynamic> _$HouseLkDtoToJson(HouseLkDto instance) =>
    <String, dynamic>{
      'alleyCode': instance.alleyCode,
      'alleyDesc': instance.alleyDesc,
      'alleyWayCode': instance.alleyWayCode,
      'alleyWayDesc': instance.alleyWayDesc,
      'dateOfTerminate': instance.dateOfTerminate,
      'districtCode': instance.districtCode,
      'districtDesc': instance.districtDesc,
      'houseID': instance.houseID,
      'houseNo': instance.houseNo,
      'houseType': instance.houseType,
      'houseTypeDesc': instance.houseTypeDesc,
      'provinceCode': instance.provinceCode,
      'provinceDesc': instance.provinceDesc,
      'rcodeCode': instance.rcodeCode,
      'rcodeDesc': instance.rcodeDesc,
      'roadCode': instance.roadCode,
      'roadDesc': instance.roadDesc,
      'subdistrictCode': instance.subdistrictCode,
      'subdistrictDesc': instance.subdistrictDesc,
      'villageNo': instance.villageNo,
    };

ListHouseLkDto _$ListHouseLkDtoFromJson(Map<String, dynamic> json) =>
    ListHouseLkDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HouseLkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHouseLkDtoToJson(ListHouseLkDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
