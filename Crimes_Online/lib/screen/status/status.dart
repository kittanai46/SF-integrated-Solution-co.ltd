import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'status.freezed.dart';

@freezed
abstract class Status with _$Status {
  const factory Status(dynamic value) = Success;

  const factory Status.loading() = Loading;

  const factory Status.initial() = Initial;

  const factory Status.error(Exception error) = ErrorDetails;
}
