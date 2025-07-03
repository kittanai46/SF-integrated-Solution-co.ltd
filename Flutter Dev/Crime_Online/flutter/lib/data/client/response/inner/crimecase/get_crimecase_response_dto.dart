import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/crimecase/crimecase_dto.dart';

part 'get_crimecase_response_dto.g.dart';

@JsonSerializable()
class GetCrimeCaseResponseDto with ApiStatusResponse{
  GetCrimeCaseResponseDto({
    this.listCrimeCase,
  });

  factory GetCrimeCaseResponseDto.fromJson(Map<String, dynamic> json) => _$GetCrimeCaseResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetCrimeCaseResponseDtoToJson(this);

  @JsonKey(name: 'list_crimecase') ListCrimeCaseDto? listCrimeCase;

}