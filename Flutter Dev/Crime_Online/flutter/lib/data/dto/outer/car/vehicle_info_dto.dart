import 'package:json_annotation/json_annotation.dart';

part 'vehicle_info_dto.g.dart';

@JsonSerializable()
class VehicleInfoDto {
  VehicleInfoDto({
    this.carStatus,
    this.regDate,
    this.plate1,
    this.plate2,
    this.offLocCode,
    this.vehTypeDesc,
    this.kindDesc,
    this.brnDesc,
    this.modelName,
    this.mfgYear,
    this.numBody,
    this.color,
    this.expDate,
    this.engBrnDesc,
    this.numEng,
    this.fuelDesc,
    this.gasNo,
    this.lpgGasExpireDate,
    this.gasEndCertDate,
    this.cly,
    this.cc,
    this.wgtCar,
    this.holdFlag,
    this.lastSignDate,
    this.lastChkDate,
    this.oldLastSignDate,
    this.own_fname,
    this.own_lname,
    this.own_addr,
    this.occ_fname,
    this.occ_lname,
    this.occ_addr,
    this.noteDate,
    this.note,
    this.own_pid,
    this.occ_pid,
    this.taxExpired,
  });

  factory VehicleInfoDto.fromJson(Map<String, dynamic> json) => _$VehicleInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleInfoDtoToJson(this);

  @JsonKey(name: 'carStatus') String? carStatus;
  @JsonKey(name: 'regDate') String? regDate;
  @JsonKey(name: 'plate1') String? plate1;
  @JsonKey(name: 'plate2') String? plate2;
  @JsonKey(name: 'offLocCode') String? offLocCode;
  @JsonKey(name: 'vehTypeDesc') String? vehTypeDesc;
  @JsonKey(name: 'kindDesc') String? kindDesc;
  @JsonKey(name: 'brnDesc') String? brnDesc;
  @JsonKey(name: 'modelName') String? modelName;
  @JsonKey(name: 'mfgYear') String? mfgYear;
  @JsonKey(name: 'numBody') String? numBody;
  @JsonKey(name: 'color') String? color;
  @JsonKey(name: 'expDate') String? expDate;
  @JsonKey(name: 'engBrnDesc') String? engBrnDesc;
  @JsonKey(name: 'numEng') String? numEng;
  @JsonKey(name: 'fuelDesc') String? fuelDesc;
  @JsonKey(name: 'gasNo') String? gasNo;
  @JsonKey(name: 'lpgGasExpireDate') String? lpgGasExpireDate;
  @JsonKey(name: 'gasEndCertDate') String? gasEndCertDate;
  @JsonKey(name: 'cly') String? cly;
  @JsonKey(name: 'cc') String? cc;
  @JsonKey(name: 'wgtCar') String? wgtCar;
  @JsonKey(name: 'holdFlag') String? holdFlag;
  @JsonKey(name: 'lastSignDate') String? lastSignDate;
  @JsonKey(name: 'lastChkDate') String? lastChkDate;
  @JsonKey(name: 'oldLastSignDate') String? oldLastSignDate;
  @JsonKey(name: 'own_fname') String? own_fname;
  @JsonKey(name: 'own_lname') String? own_lname;
  @JsonKey(name: 'own_addr') String? own_addr;
  @JsonKey(name: 'occ_fname') String? occ_fname;
  @JsonKey(name: 'occ_lname') String? occ_lname;
  @JsonKey(name: 'occ_addr') String? occ_addr;
  @JsonKey(name: 'noteDate') String? noteDate;
  @JsonKey(name: 'note') String? note;
  @JsonKey(name: 'own_pid') String? own_pid;
  @JsonKey(name: 'occ_pid') String? occ_pid;
  @JsonKey(name: 'taxExpired') String? taxExpired;

  String getCarStatusMessage(String status){
    String message = '';
    switch(status) {
      case VehicleInfoConstant.k_carStatus_A: message = VehicleInfoConstant.m_carStatus_A; break;
      case VehicleInfoConstant.k_carStatus_PM: message = VehicleInfoConstant.m_carStatus_PM; break;
      case VehicleInfoConstant.k_carStatus_C: message = VehicleInfoConstant.m_carStatus_C; break;
      case VehicleInfoConstant.k_carStatus_S: message = VehicleInfoConstant.m_carStatus_S; break;
      case VehicleInfoConstant.k_carStatus_EX: message = VehicleInfoConstant.m_carStatus_EX; break;
      case VehicleInfoConstant.k_carStatus_O: message = VehicleInfoConstant.m_carStatus_O; break;
      case VehicleInfoConstant.k_carStatus_TP: message = VehicleInfoConstant.m_carStatus_TP; break;
      case VehicleInfoConstant.k_carStatus_T: message = VehicleInfoConstant.m_carStatus_T; break;
    }
    if(message.length==0){
      message = status;
    }
    return message;
  }

}

