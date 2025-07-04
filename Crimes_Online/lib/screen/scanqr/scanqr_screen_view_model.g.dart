// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanqr_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScanQRScreenViewModel on ScanQRScreenViewModelBase, Store {
  late final _$barcodeAtom =
      Atom(name: 'ScanQRScreenViewModelBase.barcode', context: context);

  @override
  String get barcode {
    _$barcodeAtom.reportRead();
    return super.barcode;
  }

  @override
  set barcode(String value) {
    _$barcodeAtom.reportWrite(value, super.barcode, () {
      super.barcode = value;
    });
  }

  late final _$successMessageAtom =
      Atom(name: 'ScanQRScreenViewModelBase.successMessage', context: context);

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
      Atom(name: 'ScanQRScreenViewModelBase.status', context: context);

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
      Atom(name: 'ScanQRScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'ScanQRScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'ScanQRScreenViewModelBase.showError', context: context);

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

  late final _$requestLoginScanQRAsyncAction = AsyncAction(
      'ScanQRScreenViewModelBase.requestLoginScanQR',
      context: context);

  @override
  Future<void> requestLoginScanQR(String barcode) {
    return _$requestLoginScanQRAsyncAction
        .run(() => super.requestLoginScanQR(barcode));
  }

  late final _$requestLoginScanQRCRIMESAsyncAction = AsyncAction(
      'ScanQRScreenViewModelBase.requestLoginScanQRCRIMES',
      context: context);

  @override
  Future<bool> requestLoginScanQRCRIMES(String barcode) {
    return _$requestLoginScanQRCRIMESAsyncAction
        .run(() => super.requestLoginScanQRCRIMES(barcode));
  }

  late final _$ScanQRScreenViewModelBaseActionController =
      ActionController(name: 'ScanQRScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$ScanQRScreenViewModelBaseActionController
        .startAction(name: 'ScanQRScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$ScanQRScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
barcode: ${barcode},
successMessage: ${successMessage},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
