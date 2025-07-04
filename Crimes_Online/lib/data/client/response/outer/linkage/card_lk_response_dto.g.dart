// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_lk_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardLkResponseDto _$CardLkResponseDtoFromJson(Map<String, dynamic> json) =>
    CardLkResponseDto(
      listCardLkDto: json['list_card_lk'] == null
          ? null
          : ListCardLkDto.fromJson(
              json['list_card_lk'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CardLkResponseDtoToJson(CardLkResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_card_lk': instance.listCardLkDto,
    };
