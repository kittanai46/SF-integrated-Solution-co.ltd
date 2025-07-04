// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchResultScreenViewModel on SearchResultScreenViewModelBase, Store {
  late final _$searchTypeAtom = Atom(
      name: 'SearchResultScreenViewModelBase.searchType', context: context);

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
      Atom(name: 'SearchResultScreenViewModelBase.title', context: context);

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

  late final _$groupResultArrayAtom = Atom(
      name: 'SearchResultScreenViewModelBase.groupResultArray',
      context: context);

  @override
  List<GroupResult> get groupResultArray {
    _$groupResultArrayAtom.reportRead();
    return super.groupResultArray;
  }

  @override
  set groupResultArray(List<GroupResult> value) {
    _$groupResultArrayAtom.reportWrite(value, super.groupResultArray, () {
      super.groupResultArray = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'SearchResultScreenViewModelBase.status', context: context);

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

  late final _$errorTitleAtom = Atom(
      name: 'SearchResultScreenViewModelBase.errorTitle', context: context);

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
      name: 'SearchResultScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'SearchResultScreenViewModelBase.showError', context: context);

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

  late final _$SearchResultScreenViewModelBaseActionController =
      ActionController(
          name: 'SearchResultScreenViewModelBase', context: context);

  @override
  void clearAll() {
    final _$actionInfo = _$SearchResultScreenViewModelBaseActionController
        .startAction(name: 'SearchResultScreenViewModelBase.clearAll');
    try {
      return super.clearAll();
    } finally {
      _$SearchResultScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(String type) {
    final _$actionInfo = _$SearchResultScreenViewModelBaseActionController
        .startAction(name: 'SearchResultScreenViewModelBase.setType');
    try {
      return super.setType(type);
    } finally {
      _$SearchResultScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$SearchResultScreenViewModelBaseActionController
        .startAction(name: 'SearchResultScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$SearchResultScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchType: ${searchType},
title: ${title},
groupResultArray: ${groupResultArray},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
