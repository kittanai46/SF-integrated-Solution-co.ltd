import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response_dto.g.dart';

@JsonSerializable()
class CommonResponseDto with ApiStatusResponse {
  CommonResponseDto({this.data});

  factory CommonResponseDto.fromJson(Map<String, dynamic> json) => _$CommonResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommonResponseDtoToJson(this);

  @JsonKey(name: 'data') final String? data;

}