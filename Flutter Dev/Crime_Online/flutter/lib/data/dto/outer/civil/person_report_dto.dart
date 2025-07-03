import 'package:crimes/data/dto/outer/civil/person_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person_report_dto.g.dart';

@JsonSerializable()
class ReportPersonDto {
  ReportPersonDto({
    this.pID,
    this.title,
    this.firstName,
    this.lastName,
    this.birthdate,
    this.gender,
    this.age,
    this.moveInDate,
    this.peopleStatus,
    this.nationality,
    this.houseOwnerStatus,
    this.fatherPID,
    this.fatherName,
    this.fatherNationality,
    this.motherPID,
    this.motherName,
    this.motherNationality,
    this.houseID,
    this.houseNumber,
    this.moo,
    this.alley,
    this.soi,
    this.road,
    this.tambon,
    this.amphur,
    this.province,
    this.changedNationalityStatus,
    this.changedNationalityDate,
    this.address,
    this.img,
  });

  factory ReportPersonDto.fromJson(Map<String, dynamic> json) => _$ReportPersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReportPersonDtoToJson(this);

  @JsonKey(name: 'PID') String? pID;
  @JsonKey(name: 'Title') String? title;
  @JsonKey(name: 'Firstname') String? firstName;
  @JsonKey(name: 'Lastname') String? lastName;
  @JsonKey(name: 'Birthdate') String? birthdate;
  @JsonKey(name: 'Gender') String? gender;
  @JsonKey(name: 'Age') String? age;
  @JsonKey(name: 'MoveInDate') String? moveInDate;
  @JsonKey(name: 'PeopleStatus') String? peopleStatus;
  @JsonKey(name: 'Nationality') String? nationality;
  @JsonKey(name: 'HouseOwnerStatus') String? houseOwnerStatus;
  @JsonKey(name: 'FatherPID') String? fatherPID;
  @JsonKey(name: 'FatherName') String? fatherName;
  @JsonKey(name: 'FatherNationality') String? fatherNationality;
  @JsonKey(name: 'MotherPID') String? motherPID;
  @JsonKey(name: 'MotherName') String? motherName;
  @JsonKey(name: 'MotherNationality') String? motherNationality;
  @JsonKey(name: 'HouseID') String? houseID;
  @JsonKey(name: 'HouseNumber') String? houseNumber;
  @JsonKey(name: 'Moo') String? moo;
  @JsonKey(name: 'Alley') String? alley;
  @JsonKey(name: 'Soi') String? soi;
  @JsonKey(name: 'Road') String? road;
  @JsonKey(name: 'Tambon') String? tambon;
  @JsonKey(name: 'Amphur') String? amphur;
  @JsonKey(name: 'Province') String? province;
  @JsonKey(name: 'ChangedNationalityStatus') String? changedNationalityStatus;
  @JsonKey(name: 'ChangedNationalityDate') String? changedNationalityDate;
  @JsonKey(name: 'Address') String? address;
  @JsonKey(name: 'Img') String? img;

  void addPersonDto(PersonDto? input){
    if(input ==null){
      pID="";
      title="";
      firstName="";
      lastName="";
      birthdate="";
      gender="";
      age="";
      moveInDate="";
      peopleStatus="";
      nationality="";
      houseOwnerStatus="";
      fatherPID="";
      fatherName="";
      fatherNationality="";
      motherPID="";
      motherName="";
      motherNationality="";
      houseID="";
      houseNumber="";
      moo="";
      alley="";
      soi="";
      road="";
      tambon="";
      amphur="";
      province="";
      changedNationalityStatus="";
      changedNationalityDate="";
      address="";
      img="";
      return;
    }
    // pID = input.pID;
    // title = input.title;
    // firstName = input.firstName;
    // lastName = input.lastName;
    // birthdate = input.birthdate;
    // gender = input.gender;
    // age = input.age ;
    // moveInDate = input.moveInDate;
    // peopleStatus = input.peopleStatus;
    // nationality = input.nationality;
    // houseOwnerStatus = input.houseOwnerStatus;
    // fatherPID = input.fatherPID;
    // fatherName = input.fatherName;
    // fatherNationality = input.fatherNationality;
    // motherPID = input.motherPID;
    // motherName = input.motherName;
    // motherNationality = input.motherNationality;
    // houseID = input.houseID;
    // houseNumber = input.houseNumber;
    // moo = input.moo;
    // alley = input.alley;
    // soi = input.soi;
    // road = input.road;
    // tambon = input.tambon;
    // amphur = input.amphur;
    // province = input.province;
    // changedNationalityStatus = input.changedNationalityStatus;
    // changedNationalityDate = input.changedNationalityDate;
    // address = input.address;

    pID = input.pID !=null ? input.pID :"";
    title = input.title !=null ? input.title :"";
    firstName = input.firstName !=null ? input.firstName :"";
    lastName = input.lastName !=null ? input.lastName :"";
    birthdate = input.birthdate !=null ? input.birthdate :"";
    gender = input.gender !=null ? input.gender :"";
    age = input.age !=null ? input.age :"";
    moveInDate = input.moveInDate !=null ? input.moveInDate :"";
    peopleStatus = input.peopleStatus !=null ? input.peopleStatus :"";
    nationality = input.nationality !=null ? input.nationality :"";
    houseOwnerStatus = input.houseOwnerStatus !=null ? input.houseOwnerStatus :"";
    fatherPID = input.fatherPID !=null ? input.fatherPID :"";
    fatherName = input.fatherName !=null ? input.fatherName :"";
    fatherNationality = input.fatherNationality !=null ? input.fatherNationality :"";
    motherPID = input.motherPID !=null ? input.motherPID :"";
    motherName = input.motherName !=null ? input.motherName :"";
    motherNationality = input.motherNationality !=null ? input.motherNationality :"";
    houseID = input.houseID !=null ? input.houseID :"";
    houseNumber = input.houseNumber !=null ? input.houseNumber :"";
    moo = input.moo !=null ? input.moo :"";
    alley = input.alley !=null ? input.alley :"";
    soi = input.soi !=null ? input.soi :"";
    road = input.road !=null ? input.road :"";
    tambon = input.tambon !=null ? input.tambon :"";
    amphur = input.amphur !=null ? input.amphur :"";
    province = input.province !=null ? input.province :"";
    changedNationalityStatus = input.changedNationalityStatus !=null ? input.changedNationalityStatus :"";
    changedNationalityDate = input.changedNationalityDate !=null ? input.changedNationalityDate :"";
    address = input.address !=null ? input.address :"";
  }
  void setImage(String input){
    // img = input;
    img = input != null ? input : "";
  }
}