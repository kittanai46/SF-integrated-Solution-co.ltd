// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeAddressDto _$ChangeAddressDtoFromJson(Map<String, dynamic> json) =>
    ChangeAddressDto(
      oldHouseID: json['OldHouseID'] as String?,
      moveInDate: json['MoveInDate'] as String?,
      moveOutDate: json['MoveOutDate'] as String?,
      oldLocation: json['OldLocation'] as String?,
    );

Map<String, dynamic> _$ChangeAddressDtoToJson(ChangeAddressDto instance) =>
    <String, dynamic>{
      'OldHouseID': instance.oldHouseID,
      'MoveInDate': instance.moveInDate,
      'MoveOutDate': instance.moveOutDate,
      'OldLocation': instance.oldLocation,
    };

ListChangeAddressDto _$ListChangeAddressDtoFromJson(
        Map<String, dynamic> json) =>
    ListChangeAddressDto(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChangeAddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListChangeAddressDtoToJson(
        ListChangeAddressDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
