import 'package:crimes/data/dto/outer/foreign/worker_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'worker_report_dto.g.dart';

@JsonSerializable()
class ReportWorkerDto {
  ReportWorkerDto({
    this.workerID,
    this.fullNameEN,
    this.firstName,
    this.lastName,
    this.marryStatus,
    this.peopleStatus,
    this.birthdate,
    this.gender,
    this.nationality,
    this.oldWorkerID,
    this.houseID,
    this.houseNumber,
    this.moo,
    this.alley,
    this.soi,
    this.road,
    this.tambon,
    this.amphur,
    this.province,
    this.place,
    this.sellHouseDate,
    this.img,
  });

  factory ReportWorkerDto.fromJson(Map<String, dynamic> json) => _$ReportWorkerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportWorkerDtoToJson(this);

  @JsonKey(name: 'WorkerID') String? workerID;
  @JsonKey(name: 'FullNameEN') String? fullNameEN;
  @JsonKey(name: 'FirstName') String? firstName;
  @JsonKey(name: 'LastName') String? lastName;
  @JsonKey(name: 'MarryStatus') String? marryStatus;
  @JsonKey(name: 'PeopleStatus') String? peopleStatus;
  @JsonKey(name: 'Birthdate') String? birthdate;
  @JsonKey(name: 'Gender') String? gender;
  @JsonKey(name: 'Nationality') String? nationality;
  @JsonKey(name: 'OldWorkerID') String? oldWorkerID;
  @JsonKey(name: 'HouseID') String? houseID;
  @JsonKey(name: 'HouseNumber') String? houseNumber;
  @JsonKey(name: 'Moo') String? moo;
  @JsonKey(name: 'Alley') String? alley;
  @JsonKey(name: 'Soi') String? soi;
  @JsonKey(name: 'Road') String? road;
  @JsonKey(name: 'Tambon') String? tambon;
  @JsonKey(name: 'Amphur') String? amphur;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'Place') String? place;
  @JsonKey(name: 'SellHouseDate') String? sellHouseDate;
  @JsonKey(name: 'Img') String? img;
  void addWorkerDto(WorkerDto? input){
    if(input ==null){
      return;
    }
    workerID= input.workerID;
    fullNameEN= input.fullNameEN;
    firstName= input.firstName;
    lastName= input.lastName;
    marryStatus= input.marryStatus;
    peopleStatus= input.peopleStatus;
    birthdate= input.birthdate;
    gender= input.gender;
    nationality= input.nationality;
    oldWorkerID= input.oldWorkerID;
    houseID= input.houseID;
    houseNumber= input.houseNumber;
    moo= input.moo;
    alley= input.alley;
    soi= input.soi;
    road= input.road;
    tambon= input.tambon;
    amphur= input.amphur;
    province= input.province;
    place= input.place;
    sellHouseDate= input.sellHouseDate;
  }
  void setImage(String input){
    img = input;
  }
}