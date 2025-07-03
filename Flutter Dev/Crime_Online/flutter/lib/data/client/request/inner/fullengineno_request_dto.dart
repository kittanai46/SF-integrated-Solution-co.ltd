import 'package:json_annotation/json_annotation.dart';

part 'fullengineno_request_dto.g.dart';

@JsonSerializable()
class FullEngineNoRequestDto {
  FullEngineNoRequestDto({this.engineNo, this.status, this.lat, this.lon});

  factory FullEngineNoRequestDto.fromJson(Map<String, dynamic> json) => _$FullEngineNoRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FullEngineNoRequestDtoToJson(this);

  @JsonKey(name: 'engineno') String? engineNo;
  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}

class FullEngineNoRequestConstant {
  FullEngineNoRequestConstant._();

  static const String k_status_0 = '0';  // ทั่วไป
  static const String k_status_1 = '1';  // ยานพาหนะแจ้งสกัดจับ
  static const String k_status_2 = '2';  // ยานพาหนะแจ้งหาย
  static const String k_status_3 = '3';  // ยานพาหนะแจ้งสกัดจับ/ยานพาหนะแจ้งหาย
}