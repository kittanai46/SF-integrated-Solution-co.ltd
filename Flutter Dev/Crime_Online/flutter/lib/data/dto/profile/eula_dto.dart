import 'package:json_annotation/json_annotation.dart';

part 'eula_dto.g.dart';

@JsonSerializable()
class EulaDto {
  EulaDto({
    this.url,
    this.version,
  });

  factory EulaDto.fromJson(Map<String, dynamic> json) => _$EulaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EulaDtoToJson(this);

  @JsonKey(name: 'url') String? url;
  @JsonKey(name: 'version') String? version;

}

@JsonSerializable()
class ListEulaDto {
  ListEulaDto({
    this.status,
    this.data,
  });

  factory ListEulaDto.fromJson(Map<String, dynamic> json) => _$ListEulaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListEulaDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<EulaDto>? data;
}