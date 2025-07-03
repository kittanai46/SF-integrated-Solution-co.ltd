// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainScreenViewModel on MainScreenViewModelBase, Store {
  late final _$favoriteListAtom =
      Atom(name: 'MainScreenViewModelBase.favoriteList', context: context);

  @override
  List<FavoriteDto> get favoriteList {
    _$favoriteListAtom.reportRead();
    return super.favoriteList;
  }

  @override
  set favoriteList(List<FavoriteDto> value) {
    _$favoriteListAtom.reportWrite(value, super.favoriteList, () {
      super.favoriteList = value;
    });
  }

  late final _$hasBiometricsAtom =
      Atom(name: 'MainScreenViewModelBase.hasBiometrics', context: context);

  @override
  bool get hasBiometrics {
    _$hasBiometricsAtom.reportRead();
    return super.hasBiometrics;
  }

  @override
  set hasBiometrics(bool value) {
    _$hasBiometricsAtom.reportWrite(value, super.hasBiometrics, () {
      super.hasBiometrics = value;
    });
  }

  late final _$isEnableBiometricsAtom = Atom(
      name: 'MainScreenViewModelBase.isEnableBiometrics', context: context);

  @override
  bool get isEnableBiometrics {
    _$isEnableBiometricsAtom.reportRead();
    return super.isEnableBiometrics;
  }

  @override
  set isEnableBiometrics(bool value) {
    _$isEnableBiometricsAtom.reportWrite(value, super.isEnableBiometrics, () {
      super.isEnableBiometrics = value;
    });
  }

  late final _$isEnableFavButtonAtom =
      Atom(name: 'MainScreenViewModelBase.isEnableFavButton', context: context);

  @override
  bool get isEnableFavButton {
    _$isEnableFavButtonAtom.reportRead();
    return super.isEnableFavButton;
  }

  @override
  set isEnableFavButton(bool value) {
    _$isEnableFavButtonAtom.reportWrite(value, super.isEnableFavButton, () {
      super.isEnableFavButton = value;
    });
  }

  late final _$countNewAtom =
      Atom(name: 'MainScreenViewModelBase.countNew', context: context);

  @override
  int get countNew {
    _$countNewAtom.reportRead();
    return super.countNew;
  }

  @override
  set countNew(int value) {
    _$countNewAtom.reportWrite(value, super.countNew, () {
      super.countNew = value;
    });
  }

  late final _$notificationsAtom =
      Atom(name: 'MainScreenViewModelBase.notifications', context: context);

  @override
  List<NotifyDto> get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(List<NotifyDto> value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  late final _$successMessageAtom =
      Atom(name: 'MainScreenViewModelBase.successMessage', context: context);

  @override
  String get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(String value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'MainScreenViewModelBase.status', context: context);

  @override
  ActionStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ActionStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$errorTitleAtom =
      Atom(name: 'MainScreenViewModelBase.errorTitle', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: 'MainScreenViewModelBase.errorMessage', context: context);

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

  late final _$showErrorAtom =
      Atom(name: 'MainScreenViewModelBase.showError', context: context);

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

  late final _$getNotifyAsyncAction =
      AsyncAction('MainScreenViewModelBase.getNotify', context: context);

  @override
  Future<void> getNotify() {
    return _$getNotifyAsyncAction.run(() => super.getNotify());
  }

  late final _$refreshFavoriteListAsyncAction = AsyncAction(
      'MainScreenViewModelBase.refreshFavoriteList',
      context: context);

  @override
  Future<void> refreshFavoriteList() {
    return _$refreshFavoriteListAsyncAction
        .run(() => super.refreshFavoriteList());
  }

  late final _$refreshCanAddFavoriteAsyncAction = AsyncAction(
      'MainScreenViewModelBase.refreshCanAddFavorite',
      context: context);

  @override
  Future<void> refreshCanAddFavorite() {
    return _$refreshCanAddFavoriteAsyncAction
        .run(() => super.refreshCanAddFavorite());
  }

  late final _$generatePasscodeAsyncAction =
      AsyncAction('MainScreenViewModelBase.generatePasscode', context: context);

  @override
  Future<void> generatePasscode() {
    return _$generatePasscodeAsyncAction.run(() => super.generatePasscode());
  }

  late final _$getTokenAuthSocAsyncAction =
      AsyncAction('MainScreenViewModelBase.getTokenAuthSoc', context: context);

  @override
  Future<void> getTokenAuthSoc() {
    return _$getTokenAuthSocAsyncAction.run(() => super.getTokenAuthSoc());
  }

  late final _$pingUrlAsyncAction =
      AsyncAction('MainScreenViewModelBase.pingUrl', context: context);

  @override
  Future<void> pingUrl() {
    return _$pingUrlAsyncAction.run(() => super.pingUrl());
  }

  late final _$requestUpdatePushTokenAsyncAction = AsyncAction(
      'MainScreenViewModelBase.requestUpdatePushToken',
      context: context);

  @override
  Future<void> requestUpdatePushToken(String pushToken) {
    return _$requestUpdatePushTokenAsyncAction
        .run(() => super.requestUpdatePushToken(pushToken));
  }

  late final _$refreshBiometricsAsyncAction = AsyncAction(
      'MainScreenViewModelBase.refreshBiometrics',
      context: context);

  @override
  Future<void> refreshBiometrics() {
    return _$refreshBiometricsAsyncAction.run(() => super.refreshBiometrics());
  }

  late final _$closeBiometricsAsyncAction =
      AsyncAction('MainScreenViewModelBase.closeBiometrics', context: context);

  @override
  Future<void> closeBiometrics() {
    return _$closeBiometricsAsyncAction.run(() => super.closeBiometrics());
  }

  late final _$authenticateAsyncAction =
      AsyncAction('MainScreenViewModelBase.authenticate', context: context);

  @override
  Future<void> authenticate() {
    return _$authenticateAsyncAction.run(() => super.authenticate());
  }

  late final _$generateThaIDStateAsyncAction = AsyncAction(
      'MainScreenViewModelBase.generateThaIDState',
      context: context);

  @override
  Future<void> generateThaIDState() {
    return _$generateThaIDStateAsyncAction
        .run(() => super.generateThaIDState());
  }

  late final _$getThaiIDScopeAsyncAction =
      AsyncAction('MainScreenViewModelBase.getThaiIDScope', context: context);

  @override
  Future<void> getThaiIDScope() {
    return _$getThaiIDScopeAsyncAction.run(() => super.getThaiIDScope());
  }

  late final _$renewThaiIDCrimesOnlineAsyncAction = AsyncAction(
      'MainScreenViewModelBase.renewThaiIDCrimesOnline',
      context: context);

  @override
  Future<void> renewThaiIDCrimesOnline(String thaidCode, String thaidState) {
    return _$renewThaiIDCrimesOnlineAsyncAction
        .run(() => super.renewThaiIDCrimesOnline(thaidCode, thaidState));
  }

  late final _$generateThaIDStateLK2AsyncAction = AsyncAction(
      'MainScreenViewModelBase.generateThaIDStateLK2',
      context: context);

  @override
  Future<void> generateThaIDStateLK2() {
    return _$generateThaIDStateLK2AsyncAction
        .run(() => super.generateThaIDStateLK2());
  }

  late final _$loginConfirmLK2AsyncAction =
      AsyncAction('MainScreenViewModelBase.loginConfirmLK2', context: context);

  @override
  Future<void> loginConfirmLK2(
      String thaidCode, String thaidState, String authen) {
    return _$loginConfirmLK2AsyncAction
        .run(() => super.loginConfirmLK2(thaidCode, thaidState, authen));
  }

  late final _$getNearestPoliceStationAsyncAction = AsyncAction(
      'MainScreenViewModelBase.getNearestPoliceStation',
      context: context);

  @override
  Future<void> getNearestPoliceStation() {
    return _$getNearestPoliceStationAsyncAction
        .run(() => super.getNearestPoliceStation());
  }

  late final _$getResponsiblePoliceStationAsyncAction = AsyncAction(
      'MainScreenViewModelBase.getResponsiblePoliceStation',
      context: context);

  @override
  Future<void> getResponsiblePoliceStation() {
    return _$getResponsiblePoliceStationAsyncAction
        .run(() => super.getResponsiblePoliceStation());
  }

  late final _$MainScreenViewModelBaseActionController =
      ActionController(name: 'MainScreenViewModelBase', context: context);

  @override
  void setUserDto(UserDto dto) {
    final _$actionInfo = _$MainScreenViewModelBaseActionController.startAction(
        name: 'MainScreenViewModelBase.setUserDto');
    try {
      return super.setUserDto(dto);
    } finally {
      _$MainScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$MainScreenViewModelBaseActionController.startAction(
        name: 'MainScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$MainScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteList: ${favoriteList},
hasBiometrics: ${hasBiometrics},
isEnableBiometrics: ${isEnableBiometrics},
isEnableFavButton: ${isEnableFavButton},
countNew: ${countNew},
notifications: ${notifications},
successMessage: ${successMessage},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
