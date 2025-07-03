import 'package:json_annotation/json_annotation.dart';

part 'acc_request_dto.g.dart';

@JsonSerializable()
class AccRequestDto {
  AccRequestDto({
    this.accno,
    this.accbranch,this.lat,this.lon
  });

  factory AccRequestDto.fromJson(Map<String, dynamic> json) => _$AccRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AccRequestDtoToJson(this);

  @JsonKey(name: 'accno') String? accno;
  @JsonKey(name: 'accbranch') String? accbranch;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}