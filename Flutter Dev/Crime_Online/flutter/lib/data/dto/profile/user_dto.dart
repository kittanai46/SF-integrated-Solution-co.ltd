import 'package:crimes/data/common/api_status_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto({
    this.position,
    this.orgName,
    this.tambon,
    this.mobileStatusAuthen,
    this.expireDate,
    this.roleSearchInternal,
    this.amphur,
    this.kkCode,
    this.levelRoleSearch,
    this.posOrg,
    this.lastname,
    this.bkCode,
    this.blockUser,
    this.mobileStatusDevice,
    this.mobilePhone,
    this.rank,
    this.bH,
    this.statusDesc,
    this.roleSearchExternal,
    this.province,
    this.policeId,
    this.bK,
    this.statusCode,
    this.orgCode,
    this.pid,
    this.firstname,
    this.bhCode,
    this.toActiveDate,
    this.favorite,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(name: 'position') String? position;
  @JsonKey(name: 'org_name') String? orgName;
  @JsonKey(name: 'tambon') String? tambon;
  @JsonKey(name: 'mobile_status_authen') String? mobileStatusAuthen;
  @JsonKey(name: 'expire_date') String? expireDate;
  @JsonKey(name: 'role_search_internal') RoleSearchInternalDto? roleSearchInternal;
  @JsonKey(name: 'amphur') String? amphur;
  @JsonKey(name: 'kk_code') String? kkCode;
  @JsonKey(name: 'level_role_search') String? levelRoleSearch;
  @JsonKey(name: 'pos_org') String? posOrg;
  @JsonKey(name: 'lastname') String? lastname;
  @JsonKey(name: 'bk_code') String? bkCode;
  @JsonKey(name: 'block_user') bool? blockUser;
  @JsonKey(name: 'mobile_status_device') String? mobileStatusDevice;
  @JsonKey(name: 'mobile_phone') String? mobilePhone;
  @JsonKey(name: 'rank') String? rank;
  @JsonKey(name: 'BH') String? bH;
  @JsonKey(name: 'status_desc') String? statusDesc;
  @JsonKey(name: 'role_search_external') RoleSearchExternalDto? roleSearchExternal;
  @JsonKey(name: 'province') String? province;
  @JsonKey(name: 'police_id') String? policeId;
  @JsonKey(name: 'BK') String? bK;
  @JsonKey(name: 'status_code') String? statusCode;
  @JsonKey(name: 'org_code') String? orgCode;
  @JsonKey(name: 'pid') String? pid;
  @JsonKey(name: 'firstname') String? firstname;
  @JsonKey(name: 'bh_code') String? bhCode;
  @JsonKey(name: 'to_active_date') String? toActiveDate;
  @JsonKey(name: 'favorite') String? favorite;

}

@JsonSerializable()
class RoleSearchExternalDto {
  RoleSearchExternalDto({
    this.flagBot,
    this.flagBotEnd,
    this.flagBotLock,
    this.flagBotStart,
    this.flagDbd,
    this.flagPersonCorrection,
    this.flagPersonCorrectionEnd,
    this.flagPersonCorrectionLock,
    this.flagPersonCorrectionStart,
    this.flagPersonDlt,
    this.flagPersonDltEnd,
    this.flagPersonDltLock,
    this.flagPersonDltStart,
    this.flagPersonDltDl,
    this.flagPersonDltDlEnd,
    this.flagPersonDltDlLock,
    this.flagPersonDltDlStart,
    this.flagPersonDltPl,
    this.flagPersonDltPlEnd,
    this.flagPersonDltPlLock,
    this.flagPersonDltPlStart,
    this.flagPersonDocr,
    this.flagPersonDocrEnd,
    this.flagPersonDocrLock,
    this.flagPersonDocrStart,
    this.flagPersonDoe,
    this.flagPersonDoeEnd,
    this.flagPersonDoeLock,
    this.flagPersonDoeStart,
    this.flagPersonDopa,
    this.flagPersonDopaEnd,
    this.flagPersonDopaLock,
    this.flagPersonDopaStart,
    this.flagPersonDopaLinkage,
    this.flagPersonDopaLinkageEnd,
    this.flagPersonDopaLinkageLock,
    this.flagPersonDopaLinkageStart,
    this.flagPersonGun,
    this.flagPersonGunEnd,
    this.flagPersonGunLock,
    this.flagPersonGunStart,
    //this.flagPersonLinkage,
    this.flagPersonNhso,
    this.flagPersonNhsoEnd,
    this.flagPersonNhsoLock,
    this.flagPersonNhsoStart,
    this.flagPersonPtm,
    this.flagPersonPtmEnd,
    this.flagPersonPtmLock,
    this.flagPersonPtmStart,
    this.flagPersonSso,
    this.flagPersonSsoEnd,
    this.flagPersonSsoLock,
    this.flagPersonSsoStart,
    this.flagPersonTm,
    this.flagPersonTmEnd,
    this.flagPersonTmLock,
    this.flagPersonTmStart,
    this.flagPersonTm61,
    this.flagPersonTm61End,
    this.flagPersonTm61Lock,
    this.flagPersonTm61Start,
    this.flagPersonWarrant,
    this.flagVerhicleDlt,
    this.flagVerhiclePtm,
    this.flagPersonPrisoner,
    this.flagPersonWarrantCourt,
    this.flagPersonWarrantCourtEnd,
    this.flagPersonWarrantCourtLock,
    this.flagPersonWarrantCourtStart
  });

