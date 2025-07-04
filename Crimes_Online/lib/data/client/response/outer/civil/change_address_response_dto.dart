import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/change_address_dto.dart';

part 'change_address_response_dto.g.dart';

@JsonSerializable()
class ChangeAddressResponseDto with ApiStatusResponse{
  ChangeAddressResponseDto({
    this.listChangeAddressDto,
  });

  factory ChangeAddressResponseDto.fromJson(Map<String, dynamic> json) => _$ChangeAddressResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeAddressResponseDtoToJson(this);

  @JsonKey(name: 'list_change_address') ListChangeAddressDto? listChangeAddressDto;

}