import 'package:json_annotation/json_annotation.dart';

part 'travel_visa_dto.g.dart';

@JsonSerializable()
class TravelVisaDto {
  TravelVisaDto({
    this.visatypenm,
    this.convregno,
    this.conveyance,
    this.depttnm,
    this.efirstnm,
    this.emiddlenm,
    this.efamilynm,
    this.tfirstnm,
    this.tmiddlenm,
    this.tfamilynm,
    this.img,
  });

  factory TravelVisaDto.fromJson(Map<String, dynamic> json) => _$TravelVisaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TravelVisaDtoToJson(this);

  @JsonKey(name: 'Visatypenm') String? visatypenm;
  @JsonKey(name: 'Convregno') String? convregno;
  @JsonKey(name: 'Conveyance') String? conveyance;
  @JsonKey(name: 'Depttnm') String? depttnm;
  @JsonKey(name: 'Efirstnm') String? efirstnm;
  @JsonKey(name: 'Emiddlenm') String? emiddlenm;
  @JsonKey(name: 'Efamilynm') String? efamilynm;
  @JsonKey(name: 'Tfirstnm') String? tfirstnm;
  @JsonKey(name: 'Tmiddlenm') String? tmiddlenm;
  @JsonKey(name: 'Tfamilynm') String? tfamilynm;
  @JsonKey(name: 'Img') String? img;

}

@JsonSerializable()
class ListTravelVisaDto {
  ListTravelVisaDto({
    this.status,
    this.data,
  });

  factory ListTravelVisaDto.fromJson(Map<String, dynamic> json) => _$ListTravelVisaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListTravelVisaDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<TravelVisaDto>? data;
}

class TravelVisaConstant {
  TravelVisaConstant._();

  static const String m_visatypenm = 'ประเภทวีซ่า';
  static const String m_convregno = 'หมายเลขทะเบียนพาหนะ ';
  static const String m_conveyance = 'ประเภทการเดินทาง ';
  static const String m_depttnm = 'ด่านที่เดินทาง';
  static const String m_efirstnm = 'ชื่อ ผู้โดยสาร (Eng) ';
  static const String m_emiddlenm = 'ชื่อกลาง ผู้โดยสาร (Eng) ';
  static const String m_efamilynm = 'นามสกุล ผู้โดยสาร (Eng) ';
  static const String m_tfirstnm = 'ชื่อ ผู้โดยสาร (ไทย) ';
  static const String m_tmiddlenm = 'ชื่อกลาง ผู้โดยสาร (ไทย) ';
  static const String m_tfamilynm = 'นามสกุล ผู้โดยสาร (ไทย) ';
  static const String m_img = 'รูปภาพ';
}