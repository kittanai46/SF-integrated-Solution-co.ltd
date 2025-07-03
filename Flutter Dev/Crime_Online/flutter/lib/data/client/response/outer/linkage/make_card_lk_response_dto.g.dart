// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_card_lk_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeCardLkResponseDto _$MakeCardLkResponseDtoFromJson(
        Map<String, dynamic> json) =>
    MakeCardLkResponseDto(
      listMakeCardLkDto: json['list_make_card_lk'] == null
          ? null
          : ListMakeCardLkDto.fromJson(
              json['list_make_card_lk'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MakeCardLkResponseDtoToJson(
        MakeCardLkResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_make_card_lk': instance.listMakeCardLkDto,
    };
