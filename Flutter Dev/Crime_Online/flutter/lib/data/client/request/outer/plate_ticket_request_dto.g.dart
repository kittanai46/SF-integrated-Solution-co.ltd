// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_ticket_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlateTicketRequestDto _$PlateTicketRequestDtoFromJson(
        Map<String, dynamic> json) =>
    PlateTicketRequestDto(
      pid: json['pid'] as String?,
      plate1: json['plate1'] as String?,
      plate2: json['plate2'] as String?,
      plate3: json['plate3'] as String?,
      ticketId: json['ticket_id'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlateTicketRequestDtoToJson(
        PlateTicketRequestDto instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'plate1': instance.plate1,
      'plate2': instance.plate2,
      'plate3': instance.plate3,
      'ticket_id': instance.ticketId,
      'lat': instance.lat,
      'lon': instance.lon,
    };
