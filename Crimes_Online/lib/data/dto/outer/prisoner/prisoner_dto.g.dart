// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prisoner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrisonerDto _$PrisonerDtoFromJson(Map<String, dynamic> json) => PrisonerDto(
      recDate: json['REC_DATE'] as String?,
      rowNum: json['ROWNUM'] as String?,
      generalSex: json['GENERAL_SEX'] as String?,
      generalBlemish: json['GENERAL_BLEMISH'] as String?,
      relAmphur: json['REL_AMPHUR'] as String?,
      raceName: json['RACE_NAME'] as String?,
      nationalityName: json['NATIONALITY_NAME'] as String?,
      relTumbon: json['REL_TUMBON'] as String?,
      prisonProvinceName: json['PRISON_PROVINCE_NAME'] as String?,
      caseBase: json['CASE_BASE'] as String?,
      prisonLname: json['PRISON_LNAME'] as String?,
      histIdCard: json['HIST_ID_CARD'] as String?,
      distDate: json['DIST_DATE'] as String?,
      prisonerId: json['PRISONER_ID'] as String?,
      age: json['AGE'] as String?,
      imposeEndDate: json['IMPOSE_END_DATE'] as String?,
      prisonCode: json['PRISON_CODE'] as String?,
      relAddrLine1: json['REL_ADDR_LINE_1'] as String?,
      relAddrLine2: json['REL_ADDR_LINE_2'] as String?,
      prisonRegionCode: json['PRISON_REGION_CODE'] as String?,
      generalDob: json['GENERAL_DOB'] as String?,
      relContactName: json['REL_CONTACT_NAME'] as String?,
      domicileProvinceName: json['DOMICILE_PROVINCE_NAME'] as String?,
      prisonName: json['PRISON_NAME'] as String?,
      prisonAreaName: json['PRISON_AREA_NAME'] as String?,
      prisonFname: json['PRISON_FNAME'] as String?,
      title: json['TITLE'] as String?,
      imposeStartDate: json['IMPOSE_START_DATE'] as String?,
      relAddrLine3: json['REL_ADDR_LINE_3'] as String?,
      relProvince: json['REL_PROVINCE'] as String?,
      contactTelNo1: json['CONTACT_TEL_NO_1'] as String?,
      punismentType: json['PUNISHMENT_TYPE'] as String?,
      image: json['IMAGE'] as String?,
    )..img = json['Img'] as String?;

Map<String, dynamic> _$PrisonerDtoToJson(PrisonerDto instance) =>
    <String, dynamic>{
      'REC_DATE': instance.recDate,
      'ROWNUM': instance.rowNum,
      'GENERAL_SEX': instance.generalSex,
      'GENERAL_BLEMISH': instance.generalBlemish,
      'REL_AMPHUR': instance.relAmphur,
      'RACE_NAME': instance.raceName,
      'NATIONALITY_NAME': instance.nationalityName,
      'REL_TUMBON': instance.relTumbon,
      'PRISON_PROVINCE_NAME': instance.prisonProvinceName,
      'CASE_BASE': instance.caseBase,
      'PRISON_LNAME': instance.prisonLname,
      'HIST_ID_CARD': instance.histIdCard,
      'DIST_DATE': instance.distDate,
      'PRISONER_ID': instance.prisonerId,
      'AGE': instance.age,
      'IMPOSE_END_DATE': instance.imposeEndDate,
      'PRISON_CODE': instance.prisonCode,
      'REL_ADDR_LINE_1': instance.relAddrLine1,
      'REL_ADDR_LINE_2': instance.relAddrLine2,
      'PRISON_REGION_CODE': instance.prisonRegionCode,
      'GENERAL_DOB': instance.generalDob,
      'REL_CONTACT_NAME': instance.relContactName,
      'DOMICILE_PROVINCE_NAME': instance.domicileProvinceName,
      'PRISON_NAME': instance.prisonName,
      'PRISON_AREA_NAME': instance.prisonAreaName,
      'PRISON_FNAME': instance.prisonFname,
      'TITLE': instance.title,
      'IMPOSE_START_DATE': instance.imposeStartDate,
      'REL_ADDR_LINE_3': instance.relAddrLine3,
      'REL_PROVINCE': instance.relProvince,
      'CONTACT_TEL_NO_1': instance.contactTelNo1,
      'PUNISHMENT_TYPE': instance.punismentType,
      'IMAGE': instance.image,
      'Img': instance.img,
    };

ListPrisonerDto _$ListPrisonerDtoFromJson(Map<String, dynamic> json) =>
    ListPrisonerDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PrisonerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListPrisonerDtoToJson(ListPrisonerDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
