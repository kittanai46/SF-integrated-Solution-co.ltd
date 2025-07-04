// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseDto _$HouseDtoFromJson(Map<String, dynamic> json) => HouseDto(
      houseID: json['HouseID'] as String?,
      registerName: json['RegisterName'] as String?,
      houseNo: json['HouseNo'] as String?,
      moo: json['Moo'] as String?,
      alley: json['Alley'] as String?,
      soi: json['Soi'] as String?,
      road: json['Road'] as String?,
      tambon: json['Tambon'] as String?,
      amphur: json['Amphur'] as String?,
      province: json['Province'] as String?,
      houseType: json['HouseType'] as String?,
      buildDate: json['BuildDate'] as String?,
      sellDate: json['SellDate'] as String?,
      villageName: json['VillageName'] as String?,
      buildingName: json['BuildingName'] as String?,
      buildingPlace: json['BuildingPlace'] as String?,
      postcode: json['Postcode'] as String?,
      houseShape: json['HouseShape'] as String?,
      houseSize: json['HouseSize'] as String?,
      areaNumber: json['AreaNumber'] as String?,
      document: json['document'] as String?,
      documentNo: json['documentNo'] as String?,
      laneAreaSize: json['LaneAreaSize'] as String?,
      telNumber: json['TelNumber'] as String?,
      approvalNo: json['ApprovalNo'] as String?,
      urbanAreaName: json['UrbanAreaName'] as String?,
    );

Map<String, dynamic> _$HouseDtoToJson(HouseDto instance) => <String, dynamic>{
      'HouseID': instance.houseID,
      'RegisterName': instance.registerName,
      'HouseNo': instance.houseNo,
      'Moo': instance.moo,
      'Alley': instance.alley,
      'Soi': instance.soi,
      'Road': instance.road,
      'Tambon': instance.tambon,
      'Amphur': instance.amphur,
      'Province': instance.province,
      'HouseType': instance.houseType,
      'BuildDate': instance.buildDate,
      'SellDate': instance.sellDate,
      'VillageName': instance.villageName,
      'BuildingName': instance.buildingName,
      'BuildingPlace': instance.buildingPlace,
      'Postcode': instance.postcode,
      'HouseShape': instance.houseShape,
      'HouseSize': instance.houseSize,
      'AreaNumber': instance.areaNumber,
      'document': instance.document,
      'documentNo': instance.documentNo,
      'LaneAreaSize': instance.laneAreaSize,
      'TelNumber': instance.telNumber,
      'ApprovalNo': instance.approvalNo,
      'UrbanAreaName': instance.urbanAreaName,
    };

ListHouseDto _$ListHouseDtoFromJson(Map<String, dynamic> json) => ListHouseDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HouseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListHouseDtoToJson(ListHouseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
