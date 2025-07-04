import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/warrant/warrant_dto.dart';

part 'get_warrant_response_dto.g.dart';

@JsonSerializable()
class GetWarrantResponseDto with ApiStatusResponse{
  GetWarrantResponseDto({
    this.listWarrant,
  });

  factory GetWarrantResponseDto.fromJson(Map<String, dynamic> json) => _$GetWarrantResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetWarrantResponseDtoToJson(this);

  @JsonKey(name: 'list_warrant') ListWarrantDto? listWarrant;

}