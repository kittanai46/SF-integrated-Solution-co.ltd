// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TermScreenViewModel on TermScreenViewModelBase, Store {
  late final _$contentAtom =
      Atom(name: 'TermScreenViewModelBase.content', context: context);

  @override
  String get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(String value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$urlAtom =
      Atom(name: 'TermScreenViewModelBase.url', context: context);

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$isCheckAtom =
      Atom(name: 'TermScreenViewModelBase.isCheck', context: context);

  @override
  bool get isCheck {
    _$isCheckAtom.reportRead();
    return super.isCheck;
  }

  @override
  set isCheck(bool value) {
    _$isCheckAtom.reportWrite(value, super.isCheck, () {
      super.isCheck = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'TermScreenViewModelBase.status', context: context);

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
      Atom(name: 'TermScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'TermScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'TermScreenViewModelBase.showError', context: context);

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

  late final _$getHtmlContentAsyncAction =
      AsyncAction('TermScreenViewModelBase.getHtmlContent', context: context);

  @override
  Future<void> getHtmlContent() {
    return _$getHtmlContentAsyncAction.run(() => super.getHtmlContent());
  }

  late final _$acceptTermAsyncAction =
      AsyncAction('TermScreenViewModelBase.acceptTerm', context: context);

  @override
  Future<void> acceptTerm() {
    return _$acceptTermAsyncAction.run(() => super.acceptTerm());
  }

  late final _$TermScreenViewModelBaseActionController =
      ActionController(name: 'TermScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$TermScreenViewModelBaseActionController.startAction(
        name: 'TermScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$TermScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
content: ${content},
url: ${url},
isCheck: ${isCheck},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
