// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponseDto _$GetUserResponseDtoFromJson(Map<String, dynamic> json) =>
    GetUserResponseDto(
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserResponseDtoToJson(GetUserResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user': instance.user,
    };
