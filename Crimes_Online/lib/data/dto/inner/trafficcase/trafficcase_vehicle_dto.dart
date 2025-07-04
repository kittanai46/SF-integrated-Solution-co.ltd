import 'package:json_annotation/json_annotation.dart';

part 'trafficcase_vehicle_dto.g.dart';

@JsonSerializable()
class TrafficCaseVehicleDto {
  TrafficCaseVehicleDto({
    this.bh,
    this.bk,
    this.orgCode,
    this.stationName,
    this.caseNo,
    this.crimeCaseNo,
    this.crimeCaseYear,
    this.noPlate_initial,
    this.noPlate_number,
    this.provinceName,
    this.chasisNumber,
    this.engineNumber,
    this.brandString,
    this.modelString,
    this.color,
    this.isLostCar,
    this.isIntercept,
    this.isArrestStatus,
    this.isRegain,
    this.isEvidence,
    this.ivvId,
    this.tcId,
    this.fullNoPlate,
    this.fullEngineNo,
    this.fullcaseNo,
  });

  factory TrafficCaseVehicleDto.fromJson(Map<String, dynamic> json) => _$TrafficCaseVehicleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TrafficCaseVehicleDtoToJson(this);

  @JsonKey(name: 'BH') String? bh;  // บช./ภาค
  @JsonKey(name: 'BK') String? bk;  // บก./ภ.จว
  @JsonKey(name: 'ORGCODE') String? orgCode;  // รหัสสถานี
  @JsonKey(name: 'STATIONNAME') String? stationName;  // ชื่อสถานี
  @JsonKey(name: 'CASENO') String? caseNo;  // เลขคดี
  @JsonKey(name: 'CRIMECASENO') String? crimeCaseNo;  // เลขที่คดี
  @JsonKey(name: 'CRIMECASEYEAR') String? crimeCaseYear;  // ปีท่ีคดี
  @JsonKey(name: 'NOPLATE_INITIAL') String? noPlate_initial;  // ตัวอักษร - ทะเบียนรถ
  @JsonKey(name: 'NOPLATE_NUMBER') String? noPlate_number;  // ตัวเลข - ทะเบียนรถ
  @JsonKey(name: 'PROVINCENAME') String? provinceName;  // จังหวัด - ทะเบียนรถ
  @JsonKey(name: 'CHASISNUMBER') String? chasisNumber;  // เลขตัวรถ
  @JsonKey(name: 'ENGINENUMBER') String? engineNumber;  // เลขตัวเครื่อง
  @JsonKey(name: 'BRANDSTRING') String? brandString;  // ยี่ห้อ
  @JsonKey(name: 'MODELSTRING') String? modelString;  // รุ่น
  @JsonKey(name: 'COLOR') String? color;  // สี
  @JsonKey(name: 'ISLOSTCAR') String? isLostCar;  // สถานะแจ้งหาย
  @JsonKey(name: 'ISINTERCEPT') String? isIntercept;  // สถานะแจ้งสกัดจับ
  @JsonKey(name: 'ISARRESTSTATUS') String? isArrestStatus;  // สถานะยานพาหนะ
  @JsonKey(name: 'ISREGAIN') String? isRegain;  // สถานะการคืนของกลาง
  @JsonKey(name: 'ISEVIDENCE') String? isEvidence;  // สถานะของกลาง
  @JsonKey(name: 'IVVID') String? ivvId;  // Object ID
  @JsonKey(name: 'TCID') String? tcId;  // Object ID - TrafficCase
  @JsonKey(name: 'FULLNOPLATE') String? fullNoPlate;  // Rowkey
  @JsonKey(name: 'FULLENGINENO') String? fullEngineNo;  // Rowkey
  @JsonKey(name: 'FULLCASENO') String? fullcaseNo;  // Rowkey


