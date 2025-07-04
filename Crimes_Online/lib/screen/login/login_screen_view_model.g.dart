// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenViewModel on LoginScreenViewModelBase, Store {
  Computed<bool>? _$isEnableButtonComputed;

  @override
  bool get isEnableButton =>
      (_$isEnableButtonComputed ??= Computed<bool>(() => super.isEnableButton,
              name: 'LoginScreenViewModelBase.isEnableButton'))
          .value;

  late final _$usernameAtom =
      Atom(name: 'LoginScreenViewModelBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$isUsernameEmptyAtom =
      Atom(name: 'LoginScreenViewModelBase.isUsernameEmpty', context: context);

  @override
  bool get isUsernameEmpty {
    _$isUsernameEmptyAtom.reportRead();
    return super.isUsernameEmpty;
  }

  @override
  set isUsernameEmpty(bool value) {
    _$isUsernameEmptyAtom.reportWrite(value, super.isUsernameEmpty, () {
      super.isUsernameEmpty = value;
    });
  }

  late final _$versionAtom =
      Atom(name: 'LoginScreenViewModelBase.version', context: context);

  @override
  String get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(String value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  late final _$buildnumberAtom =
      Atom(name: 'LoginScreenViewModelBase.buildnumber', context: context);

  @override
  String get buildnumber {
    _$buildnumberAtom.reportRead();
    return super.buildnumber;
  }

  @override
  set buildnumber(String value) {
    _$buildnumberAtom.reportWrite(value, super.buildnumber, () {
      super.buildnumber = value;
    });
  }

  late final _$successMessageAtom =
      Atom(name: 'LoginScreenViewModelBase.successMessage', context: context);

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
      Atom(name: 'LoginScreenViewModelBase.status', context: context);

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
      Atom(name: 'LoginScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'LoginScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'LoginScreenViewModelBase.showError', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('LoginScreenViewModelBase.login', context: context);

  @override
  Future<void> login(String username) {
    return _$loginAsyncAction.run(() => super.login(username));
  }

  late final _$getNearestPoliceStationAsyncAction = AsyncAction(
      'LoginScreenViewModelBase.getNearestPoliceStation',
      context: context);

  @override
  Future<void> getNearestPoliceStation() {
    return _$getNearestPoliceStationAsyncAction
        .run(() => super.getNearestPoliceStation());
  }

  late final _$getResponsiblePoliceStationAsyncAction = AsyncAction(
      'LoginScreenViewModelBase.getResponsiblePoliceStation',
      context: context);

  @override
  Future<void> getResponsiblePoliceStation() {
    return _$getResponsiblePoliceStationAsyncAction
        .run(() => super.getResponsiblePoliceStation());
  }

  late final _$generateThaIDStateAsyncAction = AsyncAction(
      'LoginScreenViewModelBase.generateThaIDState',
      context: context);

  @override
  Future<void> generateThaIDState() {
    return _$generateThaIDStateAsyncAction
        .run(() => super.generateThaIDState());
  }

  late final _$getThaiIDScopeAsyncAction =
      AsyncAction('LoginScreenViewModelBase.getThaiIDScope', context: context);

  @override
  Future<void> getThaiIDScope() {
    return _$getThaiIDScopeAsyncAction.run(() => super.getThaiIDScope());
  }

  late final _$regisThaiIDCrimesOnlineAsyncAction = AsyncAction(
      'LoginScreenViewModelBase.regisThaiIDCrimesOnline',
      context: context);

  @override
  Future<void> regisThaiIDCrimesOnline(String thaidCode, String thaidState) {
    return _$regisThaiIDCrimesOnlineAsyncAction
        .run(() => super.regisThaiIDCrimesOnline(thaidCode, thaidState));
  }

  late final _$LoginScreenViewModelBaseActionController =
      ActionController(name: 'LoginScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$LoginScreenViewModelBaseActionController.startAction(
        name: 'LoginScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$LoginScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
isUsernameEmpty: ${isUsernameEmpty},
version: ${version},
buildnumber: ${buildnumber},
successMessage: ${successMessage},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError},
isEnableButton: ${isEnableButton}
    ''';
  }
}