@JsonSerializable()
class ListVehicleInfoDto {
  ListVehicleInfoDto({
    this.status,
    this.data,
  });

  factory ListVehicleInfoDto.fromJson(Map<String, dynamic> json) => _$ListVehicleInfoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListVehicleInfoDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<VehicleInfoDto>? data;
}

class VehicleInfoConstant {
  VehicleInfoConstant._();

  static const String m_carStatus = 'สถานะรถ';
  static const String m_regDate = 'วันที่จดทะเบียน';
  static const String m_plate1 = 'ทะเบียนรถ (หมวดรถ)';
  static const String m_plate2 = 'ทะเบียนรถ (เลขทะเบียน)';
  static const String m_offLocCode = 'ทะเบียนรถ (จังหวัด)';
  static const String m_vehTypeDesc = 'ประเภทรถ';
  static const String m_kindDesc = 'ลักษณะ/มาตรฐานรถ';
  static const String m_brnDesc = 'ยี่ห้อรถ';
  static const String m_modelName = 'รุ่นรถ';
  static const String m_mfgYear = 'รุ่นปีค.ศ.';
  static const String m_numBody = 'เลขตัวรถ';
  static const String m_color = 'สี';
  static const String m_expDate = 'วันที่สิ้นภาษี';
  static const String m_engBrnDesc = 'ยี่ห้อเครื่องยนต์';
  static const String m_numEng = 'เลขเครื่องยนต์';
  static const String m_fuelDesc = 'เชื้อเพลิง';
  static const String m_gasNo = 'หมายเลขถังแก๊ส';
  static const String m_lpgGasExpireDate = 'วันที่หมดอายุ';
  static const String m_gasEndCertDate = 'วันหมดอายุของใบรับรอง';
  static const String m_cly = 'จำนวนสูบ';
  static const String m_cc = 'จำนวนซีซี';
  static const String m_wgtCar = 'น้ำหนักรถ';
  static const String m_holdFlag = 'สถานะการอายัด (H อายัด)';
  static const String m_lastSignDate = 'วันที่ครบกำหนดตรวจรอบ';
  static const String m_lastChkDate = 'วันที่ตรวจรอบล่าสุด';
  static const String m_oldLastSignDate = 'วันที่ตรวจสภาพล่าสุด';
  static const String m_own_fname = 'ชื่อ';    //ชื่อผู้ถือกรรมสิทธิ์
  static const String m_own_lname = 'นามสกุล'; //นามสกุลผู้ถือกรรมสิทธิ์
  static const String m_own_addr = 'ที่อยู่';    //ที่อยู่ผู้ถือกรรมสิทธิ์
  static const String m_occ_fname = 'ชื่อ';     //ชื่อผู้ครอบครอง
  static const String m_occ_lname = 'นามสกุล'; //นามสกุลผู้ครอบครอง
  static const String m_occ_addr = 'ที่อยู่';     //ที่อยู่ผู้ถือกรรมสิทธิ์
  static const String m_noteDate = 'วันที่บันทึก';
  static const String m_note = 'รายการบันทึกเจ้าหน้าที่';
  static const String m_own_pid = 'เลขบัตรประชาชน';     //เลขบัตรประชาชนผู้ถือกรรมสิทธิ์
  static const String m_occ_pid = 'เลขบัตรประชาชน';     //เลขบัตรประชาชนผู้ครอบครอง
  static const String m_taxExpired = 'สถานะการสิ้นอายุภาษี';     //เลขบัตรประชาชนผู้ครอบครอง


  static const String k_carStatus_A = 'A';
  static const String k_carStatus_PM = 'PM';
  static const String k_carStatus_C = 'C';
  static const String k_carStatus_S = 'S';
  static const String k_carStatus_EX = 'EX';
  static const String k_carStatus_O = 'O';
  static const String k_carStatus_TP = 'TP';
  static const String k_carStatus_T = 'T';

  static const String m_carStatus_A = 'ปกติ';
  static const String m_carStatus_PM = 'แจ้งไม่ใช้ตลอดไป';
  static const String m_carStatus_C = 'ยกเลิกเลขทะเบียน';
  static const String m_carStatus_S = 'ระงับใช้รถ';
  static const String m_carStatus_EX = 'ออกนอกราชอาณาจักรตลอดไป';
  static const String m_carStatus_O = 'ย้ายออก';
  static const String m_carStatus_TP = 'แจ้งไม่ใช้ชั่วคราว';
  static const String m_carStatus_T = 'เปลี่ยนประเภท';

}