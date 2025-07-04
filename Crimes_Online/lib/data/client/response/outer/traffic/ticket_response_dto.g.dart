// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponseDto _$TicketResponseDtoFromJson(Map<String, dynamic> json) =>
    TicketResponseDto(
      listTicketDto: json['list_ticket'] == null
          ? null
          : ListTicketDto.fromJson(json['list_ticket'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TicketResponseDtoToJson(TicketResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_ticket': instance.listTicketDto,
    };
