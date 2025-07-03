// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyCarDto _$EmergencyCarDtoFromJson(Map<String, dynamic> json) =>
    EmergencyCarDto(
      signalColor: json['SignalColor'] as String?,
      pvaName: json['pvaname'] as String?,
      amaName: json['amaname'] as String?,
      noPlateNumber: json['NoPlate_number'] as String?,
      tmaName: json['tmaname'] as String?,
      onAMission: json['On_A_Mission'] as String?,
      policeStation: json['PoliceStation'] as String?,
      licenseNumber: json['License_Number'] as String?,
      permissionFirstName: json['PermissionFirstName'] as String?,
      carColor: json['CarColor'] as String?,
      emergencyVehicleType: json['EmergencyVehicleType'] as String?,
      permissionSurName: json['PermissionSurName'] as String?,
      acceptDate: json['AcceptDate'] as String?,
      policeStationPermission: json['PoliceStationPermission'] as String?,
      position: json['Position'] as String?,
      firstName: json['FirstName'] as String?,
      rank: json['Rank'] as String?,
      surName: json['SurName'] as String?,
      province: json['Province'] as String?,
      permissionAddress: json['PermissionAddress'] as String?,
      noPlateInitial: json['NoPlate_initial'] as String?,
      expirationDate: json['ExpirationDate'] as String?,
      permissionRank: json['PermissionRank'] as String?,
      carType: json['CarType'] as String?,
      carBrand: json['CarBrand'] as String?,
      signalSound: json['SignalSound'] as String?,
      isExpire: json['IsExpire'] as String?,
      rankApprove: json['RankApprove'] as String?,
      firstNameApprove: json['FirstNameApprove'] as String?,
      surNameApprove: json['SurNameApprove'] as String?,
      positionApprove: json['PositionApprove'] as String?,
      policeStationApprove: json['PoliceStationApprove'] as String?,
    );

Map<String, dynamic> _$EmergencyCarDtoToJson(EmergencyCarDto instance) =>
    <String, dynamic>{
      'SignalColor': instance.signalColor,
      'pvaname': instance.pvaName,
      'amaname': instance.amaName,
      'NoPlate_number': instance.noPlateNumber,
      'tmaname': instance.tmaName,
      'On_A_Mission': instance.onAMission,
      'PoliceStation': instance.policeStation,
      'License_Number': instance.licenseNumber,
      'PermissionFirstName': instance.permissionFirstName,
      'CarColor': instance.carColor,
      'EmergencyVehicleType': instance.emergencyVehicleType,
      'PermissionSurName': instance.permissionSurName,
      'AcceptDate': instance.acceptDate,
      'PoliceStationPermission': instance.policeStationPermission,
      'Position': instance.position,
      'FirstName': instance.firstName,
      'Rank': instance.rank,
      'SurName': instance.surName,
      'Province': instance.province,
      'PermissionAddress': instance.permissionAddress,
      'NoPlate_initial': instance.noPlateInitial,
      'ExpirationDate': instance.expirationDate,
      'PermissionRank': instance.permissionRank,
      'CarType': instance.carType,
      'CarBrand': instance.carBrand,
      'SignalSound': instance.signalSound,
      'IsExpire': instance.isExpire,
      'RankApprove': instance.rankApprove,
      'FirstNameApprove': instance.firstNameApprove,
      'SurNameApprove': instance.surNameApprove,
      'PositionApprove': instance.positionApprove,
      'PoliceStationApprove': instance.policeStationApprove,
    };

ListEmergencyCarDto _$ListEmergencyCarDtoFromJson(Map<String, dynamic> json) =>
    ListEmergencyCarDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmergencyCarDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListEmergencyCarDtoToJson(
        ListEmergencyCarDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
