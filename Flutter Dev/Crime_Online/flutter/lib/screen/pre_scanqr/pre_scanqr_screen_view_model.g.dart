// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_scanqr_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PreScanQRScreenViewModel on PreScanQRScreenViewModelBase, Store {
  late final _$versionAtom =
      Atom(name: 'PreScanQRScreenViewModelBase.version', context: context);

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
      Atom(name: 'PreScanQRScreenViewModelBase.buildnumber', context: context);

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
      Atom(name: 'PreScanQRScreenViewModelBase.status', context: context);

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
      Atom(name: 'PreScanQRScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'PreScanQRScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'PreScanQRScreenViewModelBase.showError', context: context);

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

  late final _$getVersionInfoAsyncAction = AsyncAction(
      'PreScanQRScreenViewModelBase.getVersionInfo',
      context: context);

  @override
  Future<void> getVersionInfo() {
    return _$getVersionInfoAsyncAction.run(() => super.getVersionInfo());
  }

  late final _$PreScanQRScreenViewModelBaseActionController =
      ActionController(name: 'PreScanQRScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$PreScanQRScreenViewModelBaseActionController
        .startAction(name: 'PreScanQRScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$PreScanQRScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
version: ${version},
buildnumber: ${buildnumber},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
