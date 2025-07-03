import 'package:json_annotation/json_annotation.dart';

part 'emergency_car_dto.g.dart';

@JsonSerializable()
class EmergencyCarDto {
  EmergencyCarDto({
    this.signalColor,
    this.pvaName,
    this.amaName,
    this.noPlateNumber,
    this.tmaName,
    this.onAMission,
    this.policeStation,
    this.licenseNumber,
    this.permissionFirstName,
    this.carColor,
    this.emergencyVehicleType,
    this.permissionSurName,
    this.acceptDate,
    this.policeStationPermission,
    this.position,
    this.firstName,
    this.rank,
    this.surName,
    this.province,
    this.permissionAddress,
    this.noPlateInitial,
    this.expirationDate,
    this.permissionRank,
    this.carType,
    this.carBrand,
    this.signalSound,
    this.isExpire,
    this.rankApprove,
    this.firstNameApprove,
    this.surNameApprove,
    this.positionApprove,
    this.policeStationApprove,

  });

  factory EmergencyCarDto.fromJson(Map<String, dynamic> json) => _$EmergencyCarDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EmergencyCarDtoToJson(this);

  @JsonKey(name: 'SignalColor') String? signalColor;
  @JsonKey(name: 'pvaname') String? pvaName;
  @JsonKey(name: 'amaname') String? amaName;
  @JsonKey(name: 'NoPlate_number') String? noPlateNumber;
  @JsonKey(name: 'tmaname') String? tmaName;
  @JsonKey(name: 'On_A_Mission') String? onAMission;
  @JsonKey(name: 'PoliceStation') String? policeStation;
  @JsonKey(name: 'License_Number') String? licenseNumber;
  @JsonKey(name: 'PermissionFirstName') String? permissionFirstName;
  @JsonKey(name: 'CarColor') String? carColor;
  @JsonKey(name: 'EmergencyVehicleType') String? emergencyVehicleType;
  @JsonKey(name: 'PermissionSurName') String? permissionSurName;
  @JsonKey(name: 'AcceptDate') String? acceptDate;
  @JsonKey(name: 'PoliceStationPermission') String? policeStationPermission;
  @JsonKey(name: 'Position') String? position;
  @JsonKey(name: 'FirstName') String? firstName;
  @JsonKey(name: 'Rank') String? rank;
  @JsonKey(name: 'SurName') String? surName;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'PermissionAddress') String? permissionAddress;
  @JsonKey(name: 'NoPlate_initial') String? noPlateInitial;
  @JsonKey(name: 'ExpirationDate') String? expirationDate;
  @JsonKey(name: 'PermissionRank') String? permissionRank;
  @JsonKey(name: 'CarType') String? carType;
  @JsonKey(name: 'CarBrand') String? carBrand;
  @JsonKey(name: 'SignalSound') String? signalSound;
  @JsonKey(name: 'IsExpire') String? isExpire;  //0,1
  @JsonKey(name: 'RankApprove') String? rankApprove;
  @JsonKey(name: 'FirstNameApprove') String? firstNameApprove;
  @JsonKey(name: 'SurNameApprove') String? surNameApprove;
  @JsonKey(name: 'PositionApprove') String? positionApprove;
  @JsonKey(name: 'PoliceStationApprove') String? policeStationApprove;

}

@JsonSerializable()
class ListEmergencyCarDto {
  ListEmergencyCarDto({
    this.status,
    this.data,
  });

  factory ListEmergencyCarDto.fromJson(Map<String, dynamic> json) => _$ListEmergencyCarDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListEmergencyCarDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<EmergencyCarDto>? data;
}

class EmergencyCarConstant {
  EmergencyCarConstant._();

  static const String m_signalColor = 'สีสัญญาณไฟ';
  static const String m_pvaName = 'จังหวัด';
  static const String m_amaName = 'อำเภอ/เขต';
  static const String m_noPlateNumber = 'ตัวเลข ทะเบียนยานพาหนะ';
  static const String m_tmaName = 'ตำบล/แขวง';
  static const String m_onAMission = 'ใช้ในกิจ';
  static const String m_policeStation = 'หน่วยงานที่สังกัด';
  static const String m_licenseNumber = 'เลขหนังสืออนุญาต';
  static const String m_permissionFirstName = 'ชื่อ ผู้ขออนุญาต';
  static const String m_carColor = 'สีรถ';
  static const String m_emergencyVehicleType = 'ประเภทรถฉุกเฉิน';
  static const String m_permissionSurName = 'นามสกุล ผู้ขออนุญาต';
  static const String m_acceptDate = 'วันที่อนุญาตให้ใช้';
  static const String m_policeStationPermission = 'หน่วยงาน ขออนุญาต';
  static const String m_position = 'ตำแหน่ง ผู้บันทึก';
  static const String m_firstName = 'ชื่อ ผู้บันทึก';
  static const String m_rank = 'ยศ ผู้บันทึก';
  static const String m_surName = 'นามสกุล ผู้บันทึก';
  static const String m_province = 'จังหวัด ทะเบียนรถ';
  static const String m_permissionAddress = 'ที่อยู่ ผู้ขออนุญาต';
  static const String m_noPlateInitial = 'ตัวเลข ทะเบียนรถ';
  static const String m_expirationDate = 'วันที่หมดอายุ';
  static const String m_permissionRank = 'คำนำหน้า ผู้ขออนุญาต';
  static const String m_carType = 'ประเภทรถ';
  static const String m_carBrand = 'ยี่ห้อรถ';
  static const String m_signalSound = 'เสียงสัญญาณไฟ';
  static const String m_isExpire = 'สถานะหมดอายุ';
  static const String m_rankApprove = 'ยศผู้อนุมัติ';
  static const String m_firstNameApprove = 'ชื่อผู้อนุมัติ';
  static const String m_surNameApprove = 'นามสกุลผู้อนุมัติ';
  static const String m_positionApprove = 'ตำแหน่งผู้อนุมัติ';
  static const String m_policeStationApprove = 'หน่วยงานผู้อนุมัติ';

}