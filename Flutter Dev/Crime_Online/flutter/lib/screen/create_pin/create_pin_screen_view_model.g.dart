// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pin_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreatePinScreenViewModel on CreatePinScreenViewModelBase, Store {
  late final _$titleAtom =
      Atom(name: 'CreatePinScreenViewModelBase.title', context: context);

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

  late final _$pinAtom =
      Atom(name: 'CreatePinScreenViewModelBase.pin', context: context);

  @override
  String get pin {
    _$pinAtom.reportRead();
    return super.pin;
  }

  @override
  set pin(String value) {
    _$pinAtom.reportWrite(value, super.pin, () {
      super.pin = value;
    });
  }

  late final _$number1Atom =
      Atom(name: 'CreatePinScreenViewModelBase.number1', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.number2', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.number3', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.number4', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.number5', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.number6', context: context);

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

  late final _$versionAtom =
      Atom(name: 'CreatePinScreenViewModelBase.version', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.buildnumber', context: context);

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

  late final _$statusAtom =
      Atom(name: 'CreatePinScreenViewModelBase.status', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'CreatePinScreenViewModelBase.showError', context: context);

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
      AsyncAction('CreatePinScreenViewModelBase.select', context: context);

  @override
  Future<void> select(String number) {
    return _$selectAsyncAction.run(() => super.select(number));
  }

  late final _$checkBiometricsAvailableAsyncAction = AsyncAction(
      'CreatePinScreenViewModelBase.checkBiometricsAvailable',
      context: context);

  @override
  Future<bool> checkBiometricsAvailable() {
    return _$checkBiometricsAvailableAsyncAction
        .run(() => super.checkBiometricsAvailable());
  }

  late final _$CreatePinScreenViewModelBaseActionController =
      ActionController(name: 'CreatePinScreenViewModelBase', context: context);

  @override
  dynamic delete() {
    final _$actionInfo = _$CreatePinScreenViewModelBaseActionController
        .startAction(name: 'CreatePinScreenViewModelBase.delete');
    try {
      return super.delete();
    } finally {
      _$CreatePinScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTitle() {
    final _$actionInfo = _$CreatePinScreenViewModelBaseActionController
        .startAction(name: 'CreatePinScreenViewModelBase.resetTitle');
    try {
      return super.resetTitle();
    } finally {
      _$CreatePinScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$CreatePinScreenViewModelBaseActionController
        .startAction(name: 'CreatePinScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$CreatePinScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
pin: ${pin},
number1: ${number1},
number2: ${number2},
number3: ${number3},
number4: ${number4},
number5: ${number5},
number6: ${number6},
version: ${version},
buildnumber: ${buildnumber},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
