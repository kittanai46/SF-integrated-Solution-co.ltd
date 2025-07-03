import 'package:crimes/data/dto/outer/linkage/person_lk_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/image_dto.dart';
import 'house_lk_dto.dart';
import 'make_card_lk_dto.dart';

part 'lk2_group1_dto.g.dart';

@JsonSerializable()
class Lk2Group1Dto {
  Lk2Group1Dto({
    this.listPersonLkDto,
    this.listImageDto,
    this.listHouseLkDto,
    this.listCardInfo,

    // this.houseInfo,
    // this.imageInfo,
    // this.personInfo,
  });

  factory Lk2Group1Dto.fromJson(Map<String, dynamic> json) => _$Lk2Group1DtoFromJson(json);
  Map<String, dynamic> toJson() => _$Lk2Group1DtoToJson(this);

  @JsonKey(name: 'personInfo') ListPersonLkDto? listPersonLkDto;
  @JsonKey(name: 'imageInfo') ListImageDto? listImageDto;
  @JsonKey(name: 'houseInfo') ListHouseLkDto? listHouseLkDto;
  @JsonKey(name: 'cardInfo') ListMakeCardLkDto? listCardInfo;

  // @JsonKey(name: 'houseInfo') HouseLkDto? houseInfo;
  // @JsonKey(name: 'imageInfo') ImageDto? imageInfo;
  // @JsonKey(name: 'personInfo') PersonLkDto? personInfo;

}

@JsonSerializable()
class ListLk2Group1Dto {
  ListLk2Group1Dto({
    this.status,
    this.data,
  });

  factory ListLk2Group1Dto.fromJson(Map<String, dynamic> json) => _$ListLk2Group1DtoFromJson(json);
  Map<String, dynamic> toJson() => _$ListLk2Group1DtoToJson(this);

  @JsonKey(name: 'status') String? status;
  @JsonKey(name: 'data') List<Lk2Group1Dto>? data;
}

