import 'package:json_annotation/json_annotation.dart';

part 'card_dto.g.dart';

@JsonSerializable()
class CardDto {
  CardDto({
    this.pB1Number,
    this.pB1CreateDate,
  });

  factory CardDto.fromJson(Map<String, dynamic> json) => _$CardDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CardDtoToJson(this);
 
  @JsonKey(name: 'PB1Number') String? pB1Number;
  @JsonKey(name: 'PB1CreateDate') String? pB1CreateDate;  // Date and Time

}

@JsonSerializable()
class ListCardDto {
  ListCardDto({
    this.status,
    this.data,
  });

  factory ListCardDto.fromJson(Map<String, dynamic> json) => _$ListCardDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListCardDtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<CardDto>? data;
}

class CardConstant {
  CardConstant._();

  static const String m_pB1Number = 'หมายเลข บป. 1';
  static const String m_pB1CreateDate = 'วันที่พิมพ์บัตร';
}