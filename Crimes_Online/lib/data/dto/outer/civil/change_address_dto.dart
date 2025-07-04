import 'package:json_annotation/json_annotation.dart';

part 'change_address_dto.g.dart';

@JsonSerializable()
class ChangeAddressDto {
  ChangeAddressDto({
    this.oldHouseID,
    this.moveInDate,
    this.moveOutDate,
    this.oldLocation,
  });

  factory ChangeAddressDto.fromJson(Map<String, dynamic> json) => _$ChangeAddressDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeAddressDtoToJson(this);
 
  @JsonKey(name: 'OldHouseID') String? oldHouseID;
  @JsonKey(name: 'MoveInDate') String? moveInDate;     // Date and Time
  @JsonKey(name: 'MoveOutDate') String? moveOutDate;   // Date and Time
  @JsonKey(name: 'OldLocation') String? oldLocation;   // Date and Time
}

@JsonSerializable()
class ListChangeAddressDto {
  ListChangeAddressDto({
    this.status,
    this.data,
  });

  factory ListChangeAddressDto.fromJson(Map<String, dynamic> json) => _$ListChangeAddressDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListChangeAddressDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<ChangeAddressDto>? data;
}

class ChangeAddressConstant {
  ChangeAddressConstant._();

  static const String m_oldHouseID = 'เลขรหัสประจำบ้านเดิม';
  static const String m_moveInDate = 'วันที่ย้ายเข้า';
  static const String m_moveOutDate = 'วันที่ย้ายออก';
  static const String m_oldLocation = 'สำนักทะเบียนเดิม';
}