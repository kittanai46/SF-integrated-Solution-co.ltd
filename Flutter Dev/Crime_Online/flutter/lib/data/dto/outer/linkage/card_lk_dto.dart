import 'package:json_annotation/json_annotation.dart';

part 'card_lk_dto.g.dart';

@JsonSerializable()
class CardLkDto {
  CardLkDto({
    this.documentNumber,
    this.firstName,
    this.issueDate,
    this.lastName,
  });

  factory CardLkDto.fromJson(Map<String, dynamic> json) => _$CardLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CardLkDtoToJson(this);
 
  @JsonKey(name: 'documentNumber') String? documentNumber;
  @JsonKey(name: 'firstName') String? firstName;
  @JsonKey(name: 'issueDate') String? issueDate;
  @JsonKey(name: 'lastName') String? lastName;

}

@JsonSerializable()
class ListCardLkDto {
  ListCardLkDto({
    this.status,
    this.data,
  });

  factory ListCardLkDto.fromJson(Map<String, dynamic> json) => _$ListCardLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListCardLkDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<CardLkDto>? data;
}

class CardLkConstant {
  CardLkConstant._();

  static const String m_documentNumber = 'หมายเลขคำขอมีบัตรประจำตัวประชาชาชน';
  static const String m_firstName = 'ชื่อตัว';
  static const String m_issueDate = 'วันที่ออกคำร้อง';
  static const String m_lastName = 'ชื่อสกุล';
}