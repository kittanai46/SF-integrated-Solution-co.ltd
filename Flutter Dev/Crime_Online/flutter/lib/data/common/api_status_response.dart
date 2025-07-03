import 'package:json_annotation/json_annotation.dart';

mixin ApiStatusResponse {

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'message') String? message;
}
