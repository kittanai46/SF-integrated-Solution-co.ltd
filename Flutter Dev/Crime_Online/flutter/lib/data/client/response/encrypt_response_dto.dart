import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'encrypt_response_dto.g.dart';

@JsonSerializable()
class EncryptResponseDto with ApiStatusResponse{
  EncryptResponseDto({required this.data, required this.nonce});

  factory EncryptResponseDto.fromJson(Map<String, dynamic> json) => _$EncryptResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EncryptResponseDtoToJson(this);

  @JsonKey(name: 'data') final String data;
  @JsonKey(name: 'nonce') final String nonce;
}