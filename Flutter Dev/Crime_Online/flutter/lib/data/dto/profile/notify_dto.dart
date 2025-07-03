import 'package:json_annotation/json_annotation.dart';

part 'notify_dto.g.dart';

@JsonSerializable()
class NotifyDto {
  NotifyDto({
    this.title,
    this.content,
    this.readFlag,
    this.readDate,
    this.newFlag,
    this.createdDate,
    this.createdDateSort,
    this.notifyId,
    this.type,
    this.url,
  });

  factory NotifyDto.fromJson(Map<String, dynamic> json) => _$NotifyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$NotifyDtoToJson(this);
  @JsonKey(name: 'title') String? title;
  @JsonKey(name: 'content') String? content;
  @JsonKey(name: 'read_flag') String? readFlag;
  @JsonKey(name: 'read_date') String? readDate;
  @JsonKey(name: 'new_flag') String? newFlag;
  @JsonKey(name: 'created_date') String? createdDate;
  @JsonKey(name: 'created_date_sort') String? createdDateSort;
  @JsonKey(name: 'notify_id') String? notifyId;
  @JsonKey(name: 'type') String? type;
  @JsonKey(name: 'url') String? url;

}

@JsonSerializable()
class ListNotifyDto {
  ListNotifyDto({
    this.status,
    this.data,
  });

  factory ListNotifyDto.fromJson(Map<String, dynamic> json) => _$ListNotifyDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListNotifyDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<NotifyDto>? data;
}