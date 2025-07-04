// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_address_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeAddressResponseDto _$ChangeAddressResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ChangeAddressResponseDto(
      listChangeAddressDto: json['list_change_address'] == null
          ? null
          : ListChangeAddressDto.fromJson(
              json['list_change_address'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeAddressResponseDtoToJson(
        ChangeAddressResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'list_change_address': instance.listChangeAddressDto,
    };
