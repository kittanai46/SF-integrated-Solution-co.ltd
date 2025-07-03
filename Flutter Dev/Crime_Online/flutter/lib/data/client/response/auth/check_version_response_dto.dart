import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_version_response_dto.g.dart';

@JsonSerializable()
class CheckVersionResponseDto  with ApiStatusResponse {
  CheckVersionResponseDto({this.result});

  factory CheckVersionResponseDto.fromJson(Map<String, dynamic> json) => _$CheckVersionResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CheckVersionResponseDtoToJson(this);

  @JsonKey(name: 'result') String? result;
  @JsonKey(name: 'app_store_id') String? appStoreId;
}