// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_visa_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelVisaDto _$TravelVisaDtoFromJson(Map<String, dynamic> json) =>
    TravelVisaDto(
      visatypenm: json['Visatypenm'] as String?,
      convregno: json['Convregno'] as String?,
      conveyance: json['Conveyance'] as String?,
      depttnm: json['Depttnm'] as String?,
      efirstnm: json['Efirstnm'] as String?,
      emiddlenm: json['Emiddlenm'] as String?,
      efamilynm: json['Efamilynm'] as String?,
      tfirstnm: json['Tfirstnm'] as String?,
      tmiddlenm: json['Tmiddlenm'] as String?,
      tfamilynm: json['Tfamilynm'] as String?,
      img: json['Img'] as String?,
    );

Map<String, dynamic> _$TravelVisaDtoToJson(TravelVisaDto instance) =>
    <String, dynamic>{
      'Visatypenm': instance.visatypenm,
      'Convregno': instance.convregno,
      'Conveyance': instance.conveyance,
      'Depttnm': instance.depttnm,
      'Efirstnm': instance.efirstnm,
      'Emiddlenm': instance.emiddlenm,
      'Efamilynm': instance.efamilynm,
      'Tfirstnm': instance.tfirstnm,
      'Tmiddlenm': instance.tmiddlenm,
      'Tfamilynm': instance.tfamilynm,
      'Img': instance.img,
    };

ListTravelVisaDto _$ListTravelVisaDtoFromJson(Map<String, dynamic> json) =>
    ListTravelVisaDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TravelVisaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTravelVisaDtoToJson(ListTravelVisaDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
