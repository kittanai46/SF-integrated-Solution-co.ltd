// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleInfoDto _$VehicleInfoDtoFromJson(Map<String, dynamic> json) =>
    VehicleInfoDto(
      carStatus: json['carStatus'] as String?,
      regDate: json['regDate'] as String?,
      plate1: json['plate1'] as String?,
      plate2: json['plate2'] as String?,
      offLocCode: json['offLocCode'] as String?,
      vehTypeDesc: json['vehTypeDesc'] as String?,
      kindDesc: json['kindDesc'] as String?,
      brnDesc: json['brnDesc'] as String?,
      modelName: json['modelName'] as String?,
      mfgYear: json['mfgYear'] as String?,
      numBody: json['numBody'] as String?,
      color: json['color'] as String?,
      expDate: json['expDate'] as String?,
      engBrnDesc: json['engBrnDesc'] as String?,
      numEng: json['numEng'] as String?,
      fuelDesc: json['fuelDesc'] as String?,
      gasNo: json['gasNo'] as String?,
      lpgGasExpireDate: json['lpgGasExpireDate'] as String?,
      gasEndCertDate: json['gasEndCertDate'] as String?,
      cly: json['cly'] as String?,
      cc: json['cc'] as String?,
      wgtCar: json['wgtCar'] as String?,
      holdFlag: json['holdFlag'] as String?,
      lastSignDate: json['lastSignDate'] as String?,
      lastChkDate: json['lastChkDate'] as String?,
      oldLastSignDate: json['oldLastSignDate'] as String?,
      own_fname: json['own_fname'] as String?,
      own_lname: json['own_lname'] as String?,
      own_addr: json['own_addr'] as String?,
      occ_fname: json['occ_fname'] as String?,
      occ_lname: json['occ_lname'] as String?,
      occ_addr: json['occ_addr'] as String?,
      noteDate: json['noteDate'] as String?,
      note: json['note'] as String?,
      own_pid: json['own_pid'] as String?,
      occ_pid: json['occ_pid'] as String?,
      taxExpired: json['taxExpired'] as String?,
    );

Map<String, dynamic> _$VehicleInfoDtoToJson(VehicleInfoDto instance) =>
    <String, dynamic>{
      'carStatus': instance.carStatus,
      'regDate': instance.regDate,
      'plate1': instance.plate1,
      'plate2': instance.plate2,
      'offLocCode': instance.offLocCode,
      'vehTypeDesc': instance.vehTypeDesc,
      'kindDesc': instance.kindDesc,
      'brnDesc': instance.brnDesc,
      'modelName': instance.modelName,
      'mfgYear': instance.mfgYear,
      'numBody': instance.numBody,
      'color': instance.color,
      'expDate': instance.expDate,
      'engBrnDesc': instance.engBrnDesc,
      'numEng': instance.numEng,
      'fuelDesc': instance.fuelDesc,
      'gasNo': instance.gasNo,
      'lpgGasExpireDate': instance.lpgGasExpireDate,
      'gasEndCertDate': instance.gasEndCertDate,
      'cly': instance.cly,
      'cc': instance.cc,
      'wgtCar': instance.wgtCar,
      'holdFlag': instance.holdFlag,
      'lastSignDate': instance.lastSignDate,
      'lastChkDate': instance.lastChkDate,
      'oldLastSignDate': instance.oldLastSignDate,
      'own_fname': instance.own_fname,
      'own_lname': instance.own_lname,
      'own_addr': instance.own_addr,
      'occ_fname': instance.occ_fname,
      'occ_lname': instance.occ_lname,
      'occ_addr': instance.occ_addr,
      'noteDate': instance.noteDate,
      'note': instance.note,
      'own_pid': instance.own_pid,
      'occ_pid': instance.occ_pid,
      'taxExpired': instance.taxExpired,
    };

ListVehicleInfoDto _$ListVehicleInfoDtoFromJson(Map<String, dynamic> json) =>
    ListVehicleInfoDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VehicleInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListVehicleInfoDtoToJson(ListVehicleInfoDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
