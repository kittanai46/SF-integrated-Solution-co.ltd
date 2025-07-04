import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../dto/outer/immigration/extension_dto.dart';

part 'extension_response_dto.g.dart';

@JsonSerializable()
class ExtensionResponseDto with ApiStatusResponse{
  ExtensionResponseDto({
    this.listExtensionDto,
  });

  factory ExtensionResponseDto.fromJson(Map<String, dynamic> json) => _$ExtensionResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ExtensionResponseDtoToJson(this);

  @JsonKey(name: 'list_extension') ListExtensionDto? listExtensionDto;

}