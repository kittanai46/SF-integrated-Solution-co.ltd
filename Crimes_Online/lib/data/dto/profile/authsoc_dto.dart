import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authsoc_dto.g.dart';

@JsonSerializable()
class AuthSocDto {
  AuthSocDto({
    this.status,
    this.message,
    this.token,
    this.url,

  });

  factory AuthSocDto.fromJson(Map<String, dynamic> json) => _$AuthSocDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthSocDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'message') String? message;
  @JsonKey(name: 'token') String? token;
  @JsonKey(name: 'url') String? url;

}

// AuthSocDto _$AuthSocDtoFromJson(Map<String, dynamic> json) {
//   return AuthSocDto(
//     status: json['status'] as String?,
//     message: json['message'] as String?,
//     token: json['token'] as String?,
//     url: json['url'] as String?,
//   );
// }
//
//
// Map<String, dynamic> _$AuthSocDtoToJson(AuthSocDto instance) => <String, dynamic>{
//   'status': instance.status,
//   'message': instance.message,
//   'token': instance.token,
//   'url': instance.url,
//
// };
