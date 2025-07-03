import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/civil/number_resident_dto.dart';

part 'number_resident_response_dto.g.dart';

@JsonSerializable()
class NumberResidentResponseDto with ApiStatusResponse{
  NumberResidentResponseDto({
    this.listNumberResidentDto,
  });

  factory NumberResidentResponseDto.fromJson(Map<String, dynamic> json) => _$NumberResidentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NumberResidentResponseDtoToJson(this);

  @JsonKey(name: 'list_number_resident') ListNumberResidentDto? listNumberResidentDto;

}