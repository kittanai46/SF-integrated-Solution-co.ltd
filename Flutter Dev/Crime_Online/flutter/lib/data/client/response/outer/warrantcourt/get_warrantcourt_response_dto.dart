import 'package:crimes/data/common/api_status_response.dart';
import 'package:crimes/data/dto/outer/warrantcourt/warrantcourt_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_warrantcourt_response_dto.g.dart';

@JsonSerializable()
class GetWarrantCourtResponseDto with ApiStatusResponse{
  GetWarrantCourtResponseDto({
    this.listWarrantCourt,
  });

  factory GetWarrantCourtResponseDto.fromJson(Map<String, dynamic> json) => _$GetWarrantCourtResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetWarrantCourtResponseDtoToJson(this);

  @JsonKey(name: 'list_warrant_court') ListWarrantCourtDto? listWarrantCourt;

}