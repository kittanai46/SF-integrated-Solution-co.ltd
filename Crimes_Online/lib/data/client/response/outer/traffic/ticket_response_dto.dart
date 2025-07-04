import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/traffic/ticket_dto.dart';

part 'ticket_response_dto.g.dart';

@JsonSerializable()
class TicketResponseDto with ApiStatusResponse{
  TicketResponseDto({
    this.listTicketDto,
  });

  factory TicketResponseDto.fromJson(Map<String, dynamic> json) => _$TicketResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TicketResponseDtoToJson(this);

  @JsonKey(name: 'list_ticket') ListTicketDto? listTicketDto;

}