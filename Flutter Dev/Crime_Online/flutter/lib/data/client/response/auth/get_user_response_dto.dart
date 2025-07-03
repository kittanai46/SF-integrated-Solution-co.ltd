import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/profile/user_dto.dart';

part 'get_user_response_dto.g.dart';

@JsonSerializable()
class GetUserResponseDto with ApiStatusResponse{
  GetUserResponseDto({
    this.user,
  });

  factory GetUserResponseDto.fromJson(Map<String, dynamic> json) => _$GetUserResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetUserResponseDtoToJson(this);

  @JsonKey(name: 'user') UserDto? user;

}