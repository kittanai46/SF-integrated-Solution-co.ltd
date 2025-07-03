// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardResponseDto _$CardResponseDtoFromJson(Map<String, dynamic> json) =>
    CardResponseDto(
      listCardDto: json['list_card'] == null
          ? null
          : ListCardDto.fromJson(json['list_card'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CardResponseDtoToJson(CardResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_card': instance.listCardDto,
    };
