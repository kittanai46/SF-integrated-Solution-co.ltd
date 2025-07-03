import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/inner/warrant/warrantcrd_dto.dart';


part 'get_warrant_crd_response_dto.g.dart';

@JsonSerializable()
class GetWarrantCRDResponseDto with ApiStatusResponse{
  GetWarrantCRDResponseDto({
    this.listWarrant,
  });

  factory GetWarrantCRDResponseDto.fromJson(Map<String, dynamic> json) => _$GetWarrantCRDResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GetWarrantCRDResponseDtoToJson(this);

  @JsonKey(name: 'list_warrant') ListWarrantCRDDto? listWarrant;

}