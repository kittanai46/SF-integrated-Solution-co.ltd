// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenViewModel on SplashScreenViewModelBase, Store {
  late final _$trackAtom =
      Atom(name: 'SplashScreenViewModelBase.track', context: context);

  @override
  String get track {
    _$trackAtom.reportRead();
    return super.track;
  }

  @override
  set track(String value) {
    _$trackAtom.reportWrite(value, super.track, () {
      super.track = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'SplashScreenViewModelBase.status', context: context);

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
      Atom(name: 'SplashScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'SplashScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'SplashScreenViewModelBase.showError', context: context);

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

  late final _$checkVersionAsyncAction =
      AsyncAction('SplashScreenViewModelBase.checkVersion', context: context);

  @override
  Future<void> checkVersion() {
    return _$checkVersionAsyncAction.run(() => super.checkVersion());
  }

  late final _$checkAuthenticateAsyncAction = AsyncAction(
      'SplashScreenViewModelBase.checkAuthenticate',
      context: context);

  @override
  Future<void> checkAuthenticate() {
    return _$checkAuthenticateAsyncAction.run(() => super.checkAuthenticate());
  }

  late final _$getThaiIDScopeAsyncAction =
      AsyncAction('SplashScreenViewModelBase.getThaiIDScope', context: context);

  @override
  Future<void> getThaiIDScope() {
    return _$getThaiIDScopeAsyncAction.run(() => super.getThaiIDScope());
  }

  late final _$SplashScreenViewModelBaseActionController =
      ActionController(name: 'SplashScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$SplashScreenViewModelBaseActionController
        .startAction(name: 'SplashScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$SplashScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
track: ${track},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
