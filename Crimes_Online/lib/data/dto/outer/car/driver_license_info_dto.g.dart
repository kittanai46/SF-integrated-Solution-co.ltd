// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_license_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverLicenseInfoDto _$DriverLicenseInfoDtoFromJson(
        Map<String, dynamic> json) =>
    DriverLicenseInfoDto(
      docType: json['DRL04_docType'] as String?,
      idNo: json['DRL04_ID_NO'] as String?,
      titleDesc: json['DRL04_TitleDesc'] as String?,
      fName: json['DRL04_FNAME'] as String?,
      lName: json['DRL04_Lname'] as String?,
      titleEngDesc: json['DRL04_TitleEngDesc'] as String?,
      fNameEng: json['DRL04_FNameEng'] as String?,
      lNameEng: json['DRL04_LNameEng'] as String?,
      birthDate: json['DRL04_BirthDate'] as String?,
      sex: json['DRL04_SEX'] as String?,
      sexDesc: json['DRL04_SEX_DESC'] as String?,
      addrNo: json['DRL04_AddrNo'] as String?,
      bldName: json['DRL04_BldName'] as String?,
      villageName: json['DRL04_VillageName'] as String?,
      villageNo: json['DRL04_VillageNo'] as String?,
      soi: json['DRL04_Soi'] as String?,
      street: json['DRL04_Street'] as String?,
      locCode: json['DRL04_LocCode'] as String?,
      zipCode: json['DRL04_ZipCode'] as String?,
      locDesc: json['DRL04_LocDesc'] as String?,
      offLocCode: json['DRL04_OffLocCode'] as String?,
      pltDesc: json['DRL04_pltDesc'] as String?,
      locFullDesc: json['DRL04_locFullDesc'] as String?,
      natCode: json['DRL04_natCode'] as String?,
      rcpNo: json['DRL04_rcpNo'] as String?,
      pcNo: json['DRL04_pcNo'] as String?,
      conditionDesc: json['DRL04_conditionDesc'] as String?,
      natDesc: json['DRL04_natDesc'] as String?,
      excFee: json['DRL04_excFee'] as String?,
      rvkFlag: json['DRL04_rvkFlag'] as String?,
      pltCode: json['DRL04_pltCode'] as String?,
      pltNo: json['DRL04_pltNo'] as String?,
      issDate: json['DRL04_issDate'] as String?,
      expDate: json['DRL04_expDate'] as String?,
      srlNo: json['DRL04_srlNo'] as String?,
      tambon: json['DRL04_Tambon'] as String?,
      amphur: json['DRL04_Amphur'] as String?,
      province: json['DRL04_Province'] as String?,
    )..statusExpired = json['DRL04_statusExpired'] as String?;

Map<String, dynamic> _$DriverLicenseInfoDtoToJson(
        DriverLicenseInfoDto instance) =>
    <String, dynamic>{
      'DRL04_docType': instance.docType,
      'DRL04_ID_NO': instance.idNo,
      'DRL04_TitleDesc': instance.titleDesc,
      'DRL04_FNAME': instance.fName,
      'DRL04_Lname': instance.lName,
      'DRL04_TitleEngDesc': instance.titleEngDesc,
      'DRL04_FNameEng': instance.fNameEng,
      'DRL04_LNameEng': instance.lNameEng,
      'DRL04_BirthDate': instance.birthDate,
      'DRL04_SEX': instance.sex,
      'DRL04_SEX_DESC': instance.sexDesc,
      'DRL04_AddrNo': instance.addrNo,
      'DRL04_BldName': instance.bldName,
      'DRL04_VillageName': instance.villageName,
      'DRL04_VillageNo': instance.villageNo,
      'DRL04_Soi': instance.soi,
      'DRL04_Street': instance.street,
      'DRL04_LocCode': instance.locCode,
      'DRL04_ZipCode': instance.zipCode,
      'DRL04_LocDesc': instance.locDesc,
      'DRL04_OffLocCode': instance.offLocCode,
      'DRL04_pltDesc': instance.pltDesc,
      'DRL04_locFullDesc': instance.locFullDesc,
      'DRL04_natCode': instance.natCode,
      'DRL04_rcpNo': instance.rcpNo,
      'DRL04_pcNo': instance.pcNo,
      'DRL04_conditionDesc': instance.conditionDesc,
      'DRL04_natDesc': instance.natDesc,
      'DRL04_excFee': instance.excFee,
      'DRL04_rvkFlag': instance.rvkFlag,
      'DRL04_pltCode': instance.pltCode,
      'DRL04_pltNo': instance.pltNo,
      'DRL04_issDate': instance.issDate,
      'DRL04_expDate': instance.expDate,
      'DRL04_srlNo': instance.srlNo,
      'DRL04_Tambon': instance.tambon,
      'DRL04_Amphur': instance.amphur,
      'DRL04_Province': instance.province,
      'DRL04_statusExpired': instance.statusExpired,
    };

ListDriverLicenseInfoDto _$ListDriverLicenseInfoDtoFromJson(
        Map<String, dynamic> json) =>
    ListDriverLicenseInfoDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DriverLicenseInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListDriverLicenseInfoDtoToJson(
        ListDriverLicenseInfoDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
