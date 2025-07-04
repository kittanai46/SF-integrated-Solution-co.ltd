// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warrantcourtcrd_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantCourtCRDDto _$WarrantCourtCRDDtoFromJson(Map<String, dynamic> json) =>
    WarrantCourtCRDDto(
      id: json['ID'] as String?,
      court_code: json['COURT_CODE'] as String?,
      woa_type: json['WOA_TYPE'] as String?,
      woa_year: json['WOA_YEAR'] as String?,
      woa_no: json['WOA_NO'] as String?,
      woa_date: json['WOA_DATE'] as String?,
      woa_start_date: json['WOA_START_DATE'] as String?,
      woa_end_date: json['WOA_END_DATE'] as String?,
      req_num_case_type_id: json['REQ_NUM_CASE_TYPE_ID'] as String?,
      police_station_id: json['POLICE_STATION_ID'] as String?,
      black_case_num_prefix: json['BLACK_CASE_NUM_PREFIX'] as String?,
      black_case_num: json['BLACK_CASE_NUM'] as String?,
      black_case_num_year: json['BLACK_CASE_NUM_YEAR'] as String?,
      red_case_num_prefix: json['RED_CASE_NUM_PREFIX'] as String?,
      red_case_num: json['RED_CASE_NUM'] as String?,
      red_case_num_year: json['RED_CASE_NUM_YEAR'] as String?,
      fault_type_id: json['FAULT_TYPE_ID'] as String?,
      plaintiff: json['PLAINTIFF'] as String?,
      accused: json['ACCUSED'] as String?,
      send_to_name: json['SEND_TO_NAME'] as String?,
      cause_text: json['CAUSE_TEXT'] as String?,
      charge: json['CHARGE'] as String?,
      charge_type_1: json['CHARGE_TYPE_1'] as String?,
      charge_type_2: json['CHARGE_TYPE_2'] as String?,
      charge_type_2_1: json['CHARGE_TYPE_2_1'] as String?,
      charge_type_2_2: json['CHARGE_TYPE_2_2'] as String?,
      charge_type_2_3: json['CHARGE_TYPE_2_3'] as String?,
      charge_type_3: json['CHARGE_TYPE_3'] as String?,
      charge_other_text: json['CHARGE_OTHER_TEXT'] as String?,
      acc_full_name: json['ACC_FULL_NAME'] as String?,
      acc_card_type: json['ACC_CARD_TYPE'] as String?,
      acc_card_id: json['ACC_CARD_ID'] as String?,
      acc_origin: json['ACC_ORIGIN'] as String?,
      acc_nation: json['ACC_NATION'] as String?,
      acc_occupation: json['ACC_OCCUPATION'] as String?,
      acc_addno: json['ACC_ADDNO'] as String?,
      acc_vilno: json['ACC_VILNO'] as String?,
      acc_road: json['ACC_ROAD'] as String?,
      acc_soi: json['ACC_SOI'] as String?,
      acc_near: json['ACC_NEAR'] as String?,
      acc_sub_district: json['ACC_SUB_DISTRICT'] as String?,
      acc_district: json['ACC_DISTRICT'] as String?,
      acc_province: json['ACC_PROVINCE'] as String?,
      acc_tel: json['ACC_TEL'] as String?,
      send_to_court_id: json['SEND_TO_COURT_ID'] as String?,
      prescription: json['PRESCRIPTION'] as String?,
      judge_name: json['JUDGE_NAME'] as String?,
      court_injunction: json['COURT_INJUNCTION'] as String?,
      appointment_type: json['APPOINTMENT_TYPE'] as String?,
      appointment_date: json['APPOINTMENT_DATE'] as String?,
      arrest_result: json['ARREST_RESULT'] as String?,
      arrest_date: json['ARREST_DATE'] as String?,
      arrest_result_other_text: json['ARREST_RESULT_OTHER_TEXT'] as String?,
      prescription_unit: json['PRESCRIPTION_UNIT'] as String?,
      because: json['BECAUSE'] as String?,
      arrest_status: json['ARREST_STATUS'] as String?,
      warrant_doc: json['WARRANT_DOC'] as String?,
      rec_flg: json['REC_FLG'] as String?,
      recieve_date: json['RECIEVE_DATE'] as String?,
    );

