import 'package:json_annotation/json_annotation.dart';

part 'number_resident_dto.g.dart';

@JsonSerializable()
class NumberResidentDto {
  NumberResidentDto({
    this.status,
    this.count,
  });

  factory NumberResidentDto.fromJson(Map<String, dynamic> json) => _$NumberResidentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NumberResidentDtoToJson(this);

  @JsonKey(name: 'Status') String? status;
  @JsonKey(name: 'Count') String? count;

}

@JsonSerializable()
class ListNumberResidentDto {
  ListNumberResidentDto({
    this.status,
    this.data,
  });

  factory ListNumberResidentDto.fromJson(Map<String, dynamic> json) => _$ListNumberResidentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListNumberResidentDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<NumberResidentDto>? data;
}

class NumberResidentConstant {
  NumberResidentConstant._();

  static const String m_status = 'สถานะการค้น';
  static const String m_count = 'จำนวนคนในบ้าน';
}