import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/warrant/rednotice_dto.dart';


part 'get_rednotice_response_dto.g.dart';

@JsonSerializable()
class GetRedNoticeResponseDto with ApiStatusResponse{
  GetRedNoticeResponseDto({
    this.listWarrant,
  });

  factory GetRedNoticeResponseDto.fromJson(Map<String, dynamic> json) => _$GetRedNoticeResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetRedNoticeResponseDtoToJson(this);

  @JsonKey(name: 'list_warrant') ListRedNoticeDto? listWarrant;

}