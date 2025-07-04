// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crimecase_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrimeCaseVehicleDto _$CrimeCaseVehicleDtoFromJson(Map<String, dynamic> json) =>
    CrimeCaseVehicleDto(
      bh: json['BH'] as String?,
      bk: json['BK'] as String?,
      orgCode: json['ORGCODE'] as String?,
      stationName: json['STATIONNAME'] as String?,
      caseNo: json['CASENO'] as String?,
      crimeCaseNo: json['CRIMECASENO'] as String?,
      crimeCaseYear: json['CRIMECASEYEAR'] as String?,
      noPlate_initial: json['NOPLATE_INITIAL'] as String?,
      noPlate_number: json['NOPLATE_NUMBER'] as String?,
      provinceName: json['PROVINCENAME'] as String?,
      chasisNumber: json['CHASISNUMBER'] as String?,
      engineNumber: json['ENGINENUMBER'] as String?,
      brandString: json['BRANDSTRING'] as String?,
      modelString: json['MODELSTRING'] as String?,
      color: json['COLOR'] as String?,
      isLostCar: json['ISLOSTCAR'] as String?,
      isIntercept: json['ISINTERCEPT'] as String?,
      ivvId: json['IVVID'] as String?,
      ccId: json['CCID'] as String?,
      fullNoPlate: json['FULLNOPLATE'] as String?,
      fullEngineNo: json['FULLENGINENO'] as String?,
      fullcaseNo: json['FULLCASENO'] as String?,
    );

Map<String, dynamic> _$CrimeCaseVehicleDtoToJson(
        CrimeCaseVehicleDto instance) =>
    <String, dynamic>{
      'BH': instance.bh,
      'BK': instance.bk,
      'ORGCODE': instance.orgCode,
      'STATIONNAME': instance.stationName,
      'CASENO': instance.caseNo,
      'CRIMECASENO': instance.crimeCaseNo,
      'CRIMECASEYEAR': instance.crimeCaseYear,
      'NOPLATE_INITIAL': instance.noPlate_initial,
      'NOPLATE_NUMBER': instance.noPlate_number,
      'PROVINCENAME': instance.provinceName,
      'CHASISNUMBER': instance.chasisNumber,
      'ENGINENUMBER': instance.engineNumber,
      'BRANDSTRING': instance.brandString,
      'MODELSTRING': instance.modelString,
      'COLOR': instance.color,
      'ISLOSTCAR': instance.isLostCar,
      'ISINTERCEPT': instance.isIntercept,
      'IVVID': instance.ivvId,
      'CCID': instance.ccId,
      'FULLNOPLATE': instance.fullNoPlate,
      'FULLENGINENO': instance.fullEngineNo,
      'FULLCASENO': instance.fullcaseNo,
    };

ListCrimeCaseVehicleDto _$ListCrimeCaseVehicleDtoFromJson(
        Map<String, dynamic> json) =>
    ListCrimeCaseVehicleDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CrimeCaseVehicleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCrimeCaseVehicleDtoToJson(
        ListCrimeCaseVehicleDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
