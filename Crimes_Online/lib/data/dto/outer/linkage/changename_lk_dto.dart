import 'package:json_annotation/json_annotation.dart';

part 'changename_lk_dto.g.dart';

@JsonSerializable()
class ChangeNameLkDto {
  ChangeNameLkDto({
    this.fDateOfChange,
    this.fNewValue,
    this.fOldValue,
    this.fRcodeCode,
    this.fRcodeDesc,
    this.lDateOfChange,
    this.lNewValue,
    this.lOldValue,
    this.lRcodeCode,
    this.lRcodeDesc,
  });

  factory ChangeNameLkDto.fromJson(Map<String, dynamic> json) => _$ChangeNameLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeNameLkDtoToJson(this);

  @JsonKey(name: 'firstName.dateOfChange') String? fDateOfChange;
  @JsonKey(name: 'firstName.newValue') String? fNewValue;
  @JsonKey(name: 'firstName.oldValue') String? fOldValue;
  @JsonKey(name: 'firstName.rcodeCode') String? fRcodeCode;
  @JsonKey(name: 'firstName.rcodeDesc') String? fRcodeDesc;
  @JsonKey(name: 'lastName.dateOfChange') String? lDateOfChange;
  @JsonKey(name: 'lastName.newValue') String? lNewValue;
  @JsonKey(name: 'lastName.oldValue') String? lOldValue;
  @JsonKey(name: 'lastName.rcodeCode') String? lRcodeCode;
  @JsonKey(name: 'lastName.rcodeDesc') String? lRcodeDesc;

}

@JsonSerializable()
class ListChangeNameLkDto {
  ListChangeNameLkDto({
    this.status,
    this.data,
  });

  factory ListChangeNameLkDto.fromJson(Map<String, dynamic> json) => _$ListChangeNameLkDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListChangeNameLkDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<ChangeNameLkDto>? data;
}

class ChangeNameLkConstant {
  ChangeNameLkConstant._();

  static const String m_fDateOfChange = 'วัน เดือน ปี ที่มีการแก้ไขชื่อ';
  static const String m_fNewValue = 'ชื่อใหม่';
  static const String m_fOldValue = 'ชื่อเดิม';
  static const String m_fRcodeCode = 'รหัสสำนักทะเบียนที่ยื่นแก้ไขชื่อ';
  static const String m_fRcodeDesc = 'ชื่อสำนักทะเบียนที่ยื่นแก้ไขชื่อ';
  static const String m_lDateOfChange = 'วัน เดือน ปี ที่มีการแก้ไขสกุล';
  static const String m_lNewValue = 'สกุลใหม่';
  static const String m_lOldValue = 'สกุลเดิม';
  static const String m_lRcodeCode = 'รหัสสำนักทะเบียนที่ยื่นแก้ไขสกุล';
  static const String m_lRcodeDesc = 'ชื่อสำนักทะเบียนที่ยื่นแก้ไขสกุล';
}