import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_request_dto.g.dart';

@JsonSerializable()
class CommonRequestDto {
  CommonRequestDto();

  factory CommonRequestDto.fromJson(Map<String, dynamic> json) => _$CommonRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommonRequestDtoToJson(this);

}