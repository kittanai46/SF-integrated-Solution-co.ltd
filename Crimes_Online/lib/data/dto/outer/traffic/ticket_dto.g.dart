// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => TicketDto(
      ticketStatus: json['ticket_STATUS'] as String?,
      plate: json['plate'] as String?,
      ticketId: json['ticket_ID'] as String?,
      cardId: json['card_ID'] as String?,
      fullname: json['fullname'] as String?,
      occurDt: json['occur_DT'] as String?,
      place: json['place'] as String?,
      crossDescHappen: json['cross_DESC_HAPPEN'] as String?,
      soiHappen: json['soi_HAPPEN'] as String?,
      roadHappen: json['road_HAPPEN'] as String?,
      subdistrictHappen: json['subdistrict_HAPPEN'] as String?,
      districtHappen: json['district_HAPPEN'] as String?,
      atkilometerHappen: json['atkilometer_HAPPEN'] as String?,
      accuse1Code: json['accuse1_CODE'] as String?,
      fine1: json['fine1'] as String?,
      accuse2Code: json['accuse2_CODE'] as String?,
      fine2: json['fine2'] as String?,
      accuse3Code: json['accuse3_CODE'] as String?,
      fine3: json['fine3'] as String?,
      accuse4Code: json['accuse4_CODE'] as String?,
      fine4: json['fine4'] as String?,
      accuse5Code: json['accuse5_CODE'] as String?,
      fine5: json['fine5'] as String?,
      pic1: json['pic1'] as String?,
      pic2: json['pic2'] as String?,
      pic3: json['pic3'] as String?,
      fineAmt: json['fine_AMT'] as String?,
      ticketDate: json['ticket_DATE'] as String?,
      orgCode: json['org_CODE'] as String?,
      orgAbbr: json['org_ABBR'] as String?,
      tel: json['tel'] as String?,
      fineDueDate: json['fine_DUE_DATE'] as String?,
      paidDate: json['paid_DATE'] as String?,
      paidBy: json['paid_BY'] as String?,
    );

Map<String, dynamic> _$TicketDtoToJson(TicketDto instance) => <String, dynamic>{
      'ticket_STATUS': instance.ticketStatus,
      'plate': instance.plate,
      'ticket_ID': instance.ticketId,
      'card_ID': instance.cardId,
      'fullname': instance.fullname,
      'occur_DT': instance.occurDt,
      'place': instance.place,
      'cross_DESC_HAPPEN': instance.crossDescHappen,
      'soi_HAPPEN': instance.soiHappen,
      'road_HAPPEN': instance.roadHappen,
      'subdistrict_HAPPEN': instance.subdistrictHappen,
      'district_HAPPEN': instance.districtHappen,
      'atkilometer_HAPPEN': instance.atkilometerHappen,
      'accuse1_CODE': instance.accuse1Code,
      'fine1': instance.fine1,
      'accuse2_CODE': instance.accuse2Code,
      'fine2': instance.fine2,
      'accuse3_CODE': instance.accuse3Code,
      'fine3': instance.fine3,
      'accuse4_CODE': instance.accuse4Code,
      'fine4': instance.fine4,
      'accuse5_CODE': instance.accuse5Code,
      'fine5': instance.fine5,
      'pic1': instance.pic1,
      'pic2': instance.pic2,
      'pic3': instance.pic3,
      'fine_AMT': instance.fineAmt,
      'ticket_DATE': instance.ticketDate,
      'org_CODE': instance.orgCode,
      'org_ABBR': instance.orgAbbr,
      'tel': instance.tel,
      'fine_DUE_DATE': instance.fineDueDate,
      'paid_DATE': instance.paidDate,
      'paid_BY': instance.paidBy,
    };

ListTicketDto _$ListTicketDtoFromJson(Map<String, dynamic> json) =>
    ListTicketDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TicketDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListTicketDtoToJson(ListTicketDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
