import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/social/employer_dto.dart';

part 'employer_response_dto.g.dart';

@JsonSerializable()
class EmployerResponseDto with ApiStatusResponse{
  EmployerResponseDto({
    this.listEmployerDto,
  });

  factory EmployerResponseDto.fromJson(Map<String, dynamic> json) => _$EmployerResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EmployerResponseDtoToJson(this);

  @JsonKey(name: 'list_employer') ListEmployerDto? listEmployerDto;

}