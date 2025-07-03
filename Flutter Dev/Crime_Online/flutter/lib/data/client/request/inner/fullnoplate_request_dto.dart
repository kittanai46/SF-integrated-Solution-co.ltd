import 'package:json_annotation/json_annotation.dart';

part 'fullnoplate_request_dto.g.dart';

@JsonSerializable()
class FullNoPlateRequestDto {
  FullNoPlateRequestDto({this.province, this.intitialNo, this.number, this.status, this.lat, this.lon});

  factory FullNoPlateRequestDto.fromJson(Map<String, dynamic> json) => _$FullNoPlateRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FullNoPlateRequestDtoToJson(this);

  @JsonKey(name: 'province') String? province;
  @JsonKey(name: 'intitialno') String? intitialNo;
  @JsonKey(name: 'number') String? number;
  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'lat') double? lat;
  @JsonKey(name: 'lon') double? lon;
}

class FullNoPlateRequestConstant {
  FullNoPlateRequestConstant._();

  static const String k_status_0 = '0';  // ทั่วไป
  static const String k_status_1 = '1';  // ยานพาหนะแจ้งสกัดจับ
  static const String k_status_2 = '2';  // ยานพาหนะแจ้งหาย
  static const String k_status_3 = '3';  // ยานพาหนะแจ้งสกัดจับ/ยานพาหนะแจ้งหาย
}