  factory RoleSearchExternalDto.fromJson(Map<String, dynamic> json) => _$RoleSearchExternalDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RoleSearchExternalDtoToJson(this);

  @JsonKey(name: 'flag_bot') bool? flagBot;
  @JsonKey(name: 'flag_bot_end') String? flagBotEnd;
  @JsonKey(name: 'flag_bot_lock') bool? flagBotLock;
  @JsonKey(name: 'flag_bot_start') String? flagBotStart;
  @JsonKey(name: 'flag_dbd') bool? flagDbd;
  @JsonKey(name: 'flag_person_correction') bool? flagPersonCorrection;
  @JsonKey(name: 'flag_person_correction_end') String? flagPersonCorrectionEnd;
  @JsonKey(name: 'flag_person_correction_lock') bool? flagPersonCorrectionLock;
  @JsonKey(name: 'flag_person_correction_start') String? flagPersonCorrectionStart;
  @JsonKey(name: 'flag_person_dlt') bool? flagPersonDlt;
  @JsonKey(name: 'flag_person_dlt_end') String? flagPersonDltEnd;
  @JsonKey(name: 'flag_person_dlt_lock') bool? flagPersonDltLock;
  @JsonKey(name: 'flag_person_dlt_start') String? flagPersonDltStart;
  @JsonKey(name: 'flag_person_dlt_dl') bool? flagPersonDltDl;
  @JsonKey(name: 'flag_person_dlt_dl_end') String? flagPersonDltDlEnd;
  @JsonKey(name: 'flag_person_dlt_dl_lock') bool? flagPersonDltDlLock;
  @JsonKey(name: 'flag_person_dlt_dl_start') String? flagPersonDltDlStart;
  @JsonKey(name: 'flag_person_dlt_pl') bool? flagPersonDltPl;
  @JsonKey(name: 'flag_person_dlt_pl_end') String? flagPersonDltPlEnd;
  @JsonKey(name: 'flag_person_dlt_pl_lock') bool? flagPersonDltPlLock;
  @JsonKey(name: 'flag_person_dlt_pl_start') String? flagPersonDltPlStart;
  @JsonKey(name: 'flag_person_docr') bool? flagPersonDocr;
  @JsonKey(name: 'flag_person_docr_end') String? flagPersonDocrEnd;
  @JsonKey(name: 'flag_person_docr_lock') bool? flagPersonDocrLock;
  @JsonKey(name: 'flag_person_docr_start') String? flagPersonDocrStart;
  @JsonKey(name: 'flag_person_doe') bool? flagPersonDoe;
  @JsonKey(name: 'flag_person_doe_end') String? flagPersonDoeEnd;
  @JsonKey(name: 'flag_person_doe_lock') bool? flagPersonDoeLock;
  @JsonKey(name: 'flag_person_doe_start') String? flagPersonDoeStart;
  @JsonKey(name: 'flag_person_dopa') bool? flagPersonDopa;
  @JsonKey(name: 'flag_person_dopa_end') String? flagPersonDopaEnd;
  @JsonKey(name: 'flag_person_dopa_lock') bool? flagPersonDopaLock;
  @JsonKey(name: 'flag_person_dopa_start') String? flagPersonDopaStart;
  @JsonKey(name: 'flag_person_dopa_linkage') bool? flagPersonDopaLinkage;
  @JsonKey(name: 'flag_person_dopa_linkage_end') String? flagPersonDopaLinkageEnd;
  @JsonKey(name: 'flag_person_dopa_linkage_lock') bool? flagPersonDopaLinkageLock;
  @JsonKey(name: 'flag_person_dopa_linkage_start') String? flagPersonDopaLinkageStart;
  @JsonKey(name: 'flag_person_gun') bool? flagPersonGun;
  @JsonKey(name: 'flag_person_gun_end') String? flagPersonGunEnd;
  @JsonKey(name: 'flag_person_gun_lock') bool? flagPersonGunLock;
  @JsonKey(name: 'flag_person_gun_start') String? flagPersonGunStart;
  //@JsonKey(name: 'flag_person_linkage') bool? flagPersonLinkage;
  @JsonKey(name: 'flag_person_nhso') bool? flagPersonNhso;
  @JsonKey(name: 'flag_person_nhso_end') String? flagPersonNhsoEnd;
  @JsonKey(name: 'flag_person_nhso_lock') bool? flagPersonNhsoLock;
  @JsonKey(name: 'flag_person_nhso_start') String? flagPersonNhsoStart;
  @JsonKey(name: 'flag_person_ptm') bool? flagPersonPtm;
  @JsonKey(name: 'flag_person_ptm_end') String? flagPersonPtmEnd;
  @JsonKey(name: 'flag_person_ptm_lock') bool? flagPersonPtmLock;
  @JsonKey(name: 'flag_person_ptm_start') String? flagPersonPtmStart;
  @JsonKey(name: 'flag_person_sso') bool? flagPersonSso;
  @JsonKey(name: 'flag_person_sso_end') String? flagPersonSsoEnd;
  @JsonKey(name: 'flag_person_sso_lock') bool? flagPersonSsoLock;
  @JsonKey(name: 'flag_person_sso_start') String? flagPersonSsoStart;
  @JsonKey(name: 'flag_person_tm') bool? flagPersonTm;
  @JsonKey(name: 'flag_person_tm_end') String? flagPersonTmEnd;
  @JsonKey(name: 'flag_person_tm_lock') bool? flagPersonTmLock;
  @JsonKey(name: 'flag_person_tm_start') String? flagPersonTmStart;
  @JsonKey(name: 'flag_person_tm61') bool? flagPersonTm61;
  @JsonKey(name: 'flag_person_tm61_end') String? flagPersonTm61End;
  @JsonKey(name: 'flag_person_tm61_lock') bool? flagPersonTm61Lock;
  @JsonKey(name: 'flag_person_tm61_start') String? flagPersonTm61Start;
  @JsonKey(name: 'flag_person_warrant') bool? flagPersonWarrant;
  @JsonKey(name: 'flag_vehicle_dlt') bool? flagVerhicleDlt;
  @JsonKey(name: 'flag_vehicle_ptm') bool? flagVerhiclePtm;

