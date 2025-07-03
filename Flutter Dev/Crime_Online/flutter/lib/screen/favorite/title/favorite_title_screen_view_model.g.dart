// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_title_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteTitleScreenViewModel
    on FavoriteTitleScreenViewModelBase, Store {
  late final _$isEnableButtonAtom = Atom(
      name: 'FavoriteTitleScreenViewModelBase.isEnableButton',
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

  late final _$titleDBsAtom =
      Atom(name: 'FavoriteTitleScreenViewModelBase.titleDBs', context: context);

  @override
  List<String> get titleDBs {
    _$titleDBsAtom.reportRead();
    return super.titleDBs;
  }

  @override
  set titleDBs(List<String> value) {
    _$titleDBsAtom.reportWrite(value, super.titleDBs, () {
      super.titleDBs = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'FavoriteTitleScreenViewModelBase.status', context: context);

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
      name: 'FavoriteTitleScreenViewModelBase.errorTitle', context: context);

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
      name: 'FavoriteTitleScreenViewModelBase.errorMessage', context: context);

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
      name: 'FavoriteTitleScreenViewModelBase.showError', context: context);

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

  late final _$requestAddFavoriteAsyncAction = AsyncAction(
      'FavoriteTitleScreenViewModelBase.requestAddFavorite',
      context: context);

  @override
  Future<void> requestAddFavorite() {
    return _$requestAddFavoriteAsyncAction
        .run(() => super.requestAddFavorite());
  }

  late final _$FavoriteTitleScreenViewModelBaseActionController =
      ActionController(
          name: 'FavoriteTitleScreenViewModelBase', context: context);

  @override
  void setTitle(String title) {
    final _$actionInfo = _$FavoriteTitleScreenViewModelBaseActionController
        .startAction(name: 'FavoriteTitleScreenViewModelBase.setTitle');
    try {
      return super.setTitle(title);
    } finally {
      _$FavoriteTitleScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFavorite(FavoriteDto favorite) {
    final _$actionInfo = _$FavoriteTitleScreenViewModelBaseActionController
        .startAction(name: 'FavoriteTitleScreenViewModelBase.setFavorite');
    try {
      return super.setFavorite(favorite);
    } finally {
      _$FavoriteTitleScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$FavoriteTitleScreenViewModelBaseActionController
        .startAction(name: 'FavoriteTitleScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$FavoriteTitleScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEnableButton: ${isEnableButton},
titleDBs: ${titleDBs},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
