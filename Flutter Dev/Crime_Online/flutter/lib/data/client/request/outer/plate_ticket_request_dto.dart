import 'package:json_annotation/json_annotation.dart';

part 'plate_ticket_request_dto.g.dart';

@JsonSerializable()
class PlateTicketRequestDto {
  PlateTicketRequestDto({
    this.pid,
    this.plate1,
    this.plate2,
    this.plate3,
    this.ticketId,this.lat,this.lon
  });

  factory PlateTicketRequestDto.fromJson(Map<String, dynamic> json) => _$PlateTicketRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlateTicketRequestDtoToJson(this);

  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'plate1') String? plate1;
  @JsonKey(name: 'plate2') String? plate2;
  @JsonKey(name: 'plate3') String? plate3;
  @JsonKey(name: 'ticket_id') String? ticketId;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}