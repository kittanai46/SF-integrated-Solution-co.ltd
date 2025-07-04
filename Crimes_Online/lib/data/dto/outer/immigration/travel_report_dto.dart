import 'package:crimes/data/dto/outer/immigration/travel_visa_dto.dart';
import 'package:crimes/data/dto/outer/immigration/travel_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'travel_report_dto.g.dart';

@JsonSerializable()
class ReportTravelDto {
  ReportTravelDto({
    this.tMRunNo,
    this.passportNo,
    this.travelDate,
    this.travelType,
    this.eFullname,
    this.sex,
    this.nationENM,
    this.birthDate,
    this.tM6No,
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

  factory ReportTravelDto.fromJson(Map<String, dynamic> json) => _$ReportTravelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportTravelDtoToJson(this);

  @JsonKey(name: 'TMRunNo') String? tMRunNo;
  @JsonKey(name: 'PassportNo') String? passportNo;
  @JsonKey(name: 'TravelDate') String? travelDate;  //Date and Time
  @JsonKey(name: 'TravelType') String? travelType;
  @JsonKey(name: 'EFullname') String? eFullname;
  @JsonKey(name: 'Sex') String? sex;
  @JsonKey(name: 'NationENM') String? nationENM;
  @JsonKey(name: 'BirthDate') String? birthDate;  //Date and Time
  @JsonKey(name: 'TM6No') String? tM6No;
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

  void addTravelDto(TravelDto? input){
    if(input == null){
      return;
    }
    tMRunNo = input.tMRunNo;
    passportNo = input.passportNo;
    travelDate = input.travelDate;
    travelType = input.travelType;
    eFullname = input.eFullname;
    sex = input.sex;
    nationENM = input.nationENM;
    birthDate = input.birthDate;
    tM6No = input.tM6No;
  }

  void addTravelVisaDto(TravelVisaDto? input){
    if(input == null){
      visatypenm = "";
      convregno = "";
      conveyance = "";
      depttnm = "";
      efirstnm = "";
      emiddlenm = "";
      efamilynm = "";
      tfirstnm = "";
      tmiddlenm = "";
      tfamilynm = "";
      img = "";
      return;
    }
    visatypenm = input.visatypenm;
    convregno = input.convregno;
    conveyance = input.conveyance;
    depttnm = input.depttnm;
    efirstnm = input.efirstnm;
    emiddlenm = input.emiddlenm;
    efamilynm = input.efamilynm;
    tfirstnm = input.tfirstnm;
    tmiddlenm = input.tmiddlenm;
    tfamilynm = input.tfamilynm;
    img = input.img;
  }
}