  @JsonKey(name: 'flag_person_prisoner') bool? flagPersonPrisoner;  //?
  @JsonKey(name: 'flag_person_warrant_court') bool? flagPersonWarrantCourt;
  @JsonKey(name: 'flag_person_warrant_court_end') String? flagPersonWarrantCourtEnd;
  @JsonKey(name: 'flag_person_warrant_court_lock') bool? flagPersonWarrantCourtLock;
  @JsonKey(name: 'flag_person_warrant_court_start') String? flagPersonWarrantCourtStart;

}


@JsonSerializable()
class RoleSearchInternalDto {
  RoleSearchInternalDto({
    this.flagVehicleTc,
    this.flagPersonTc,
    this.flagCrimecaseWr,
    this.flagCrimecase,
    this.flagCrimecaseLc,
    this.flagWeaponSs,
    this.flagWeaponLost,
    this.flagAssetCc,
    this.flagTrafficcase,
    this.flagWeaponCc,
    this.flagVehicleCc,
    this.flagPersonWr,
    this.flagPersonSs,
    this.flagVehicleLost,
    this.flagPersonCc,
  });

  factory RoleSearchInternalDto.fromJson(Map<String, dynamic> json) => _$RoleSearchInternalDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RoleSearchInternalDtoToJson(this);


  @JsonKey(name: 'flag_person_tc') bool? flagPersonTc;
  @JsonKey(name: 'flag_person_wr') bool? flagPersonWr;
  @JsonKey(name: 'flag_person_ss') bool? flagPersonSs;
  @JsonKey(name: 'flag_person_cc') bool? flagPersonCc;

  @JsonKey(name: 'flag_vehicle_tc') bool? flagVehicleTc;
  @JsonKey(name: 'flag_vehicle_cc') bool? flagVehicleCc;
  @JsonKey(name: 'flag_vehicle_lost') bool? flagVehicleLost;

  @JsonKey(name: 'flag_weapon_ss') bool? flagWeaponSs;
  @JsonKey(name: 'flag_weapon_cc') bool? flagWeaponCc;
  @JsonKey(name: 'flag_weapon_lost') bool? flagWeaponLost;

  @JsonKey(name: 'flag_crimecase') bool? flagCrimecase;
  @JsonKey(name: 'flag_crimecase_wr') bool? flagCrimecaseWr;
  @JsonKey(name: 'flag_crimecase_lc') bool? flagCrimecaseLc;
  @JsonKey(name: 'flag_trafficcase') bool? flagTrafficcase;

  @JsonKey(name: 'flag_asset_cc') bool? flagAssetCc;

}