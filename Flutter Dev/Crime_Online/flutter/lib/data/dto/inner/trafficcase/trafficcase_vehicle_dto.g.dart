// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trafficcase_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrafficCaseVehicleDto _$TrafficCaseVehicleDtoFromJson(
        Map<String, dynamic> json) =>
    TrafficCaseVehicleDto(
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
      isArrestStatus: json['ISARRESTSTATUS'] as String?,
      isRegain: json['ISREGAIN'] as String?,
      isEvidence: json['ISEVIDENCE'] as String?,
      ivvId: json['IVVID'] as String?,
      tcId: json['TCID'] as String?,
      fullNoPlate: json['FULLNOPLATE'] as String?,
      fullEngineNo: json['FULLENGINENO'] as String?,
      fullcaseNo: json['FULLCASENO'] as String?,
    );

Map<String, dynamic> _$TrafficCaseVehicleDtoToJson(
        TrafficCaseVehicleDto instance) =>
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
      'ISARRESTSTATUS': instance.isArrestStatus,
      'ISREGAIN': instance.isRegain,
      'ISEVIDENCE': instance.isEvidence,
      'IVVID': instance.ivvId,
      'TCID': instance.tcId,
      'FULLNOPLATE': instance.fullNoPlate,
      'FULLENGINENO': instance.fullEngineNo,
      'FULLCASENO': instance.fullcaseNo,
    };

ListTrafficCaseVehicleDto _$ListTrafficCaseVehicleDtoFromJson(
        Map<String, dynamic> json) =>
    ListTrafficCaseVehicleDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => TrafficCaseVehicleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTrafficCaseVehicleDtoToJson(
        ListTrafficCaseVehicleDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
