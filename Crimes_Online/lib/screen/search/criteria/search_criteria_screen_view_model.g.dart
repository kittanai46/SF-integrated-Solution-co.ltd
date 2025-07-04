// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_criteria_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchCriteriaScreenViewModel
    on SearchCriteriaScreenViewModelBase, Store {
  late final _$searchTypeAtom = Atom(
      name: 'SearchCriteriaScreenViewModelBase.searchType', context: context);

  @override
  String get searchType {
    _$searchTypeAtom.reportRead();
    return super.searchType;
  }

  @override
  set searchType(String value) {
    _$searchTypeAtom.reportWrite(value, super.searchType, () {
      super.searchType = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'SearchCriteriaScreenViewModelBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$scopeAtom =
      Atom(name: 'SearchCriteriaScreenViewModelBase.scope', context: context);

  @override
  ParamScope get scope {
    _$scopeAtom.reportRead();
    return super.scope;
  }

  @override
  set scope(ParamScope value) {
    _$scopeAtom.reportWrite(value, super.scope, () {
      super.scope = value;
    });
  }

  late final _$favoriteDtoAtom = Atom(
      name: 'SearchCriteriaScreenViewModelBase.favoriteDto', context: context);

  @override
  FavoriteDto get favoriteDto {
    _$favoriteDtoAtom.reportRead();
    return super.favoriteDto;
  }

  @override
  set favoriteDto(FavoriteDto value) {
    _$favoriteDtoAtom.reportWrite(value, super.favoriteDto, () {
      super.favoriteDto = value;
    });
  }

  late final _$isEnableButtonAtom = Atom(
      name: 'SearchCriteriaScreenViewModelBase.isEnableButton',
      context: context);

  @override
  bool get isEnableButton {
    _$isEnableButtonAtom.reportRead();
    return super.isEnableButton;
  }

  @override
  set isEnableButton(bool value) {
    _$isEnableButtonAtom.reportWrite(value, super.isEnableButton, () {
      super.isEnableButton = value;
    });
  }

  late final _$screenStatusAtom = Atom(
      name: 'SearchCriteriaScreenViewModelBase.screenStatus', context: context);

  @override
  ActionStatus get screenStatus {
    _$screenStatusAtom.reportRead();
    return super.screenStatus;
  }

  @override
  set screenStatus(ActionStatus value) {
    _$screenStatusAtom.reportWrite(value, super.screenStatus, () {
      super.screenStatus = value;
    });
  }

  late final _$errorTitleAtom = Atom(
      name: 'SearchCriteriaScreenViewModelBase.errorTitle', context: context);

  @override
  String get errorTitle {
    _$errorTitleAtom.reportRead();
    return super.errorTitle;
  }

  @override
  set errorTitle(String value) {
    _$errorTitleAtom.reportWrite(value, super.errorTitle, () {
      super.errorTitle = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: 'SearchCriteriaScreenViewModelBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$showErrorAtom = Atom(
      name: 'SearchCriteriaScreenViewModelBase.showError', context: context);

  @override
  bool get showError {
    _$showErrorAtom.reportRead();
    return super.showError;
  }

  @override
  set showError(bool value) {
    _$showErrorAtom.reportWrite(value, super.showError, () {
      super.showError = value;
    });
  }

  late final _$SearchCriteriaScreenViewModelBaseActionController =
      ActionController(
          name: 'SearchCriteriaScreenViewModelBase', context: context);

  @override
  void setType(String type) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setType');
    try {
      return super.setType(type);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void refreshEnableButton() {
    final _$actionInfo =
        _$SearchCriteriaScreenViewModelBaseActionController.startAction(
            name: 'SearchCriteriaScreenViewModelBase.refreshEnableButton');
    try {
      return super.refreshEnableButton();
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPid(String _pid) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPid');
    try {
      return super.setPid(_pid);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFirstName(String _firstName) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setFirstName');
    try {
      return super.setFirstName(_firstName);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String _lastName) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setLastName');
    try {
      return super.setLastName(_lastName);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setOrgCode(String _orgCode) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setOrgCode');
    try {
      return super.setOrgCode(_orgCode);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCrimeCaseYear(String _crimeCaseYear) {
    final _$actionInfo =
        _$SearchCriteriaScreenViewModelBaseActionController.startAction(
            name: 'SearchCriteriaScreenViewModelBase.setCrimeCaseYear');
    try {
      return super.setCrimeCaseYear(_crimeCaseYear);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCrimeCaseNo(String _crimeCaseNo) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setCrimeCaseNo');
    try {
      return super.setCrimeCaseNo(_crimeCaseNo);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPasId(String _pasId) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPasId');
    try {
      return super.setPasId(_pasId);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNation(String _nation) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setNation');
    try {
      return super.setNation(_nation);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setGunReg(String _gunReg) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setGunReg');
    try {
      return super.setGunReg(_gunReg);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAlienNo(String _alienNo) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setAlienNo');
    try {
      return super.setAlienNo(_alienNo);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProviceTc(String _proviceTc) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setProviceTc');
    try {
      return super.setProviceTc(_proviceTc);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setIntitialNo(String intitialNo) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setIntitialNo');
    try {
      return super.setIntitialNo(intitialNo);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String number) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setNumber');
    try {
      return super.setNumber(number);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(String status) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setStatus');
    try {
      return super.setStatus(status);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEngineNo(String engineNo) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setEngineNo');
    try {
      return super.setEngineNo(engineNo);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLicenseNumber(String licenseNumber) {
    final _$actionInfo =
        _$SearchCriteriaScreenViewModelBaseActionController.startAction(
            name: 'SearchCriteriaScreenViewModelBase.setLicenseNumber');
    try {
      return super.setLicenseNumber(licenseNumber);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProviceWr(String proviceWr) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setProviceWr');
    try {
      return super.setProviceWr(proviceWr);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTambonWr(String tambonWr) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setTambonWr');
    try {
      return super.setTambonWr(tambonWr);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAmphurWr(String amphurWr) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setAmphurWr');
    try {
      return super.setAmphurWr(amphurWr);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCharge(String charge) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setCharge');
    try {
      return super.setCharge(charge);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCourt(String court) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setCourt');
    try {
      return super.setCourt(court);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setWorkerId(String workerId) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setWorkerId');
    try {
      return super.setWorkerId(workerId);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPltcode1(String pltcode1) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPltcode1');
    try {
      return super.setPltcode1(pltcode1);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPltcode2(String pltcode2) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPltcode2');
    try {
      return super.setPltcode2(pltcode2);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlate1Vh(String plate1Vh) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPlate1Vh');
    try {
      return super.setPlate1Vh(plate1Vh);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlate2Vh(String plate2Vh) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPlate2Vh');
    try {
      return super.setPlate2Vh(plate2Vh);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProvcode(String provcode) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setProvcode');
    try {
      return super.setProvcode(provcode);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setVhtype(String vhtype) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setVhtype');
    try {
      return super.setVhtype(vhtype);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNumbody(String numbody) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setNumbody');
    try {
      return super.setNumbody(numbody);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBrncode(String brncode) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setBrncode');
    try {
      return super.setBrncode(brncode);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAccno(String accno) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setAccno');
    try {
      return super.setAccno(accno);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setAccbranch(String accbranch) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setAccbranch');
    try {
      return super.setAccbranch(accbranch);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPassportNoo(String passportNo) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPassportNoo');
    try {
      return super.setPassportNoo(passportNo);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTmrunno(String tmrunno) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setTmrunno');
    try {
      return super.setTmrunno(tmrunno);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlate1Tf(String plate1Tf) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPlate1Tf');
    try {
      return super.setPlate1Tf(plate1Tf);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlate2Tf(String plate2Tf) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPlate2Tf');
    try {
      return super.setPlate2Tf(plate2Tf);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPlate3Tf(String plate3Tf) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setPlate3Tf');
    try {
      return super.setPlate3Tf(plate3Tf);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTicketId(String ticketId) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setTicketId');
    try {
      return super.setTicketId(ticketId);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProvinceByIndex(int index) {
    final _$actionInfo =
        _$SearchCriteriaScreenViewModelBaseActionController.startAction(
            name: 'SearchCriteriaScreenViewModelBase.setProvinceByIndex');
    try {
      return super.setProvinceByIndex(index);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBase64Image(String? value) {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.setBase64Image');
    try {
      return super.setBase64Image(value);
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$SearchCriteriaScreenViewModelBaseActionController
        .startAction(name: 'SearchCriteriaScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$SearchCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchType: ${searchType},
title: ${title},
scope: ${scope},
favoriteDto: ${favoriteDto},
isEnableButton: ${isEnableButton},
screenStatus: ${screenStatus},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
