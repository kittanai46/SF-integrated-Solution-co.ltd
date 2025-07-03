import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/person_inhouse_lk_dto.dart';

part 'person_inhouse_lk_response_dto.g.dart';

@JsonSerializable()
class PersonInHouseLkResponseDto with ApiStatusResponse{
  PersonInHouseLkResponseDto({
    this.listPersonInHouseLkDto,
  });

  factory PersonInHouseLkResponseDto.fromJson(Map<String, dynamic> json) => _$PersonInHouseLkResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonInHouseLkResponseDtoToJson(this);

  @JsonKey(name: 'list_person_inhouse_lk') ListPersonInHouseLkDto? listPersonInHouseLkDto;

}