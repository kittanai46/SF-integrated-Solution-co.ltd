import 'package:json_annotation/json_annotation.dart';

part 'crimecase_vehicle_dto.g.dart';

@JsonSerializable()
class CrimeCaseVehicleDto {
  CrimeCaseVehicleDto({
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
    this.ivvId,
    this.ccId,
    this.fullNoPlate,
    this.fullEngineNo,
    this.fullcaseNo,
  });

  factory CrimeCaseVehicleDto.fromJson(Map<String, dynamic> json) => _$CrimeCaseVehicleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CrimeCaseVehicleDtoToJson(this);

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
  @JsonKey(name: 'IVVID') String? ivvId;  // Object ID
  @JsonKey(name: 'CCID') String? ccId;  // Object ID - CrimeCase
  @JsonKey(name: 'FULLNOPLATE') String? fullNoPlate;  // Rowkey
  @JsonKey(name: 'FULLENGINENO') String? fullEngineNo;  // Rowkey
  @JsonKey(name: 'FULLCASENO') String? fullcaseNo;  // Rowkey

  String getIsLostCarMessage(String? status){

    String message = status ?? "";
    switch(status) {
      case CrimeCaseVehicleConstant.k_ISLOSTCAR_0: message = CrimeCaseVehicleConstant.m_ISLOSTCAR_0; break;
      case CrimeCaseVehicleConstant.k_ISLOSTCAR_1: message = CrimeCaseVehicleConstant.m_ISLOSTCAR_1; break;
    }
    return message;
  }

  String getIsInterceptMessage(String? status){

    String message = status ?? "";
    switch(status) {
      case CrimeCaseVehicleConstant.k_ISINTERCEPT_0: message = CrimeCaseVehicleConstant.m_ISINTERCEPT_0; break;
      case CrimeCaseVehicleConstant.k_ISINTERCEPT_1: message = CrimeCaseVehicleConstant.m_ISINTERCEPT_1; break;
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
class ListCrimeCaseVehicleDto {
  ListCrimeCaseVehicleDto({
    this.status,
    this.data,
  });

  factory ListCrimeCaseVehicleDto.fromJson(Map<String, dynamic> json) => _$ListCrimeCaseVehicleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListCrimeCaseVehicleDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<CrimeCaseVehicleDto>? data;
}

class CrimeCaseVehicleConstant {
  CrimeCaseVehicleConstant._();

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
  static const String m_ivvId = 'Object ID';
  static const String m_ccId = 'Object ID - CrimeCase';
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


}