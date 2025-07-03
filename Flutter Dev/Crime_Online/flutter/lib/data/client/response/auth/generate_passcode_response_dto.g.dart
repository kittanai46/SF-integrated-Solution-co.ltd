// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_passcode_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratePasscodeResponseDto _$GeneratePasscodeResponseDtoFromJson(
        Map<String, dynamic> json) =>
    GeneratePasscodeResponseDto(
      passcode: json['passcode'] as String?,
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$GeneratePasscodeResponseDtoToJson(
        GeneratePasscodeResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'passcode': instance.passcode,
    };
