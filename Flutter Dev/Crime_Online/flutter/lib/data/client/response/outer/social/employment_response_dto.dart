import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/social/employment_dto.dart';

part 'employment_response_dto.g.dart';

@JsonSerializable()
class EmploymentResponseDto with ApiStatusResponse{
  EmploymentResponseDto({
    this.listEmploymentDto,
  });

  factory EmploymentResponseDto.fromJson(Map<String, dynamic> json) => _$EmploymentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EmploymentResponseDtoToJson(this);

  @JsonKey(name: 'list_employment') ListEmploymentDto? listEmploymentDto;

}