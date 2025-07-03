// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lk2_group1_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lk2Group1Dto _$Lk2Group1DtoFromJson(Map<String, dynamic> json) => Lk2Group1Dto(
      listPersonLkDto: json['personInfo'] == null
          ? null
          : ListPersonLkDto.fromJson(
              json['personInfo'] as Map<String, dynamic>),
      listImageDto: json['imageInfo'] == null
          ? null
          : ListImageDto.fromJson(json['imageInfo'] as Map<String, dynamic>),
      listHouseLkDto: json['houseInfo'] == null
          ? null
          : ListHouseLkDto.fromJson(json['houseInfo'] as Map<String, dynamic>),
      listCardInfo: json['cardInfo'] == null
          ? null
          : ListMakeCardLkDto.fromJson(
              json['cardInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Lk2Group1DtoToJson(Lk2Group1Dto instance) =>
    <String, dynamic>{
      'personInfo': instance.listPersonLkDto,
      'imageInfo': instance.listImageDto,
      'houseInfo': instance.listHouseLkDto,
      'cardInfo': instance.listCardInfo,
    };

ListLk2Group1Dto _$ListLk2Group1DtoFromJson(Map<String, dynamic> json) =>
    ListLk2Group1Dto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Lk2Group1Dto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListLk2Group1DtoToJson(ListLk2Group1Dto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
