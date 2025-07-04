// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_pin_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerifyPinScreenViewModel on VerifyPinScreenViewModelBase, Store {
  late final _$number1Atom =
      Atom(name: 'VerifyPinScreenViewModelBase.number1', context: context);

  @override
  String get number1 {
    _$number1Atom.reportRead();
    return super.number1;
  }

  @override
  set number1(String value) {
    _$number1Atom.reportWrite(value, super.number1, () {
      super.number1 = value;
    });
  }

  late final _$number2Atom =
      Atom(name: 'VerifyPinScreenViewModelBase.number2', context: context);

  @override
  String get number2 {
    _$number2Atom.reportRead();
    return super.number2;
  }

  @override
  set number2(String value) {
    _$number2Atom.reportWrite(value, super.number2, () {
      super.number2 = value;
    });
  }

  late final _$number3Atom =
      Atom(name: 'VerifyPinScreenViewModelBase.number3', context: context);

  @override
  String get number3 {
    _$number3Atom.reportRead();
    return super.number3;
  }

  @override
  set number3(String value) {
    _$number3Atom.reportWrite(value, super.number3, () {
      super.number3 = value;
    });
  }

  late final _$number4Atom =
      Atom(name: 'VerifyPinScreenViewModelBase.number4', context: context);

  @override
  String get number4 {
    _$number4Atom.reportRead();
    return super.number4;
  }

  @override
  set number4(String value) {
    _$number4Atom.reportWrite(value, super.number4, () {
      super.number4 = value;
    });
  }

  late final _$number5Atom =
      Atom(name: 'VerifyPinScreenViewModelBase.number5', context: context);

  @override
  String get number5 {
    _$number5Atom.reportRead();
    return super.number5;
  }

  @override
  set number5(String value) {
    _$number5Atom.reportWrite(value, super.number5, () {
      super.number5 = value;
    });
  }

  late final _$number6Atom =
      Atom(name: 'VerifyPinScreenViewModelBase.number6', context: context);

  @override
  String get number6 {
    _$number6Atom.reportRead();
    return super.number6;
  }

  @override
  set number6(String value) {
    _$number6Atom.reportWrite(value, super.number6, () {
      super.number6 = value;
    });
  }

  late final _$fromSessionTimeoutAtom = Atom(
      name: 'VerifyPinScreenViewModelBase.fromSessionTimeout',
      context: context);

  @override
  bool get fromSessionTimeout {
    _$fromSessionTimeoutAtom.reportRead();
    return super.fromSessionTimeout;
  }

  @override
  set fromSessionTimeout(bool value) {
    _$fromSessionTimeoutAtom.reportWrite(value, super.fromSessionTimeout, () {
      super.fromSessionTimeout = value;
    });
  }

  late final _$isEnableBiometricsAtom = Atom(
      name: 'VerifyPinScreenViewModelBase.isEnableBiometrics',
      context: context);

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

  late final _$statusAtom =
      Atom(name: 'VerifyPinScreenViewModelBase.status', context: context);

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
      Atom(name: 'VerifyPinScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'VerifyPinScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'VerifyPinScreenViewModelBase.showError', context: context);

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

  late final _$selectAsyncAction =
      AsyncAction('VerifyPinScreenViewModelBase.select', context: context);

  @override
  Future<void> select(String number) {
    return _$selectAsyncAction.run(() => super.select(number));
  }

  late final _$refreshBiometricsAsyncAction = AsyncAction(
      'VerifyPinScreenViewModelBase.refreshBiometrics',
      context: context);

  @override
  Future<void> refreshBiometrics() {
    return _$refreshBiometricsAsyncAction.run(() => super.refreshBiometrics());
  }

  late final _$authenBiometricsAsyncAction = AsyncAction(
      'VerifyPinScreenViewModelBase.authenBiometrics',
      context: context);

  @override
  Future<void> authenBiometrics() {
    return _$authenBiometricsAsyncAction.run(() => super.authenBiometrics());
  }

  late final _$VerifyPinScreenViewModelBaseActionController =
      ActionController(name: 'VerifyPinScreenViewModelBase', context: context);

  @override
  dynamic delete() {
    final _$actionInfo = _$VerifyPinScreenViewModelBaseActionController
        .startAction(name: 'VerifyPinScreenViewModelBase.delete');
    try {
      return super.delete();
    } finally {
      _$VerifyPinScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$VerifyPinScreenViewModelBaseActionController
        .startAction(name: 'VerifyPinScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$VerifyPinScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
number1: ${number1},
number2: ${number2},
number3: ${number3},
number4: ${number4},
number5: ${number5},
number6: ${number6},
fromSessionTimeout: ${fromSessionTimeout},
isEnableBiometrics: ${isEnableBiometrics},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
