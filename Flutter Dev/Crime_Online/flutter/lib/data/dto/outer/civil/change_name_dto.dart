import 'package:json_annotation/json_annotation.dart';

part 'change_name_dto.g.dart';

@JsonSerializable()
class ChangeNameDto {
  ChangeNameDto({
    this.nameChangeTypeID,
    this.nameChangeType,
    this.nameChangeDate,
    this.oldName,
    this.newName,
    this.lacationChange,
  });

  factory ChangeNameDto.fromJson(Map<String, dynamic> json) => _$ChangeNameDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeNameDtoToJson(this);
 
  @JsonKey(name: 'NameChangeTypeID') String? nameChangeTypeID;
  @JsonKey(name: 'NameChangeType') String? nameChangeType;
  @JsonKey(name: 'NameChangeDate') String? nameChangeDate;
  @JsonKey(name: 'OldName') String? oldName;
  @JsonKey(name: 'NewName') String? newName;
  @JsonKey(name: 'LacationChange') String? lacationChange;
}

@JsonSerializable()
class ListChangeNameDto {
  ListChangeNameDto({
    this.status,
    this.data,
  });

  factory ListChangeNameDto.fromJson(Map<String, dynamic> json) => _$ListChangeNameDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListChangeNameDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<ChangeNameDto>? data;
}

class ChangeNameConstant {
  ChangeNameConstant._();

  static const String m_nameChangeTypeID = 'รหัสประเภทของการเปลี่ยนแปลง';
  static const String m_nameChangeType = 'ประเภทของการเปลี่ยนแปลง';
  static const String m_nameChangeDate = 'วันที่เปลี่ยน';
  static const String m_oldName = 'ชื่อ/สกุลเก่า';
  static const String m_newName = 'ชื่อ/สกุลใหม่';
  static const String m_lacationChange = 'สถานที่เปลี่ยนชื่อหรือชื่อสกุล';
}