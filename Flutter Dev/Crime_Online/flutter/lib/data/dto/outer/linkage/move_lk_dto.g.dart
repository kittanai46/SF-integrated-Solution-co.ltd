// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_lk_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveLkDto _$MoveLkDtoFromJson(Map<String, dynamic> json) => MoveLkDto(
      description: json['move.description'] as String?,
      documentNo: json['move.documentNo'] as String?,
      alleyDesc: json['move.house.address.alleyDesc'] as String?,
      alleyWayDesc: json['move.house.address.alleyWayDesc'] as String?,
      districtDesc: json['move.house.address.districtDesc'] as String?,
      houseNo: json['move.house.address.houseNo'] as String?,
      provinceDesc: json['move.house.address.provinceDesc'] as String?,
      roadDesc: json['move.house.address.roadDesc'] as String?,
      subdistrictDesc: json['move.house.address.subdistrictDesc'] as String?,
      villageNo: json['move.house.address.villageNo'] as String?,
      houseID: json['move.house.houseID'] as String?,
      houseOwner: json['move.house.houseOwner'] as String?,
      moveDate: json['move.house.moveDate'] as String?,
      rcodeCode: json['move.inform.rcodeCode'] as String?,
      rcodeDesc: json['move.inform.rcodeDesc'] as String?,
      oldDateMoveIn: json['move.oldDateMoveIn'] as String?,
      dateOfBirth: json['move.own.dateOfBirth'] as String?,
      fatherName: json['move.own.father.name'] as String?,
      fatherNationalityDesc: json['move.own.father.nationalityDesc'] as String?,
      fatherPersonalID: json['move.own.father.personalID'] as String?,
      firstName: json['move.own.firstName'] as String?,
      gender: json['move.own.gender'] as String?,
      lastName: json['move.own.lastName'] as String?,
      middleName: json['move.own.middleName'] as String?,
      motherName: json['move.own.mother.name'] as String?,
      motherNationalityDesc: json['move.own.mother.nationalityDesc'] as String?,
      motherPersonalID: json['move.own.mother.personalID'] as String?,
      nationalityDesc: json['move.own.nationalityDesc'] as String?,
      personalID: json['move.own.personalID'] as String?,
      titleDesc: json['move.own.titleDesc'] as String?,
      petitionNo: json['move.petitionNo'] as String?,
      terminateDate: json['move.terminateDate'] as String?,
      type: json['move.type'] as String?,
    );

Map<String, dynamic> _$MoveLkDtoToJson(MoveLkDto instance) => <String, dynamic>{
      'move.description': instance.description,
      'move.documentNo': instance.documentNo,
      'move.house.address.alleyDesc': instance.alleyDesc,
      'move.house.address.alleyWayDesc': instance.alleyWayDesc,
      'move.house.address.districtDesc': instance.districtDesc,
      'move.house.address.houseNo': instance.houseNo,
      'move.house.address.provinceDesc': instance.provinceDesc,
      'move.house.address.roadDesc': instance.roadDesc,
      'move.house.address.subdistrictDesc': instance.subdistrictDesc,
      'move.house.address.villageNo': instance.villageNo,
      'move.house.houseID': instance.houseID,
      'move.house.houseOwner': instance.houseOwner,
      'move.house.moveDate': instance.moveDate,
      'move.inform.rcodeCode': instance.rcodeCode,
      'move.inform.rcodeDesc': instance.rcodeDesc,
      'move.oldDateMoveIn': instance.oldDateMoveIn,
      'move.own.dateOfBirth': instance.dateOfBirth,
      'move.own.father.name': instance.fatherName,
      'move.own.father.nationalityDesc': instance.fatherNationalityDesc,
      'move.own.father.personalID': instance.fatherPersonalID,
      'move.own.firstName': instance.firstName,
      'move.own.gender': instance.gender,
      'move.own.lastName': instance.lastName,
      'move.own.middleName': instance.middleName,
      'move.own.mother.name': instance.motherName,
      'move.own.mother.nationalityDesc': instance.motherNationalityDesc,
      'move.own.mother.personalID': instance.motherPersonalID,
      'move.own.nationalityDesc': instance.nationalityDesc,
      'move.own.personalID': instance.personalID,
      'move.own.titleDesc': instance.titleDesc,
      'move.petitionNo': instance.petitionNo,
      'move.terminateDate': instance.terminateDate,
      'move.type': instance.type,
    };

ListMoveLkDto _$ListMoveLkDtoFromJson(Map<String, dynamic> json) =>
    ListMoveLkDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MoveLkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListMoveLkDtoToJson(ListMoveLkDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
