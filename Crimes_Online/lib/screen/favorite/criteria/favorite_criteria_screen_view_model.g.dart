// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_criteria_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteCriteriaScreenViewModel
    on FavoriteCriteriaScreenViewModelBase, Store {
  late final _$isEnableButtonAtom = Atom(
      name: 'FavoriteCriteriaScreenViewModelBase.isEnableButton',
      context: context);

  @override
  bool get isEnableButton {
    _$isEnableButtonAtom.reportRead();
    return super.isEnableButton;
  }

  @override
  set isEnableButton(bool value) {
    _$isEnableButtonAtom.reportWrite(value, super.isEnableButton, () {
      super.isEnableButton = value;
    });
  }

  late final _$favoriteDtoAtom = Atom(
      name: 'FavoriteCriteriaScreenViewModelBase.favoriteDto',
      context: context);

  @override
  FavoriteDto get favoriteDto {
    _$favoriteDtoAtom.reportRead();
    return super.favoriteDto;
  }

  @override
  set favoriteDto(FavoriteDto value) {
    _$favoriteDtoAtom.reportWrite(value, super.favoriteDto, () {
      super.favoriteDto = value;
    });
  }

  late final _$statusAtom = Atom(
      name: 'FavoriteCriteriaScreenViewModelBase.status', context: context);

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
      name: 'FavoriteCriteriaScreenViewModelBase.errorTitle', context: context);

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
      name: 'FavoriteCriteriaScreenViewModelBase.errorMessage',
      context: context);

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

  late final _$showErrorAtom = Atom(
      name: 'FavoriteCriteriaScreenViewModelBase.showError', context: context);

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

  late final _$FavoriteCriteriaScreenViewModelBaseActionController =
      ActionController(
          name: 'FavoriteCriteriaScreenViewModelBase', context: context);

  @override
  void setType(String type) {
    final _$actionInfo = _$FavoriteCriteriaScreenViewModelBaseActionController
        .startAction(name: 'FavoriteCriteriaScreenViewModelBase.setType');
    try {
      return super.setType(type);
    } finally {
      _$FavoriteCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(String value) {
    final _$actionInfo = _$FavoriteCriteriaScreenViewModelBaseActionController
        .startAction(name: 'FavoriteCriteriaScreenViewModelBase.selectItem');
    try {
      return super.selectItem(value);
    } finally {
      _$FavoriteCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$FavoriteCriteriaScreenViewModelBaseActionController
        .startAction(name: 'FavoriteCriteriaScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$FavoriteCriteriaScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEnableButton: ${isEnableButton},
favoriteDto: ${favoriteDto},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
