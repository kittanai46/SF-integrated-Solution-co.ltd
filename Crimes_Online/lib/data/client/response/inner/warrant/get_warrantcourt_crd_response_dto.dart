import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/warrant/warrantcourtcrd_dto.dart';


part 'get_warrantcourt_crd_response_dto.g.dart';

@JsonSerializable()
class GetWarrantCourtCRDResponseDto with ApiStatusResponse{
  GetWarrantCourtCRDResponseDto({
    this.listWarrant,
  });

  factory GetWarrantCourtCRDResponseDto.fromJson(Map<String, dynamic> json) => _$GetWarrantCourtCRDResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetWarrantCourtCRDResponseDtoToJson(this);

  @JsonKey(name: 'list_warrant') ListWarrantCourtCRDDto? listWarrant;

}