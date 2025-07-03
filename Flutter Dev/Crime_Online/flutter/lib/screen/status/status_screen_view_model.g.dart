// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StatusScreenViewModel on StatusScreenViewModelBase, Store {
  late final _$titleAtom =
      Atom(name: 'StatusScreenViewModelBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$imageAtom =
      Atom(name: 'StatusScreenViewModelBase.image', context: context);

  @override
  String? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'StatusScreenViewModelBase.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$confirmButtonTextAtom = Atom(
      name: 'StatusScreenViewModelBase.confirmButtonText', context: context);

  @override
  String? get confirmButtonText {
    _$confirmButtonTextAtom.reportRead();
    return super.confirmButtonText;
  }

  @override
  set confirmButtonText(String? value) {
    _$confirmButtonTextAtom.reportWrite(value, super.confirmButtonText, () {
      super.confirmButtonText = value;
    });
  }

  late final _$versionAtom =
      Atom(name: 'StatusScreenViewModelBase.version', context: context);

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
      Atom(name: 'StatusScreenViewModelBase.buildnumber', context: context);

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
      Atom(name: 'StatusScreenViewModelBase.status', context: context);

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
      Atom(name: 'StatusScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'StatusScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'StatusScreenViewModelBase.showError', context: context);

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

  late final _$checkAuthenticateAsyncAction = AsyncAction(
      'StatusScreenViewModelBase.checkAuthenticate',
      context: context);

  @override
  Future<void> checkAuthenticate() {
    return _$checkAuthenticateAsyncAction.run(() => super.checkAuthenticate());
  }

  late final _$StatusScreenViewModelBaseActionController =
      ActionController(name: 'StatusScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$StatusScreenViewModelBaseActionController
        .startAction(name: 'StatusScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$StatusScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
image: ${image},
message: ${message},
confirmButtonText: ${confirmButtonText},
version: ${version},
buildnumber: ${buildnumber},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
