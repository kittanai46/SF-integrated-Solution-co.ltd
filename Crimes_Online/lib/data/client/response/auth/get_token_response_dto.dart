import 'package:crimes/data/common/api_status_response.dart';
import 'package:crimes/data/dto/profile/authsoc_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_token_response_dto.g.dart';

@JsonSerializable()
class GetTokenResponseDto with ApiStatusResponse{
  GetTokenResponseDto({
    this.url,
    this.baseUrl,
  });

  factory GetTokenResponseDto.fromJson(Map<String, dynamic> json) => _$GetTokenResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetTokenResponseDtoToJson(this);

  @JsonKey(name: 'url') String? url;
  @JsonKey(name: 'base_url') String? baseUrl;


}