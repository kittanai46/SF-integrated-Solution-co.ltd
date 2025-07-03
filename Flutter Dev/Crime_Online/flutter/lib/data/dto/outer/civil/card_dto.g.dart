// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDto _$CardDtoFromJson(Map<String, dynamic> json) => CardDto(
      pB1Number: json['PB1Number'] as String?,
      pB1CreateDate: json['PB1CreateDate'] as String?,
    );

Map<String, dynamic> _$CardDtoToJson(CardDto instance) => <String, dynamic>{
      'PB1Number': instance.pB1Number,
      'PB1CreateDate': instance.pB1CreateDate,
    };

ListCardDto _$ListCardDtoFromJson(Map<String, dynamic> json) => ListCardDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCardDtoToJson(ListCardDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