Map<String, dynamic> _$WarrantCourtCRDDtoToJson(WarrantCourtCRDDto instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'COURT_CODE': instance.court_code,
      'WOA_TYPE': instance.woa_type,
      'WOA_YEAR': instance.woa_year,
      'WOA_NO': instance.woa_no,
      'WOA_DATE': instance.woa_date,
      'WOA_START_DATE': instance.woa_start_date,
      'WOA_END_DATE': instance.woa_end_date,
      'REQ_NUM_CASE_TYPE_ID': instance.req_num_case_type_id,
      'POLICE_STATION_ID': instance.police_station_id,
      'BLACK_CASE_NUM_PREFIX': instance.black_case_num_prefix,
      'BLACK_CASE_NUM': instance.black_case_num,
      'BLACK_CASE_NUM_YEAR': instance.black_case_num_year,
      'RED_CASE_NUM_PREFIX': instance.red_case_num_prefix,
      'RED_CASE_NUM': instance.red_case_num,
      'RED_CASE_NUM_YEAR': instance.red_case_num_year,
      'FAULT_TYPE_ID': instance.fault_type_id,
      'PLAINTIFF': instance.plaintiff,
      'ACCUSED': instance.accused,
      'SEND_TO_NAME': instance.send_to_name,
      'CAUSE_TEXT': instance.cause_text,
      'CHARGE': instance.charge,
      'CHARGE_TYPE_1': instance.charge_type_1,
      'CHARGE_TYPE_2': instance.charge_type_2,
      'CHARGE_TYPE_2_1': instance.charge_type_2_1,
      'CHARGE_TYPE_2_2': instance.charge_type_2_2,
      'CHARGE_TYPE_2_3': instance.charge_type_2_3,
      'CHARGE_TYPE_3': instance.charge_type_3,
      'CHARGE_OTHER_TEXT': instance.charge_other_text,
      'ACC_FULL_NAME': instance.acc_full_name,
      'ACC_CARD_TYPE': instance.acc_card_type,
      'ACC_CARD_ID': instance.acc_card_id,
      'ACC_ORIGIN': instance.acc_origin,
      'ACC_NATION': instance.acc_nation,
      'ACC_OCCUPATION': instance.acc_occupation,
      'ACC_ADDNO': instance.acc_addno,
      'ACC_VILNO': instance.acc_vilno,
      'ACC_ROAD': instance.acc_road,
      'ACC_SOI': instance.acc_soi,
      'ACC_NEAR': instance.acc_near,
      'ACC_SUB_DISTRICT': instance.acc_sub_district,
      'ACC_DISTRICT': instance.acc_district,
      'ACC_PROVINCE': instance.acc_province,
      'ACC_TEL': instance.acc_tel,
      'SEND_TO_COURT_ID': instance.send_to_court_id,
      'PRESCRIPTION': instance.prescription,
      'JUDGE_NAME': instance.judge_name,
      'COURT_INJUNCTION': instance.court_injunction,
      'APPOINTMENT_TYPE': instance.appointment_type,
      'APPOINTMENT_DATE': instance.appointment_date,
      'ARREST_RESULT': instance.arrest_result,
      'ARREST_DATE': instance.arrest_date,
      'ARREST_RESULT_OTHER_TEXT': instance.arrest_result_other_text,
      'PRESCRIPTION_UNIT': instance.prescription_unit,
      'BECAUSE': instance.because,
      'ARREST_STATUS': instance.arrest_status,
      'WARRANT_DOC': instance.warrant_doc,
      'REC_FLG': instance.rec_flg,
      'RECIEVE_DATE': instance.recieve_date,
    };

ListWarrantCourtCRDDto _$ListWarrantCourtCRDDtoFromJson(
        Map<String, dynamic> json) =>
    ListWarrantCourtCRDDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WarrantCourtCRDDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListWarrantCourtCRDDtoToJson(
        ListWarrantCourtCRDDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
