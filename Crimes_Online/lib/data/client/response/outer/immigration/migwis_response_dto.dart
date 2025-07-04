import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../dto/outer/immigration/person_migwis_dto.dart';

part 'migwis_response_dto.g.dart';

@JsonSerializable()
class MigwisResponseDto with ApiStatusResponse {
  MigwisResponseDto({
    this.listMigwisDto,
  });

  factory MigwisResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MigwisResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MigwisResponseDtoToJson(this);

  @JsonKey(name: 'list_migwis')
  ListMigwisDto? listMigwisDto;
}
