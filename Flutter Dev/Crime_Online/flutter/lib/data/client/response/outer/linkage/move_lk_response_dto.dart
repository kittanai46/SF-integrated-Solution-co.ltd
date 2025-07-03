import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:crimes/data/dto/outer/linkage/move_lk_dto.dart';

part 'move_lk_response_dto.g.dart';

@JsonSerializable()
class MoveLkResponseDto with ApiStatusResponse{
  MoveLkResponseDto({
    this.listMoveLkDto,
  });

  factory MoveLkResponseDto.fromJson(Map<String, dynamic> json) => _$MoveLkResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MoveLkResponseDtoToJson(this);

  @JsonKey(name: 'list_move_lk') ListMoveLkDto? listMoveLkDto;

}