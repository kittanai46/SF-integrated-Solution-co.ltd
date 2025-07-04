import 'package:json_annotation/json_annotation.dart';

part 'database_dto.g.dart';

@JsonSerializable()
class DatabaseDto {
  DatabaseDto({this.title, this.checked, this.category, this.enable = false, this.hintKeyword = "โปรดระบุ"});

  factory DatabaseDto.fromJson(Map<String, dynamic> json) => _$DatabaseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DatabaseDtoToJson(this);

  @JsonKey(name: 'title') String? title;

  bool? checked;
  String? category;
  bool enable;
  String hintKeyword;
}