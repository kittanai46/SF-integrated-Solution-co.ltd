import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'encrypt_request_dto.g.dart';

@JsonSerializable()
class EncryptRequestDto {
  EncryptRequestDto({required this.data, required this.nonce});

  factory EncryptRequestDto.fromJson(Map<String, dynamic> json) => _$EncryptRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptRequestDtoToJson(this);

  @JsonKey(name: 'data') String data;
  @JsonKey(name: 'nonce') String nonce;
}