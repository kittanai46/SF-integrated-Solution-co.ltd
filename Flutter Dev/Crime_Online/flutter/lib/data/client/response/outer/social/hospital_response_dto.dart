import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/social/hospital_dto.dart';

part 'hospital_response_dto.g.dart';

@JsonSerializable()
class HospitalResponseDto with ApiStatusResponse{
  HospitalResponseDto({
    this.listHospitalDto,
  });

  factory HospitalResponseDto.fromJson(Map<String, dynamic> json) => _$HospitalResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalResponseDtoToJson(this);

  @JsonKey(name: 'list_hospital') ListHospitalDto? listHospitalDto;

}