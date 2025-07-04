// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_lk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardLkDto _$CardLkDtoFromJson(Map<String, dynamic> json) => CardLkDto(
      documentNumber: json['documentNumber'] as String?,
      firstName: json['firstName'] as String?,
      issueDate: json['issueDate'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$CardLkDtoToJson(CardLkDto instance) => <String, dynamic>{
      'documentNumber': instance.documentNumber,
      'firstName': instance.firstName,
      'issueDate': instance.issueDate,
      'lastName': instance.lastName,
    };

ListCardLkDto _$ListCardLkDtoFromJson(Map<String, dynamic> json) =>
    ListCardLkDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CardLkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCardLkDtoToJson(ListCardLkDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
