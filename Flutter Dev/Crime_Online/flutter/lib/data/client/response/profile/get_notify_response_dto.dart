import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/profile/notify_dto.dart';

part 'get_notify_response_dto.g.dart';

@JsonSerializable()
class GetNotifyResponseDto with ApiStatusResponse{
  GetNotifyResponseDto({
    this.listNotifyDto,
  });

  factory GetNotifyResponseDto.fromJson(Map<String, dynamic> json) => _$GetNotifyResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetNotifyResponseDtoToJson(this);

  @JsonKey(name: 'list_notify') ListNotifyDto? listNotifyDto;

}