  String getIsLostCarMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseVehicleConstant.k_ISLOSTCAR_0: message = TrafficCaseVehicleConstant.m_ISLOSTCAR_0; break;
      case TrafficCaseVehicleConstant.k_ISLOSTCAR_1: message = TrafficCaseVehicleConstant.m_ISLOSTCAR_1; break;
    }
    return message;
  }

  String getIsInterceptMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseVehicleConstant.k_ISINTERCEPT_0: message = TrafficCaseVehicleConstant.m_ISINTERCEPT_0; break;
      case TrafficCaseVehicleConstant.k_ISINTERCEPT_1: message = TrafficCaseVehicleConstant.m_ISINTERCEPT_1; break;
    }
    return message;
  }

  String getIsArrestStatusMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseVehicleConstant.k_ISARRESTSTATUS_Occupation: message = TrafficCaseVehicleConstant.m_ISARRESTSTATUS_Occupation; break;
      case TrafficCaseVehicleConstant.k_ISARRESTSTATUS_NotOccupied: message = TrafficCaseVehicleConstant.m_ISARRESTSTATUS_NotOccupied; break;
      case TrafficCaseVehicleConstant.k_ISARRESTSTATUS_Escape: message = TrafficCaseVehicleConstant.m_ISARRESTSTATUS_Escape; break;
    }
    return message;
  }

  String getIsRegainMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseVehicleConstant.k_ISREGAIN_0: message = TrafficCaseVehicleConstant.m_ISREGAIN_0; break;
      case TrafficCaseVehicleConstant.k_ISREGAIN_1: message = TrafficCaseVehicleConstant.m_ISREGAIN_1; break;
    }
    return message;
  }

  String getIsEvidenceMessage(String? status){
    // String message = '';
    String message = status ?? "";
    switch(status) {
      case TrafficCaseVehicleConstant.k_ISEVIDENCE_0: message = TrafficCaseVehicleConstant.m_ISEVIDENCE_0; break;
      case TrafficCaseVehicleConstant.k_ISEVIDENCE_1: message = TrafficCaseVehicleConstant.m_ISEVIDENCE_1; break;
    }
    return message;
  }

  String? getCrimeCaseNo(){
    return crimeCaseNo;
  }
  String? getCrimeCaseYear(){
    return crimeCaseYear;
  }

}



@JsonSerializable()
class ListTrafficCaseVehicleDto {
  ListTrafficCaseVehicleDto({
    this.status,
    this.data,
  });

  factory ListTrafficCaseVehicleDto.fromJson(Map<String, dynamic> json) => _$ListTrafficCaseVehicleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListTrafficCaseVehicleDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<TrafficCaseVehicleDto>? data;
}

class TrafficCaseVehicleConstant {
  TrafficCaseVehicleConstant._();

  static const String m_bh = 'บช./ภาค';
  static const String m_bk = 'บก./ภ.จว';
  static const String m_orgCode = 'รหัสสถานี';
  static const String m_stationName = 'ชื่อสถานี';
  static const String m_caseNo = 'เลขคดี';
  static const String m_crimeCaseNo = 'เลขที่คดี';
  static const String m_crimeCaseYear = 'ปีท่ีคดี';
  static const String m_noPlate_initial = 'ตัวอักษร - ทะเบียนรถ';
  static const String m_noPlate_number = 'ตัวเลข - ทะเบียนรถ';
  static const String m_provinceName = 'จังหวัด - ทะเบียนรถ';
  static const String m_chasisNumber = 'เลขตัวรถ';
  static const String m_engineNumber = 'เลขตัวเครื่อง';
  static const String m_brandString = 'ยี่ห้อ';
  static const String m_modelString = 'รุ่น';
  static const String m_color = 'สี';
  static const String m_isLostCar = 'สถานะแจ้งหาย';
  static const String m_isIntercept = 'สถานะแจ้งสกัดจับ';
  static const String m_isArrestStatus = 'สถานะยานพาหนะ';
  static const String m_isRegain = 'สถานะการคืนของกลาง';
  static const String m_isEvidence = 'สถานะของกลาง';
  static const String m_ivvId = 'Object ID';
  static const String m_tcId = 'Object ID - TrafficCase';
  static const String m_fullNoPlate = 'Rowkey';
  static const String m_fullEngineNo = 'Rowkey';
  static const String m_fullcaseNo = 'Rowkey';


  static const String k_ISLOSTCAR_0 = '0';
  static const String k_ISLOSTCAR_1 = '1';

  static const String m_ISLOSTCAR_0 = 'ไม่แจ้งหาย';
  static const String m_ISLOSTCAR_1 = 'แจ้งหาย';

  static const String k_ISINTERCEPT_0 = '0';
  static const String k_ISINTERCEPT_1 = '1';

  static const String m_ISINTERCEPT_0 = 'ไม่แจ้งสกัดจับ';
  static const String m_ISINTERCEPT_1 = 'แจ้งสกัดจับ';


  static const String k_ISARRESTSTATUS_Occupation = 'Occupation';
  static const String k_ISARRESTSTATUS_NotOccupied = 'NotOccupied';
  static const String k_ISARRESTSTATUS_Escape = 'Escape';

  static const String m_ISARRESTSTATUS_Occupation = 'ยึดไว้';
  static const String m_ISARRESTSTATUS_NotOccupied = 'ไม่ยึด';
  static const String m_ISARRESTSTATUS_Escape = 'หลบหนี';

  static const String k_ISREGAIN_0 = '0';
  static const String k_ISREGAIN_1 = '1';

  static const String m_ISREGAIN_0 = 'ไม่แจ้งคืน';
  static const String m_ISREGAIN_1 = 'แจ้งคืน';

  static const String k_ISEVIDENCE_0 = '0';
  static const String k_ISEVIDENCE_1 = '1';

  static const String m_ISEVIDENCE_0 = 'ไม่เป็นของกลาง';
  static const String m_ISEVIDENCE_1 = 'เป็นของกลาง';

}