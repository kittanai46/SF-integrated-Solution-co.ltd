// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_lk_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveLkResponseDto _$MoveLkResponseDtoFromJson(Map<String, dynamic> json) =>
    MoveLkResponseDto(
      listMoveLkDto: json['list_move_lk'] == null
          ? null
          : ListMoveLkDto.fromJson(
              json['list_move_lk'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MoveLkResponseDtoToJson(MoveLkResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_move_lk': instance.listMoveLkDto,
    };
