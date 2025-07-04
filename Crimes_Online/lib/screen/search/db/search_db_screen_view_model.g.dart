// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_db_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchDBScreenViewModel on SearchDBScreenViewModelBase, Store {
  late final _$searchTypeAtom =
      Atom(name: 'SearchDBScreenViewModelBase.searchType', context: context);

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
      Atom(name: 'SearchDBScreenViewModelBase.title', context: context);

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

  late final _$isEnableFavButtonAtom = Atom(
      name: 'SearchDBScreenViewModelBase.isEnableFavButton', context: context);

  @override
  bool get isEnableFavButton {
    _$isEnableFavButtonAtom.reportRead();
    return super.isEnableFavButton;
  }

  @override
  set isEnableFavButton(bool value) {
    _$isEnableFavButtonAtom.reportWrite(value, super.isEnableFavButton, () {
      super.isEnableFavButton = value;
    });
  }

  late final _$isEnableButtonAtom = Atom(
      name: 'SearchDBScreenViewModelBase.isEnableButton', context: context);

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

  late final _$innerDbsAtom =
      Atom(name: 'SearchDBScreenViewModelBase.innerDbs', context: context);

  @override
  List<Database> get innerDbs {
    _$innerDbsAtom.reportRead();
    return super.innerDbs;
  }

  @override
  set innerDbs(List<Database> value) {
    _$innerDbsAtom.reportWrite(value, super.innerDbs, () {
      super.innerDbs = value;
    });
  }

  late final _$outerDbsAtom =
      Atom(name: 'SearchDBScreenViewModelBase.outerDbs', context: context);

  @override
  List<Database> get outerDbs {
    _$outerDbsAtom.reportRead();
    return super.outerDbs;
  }

  @override
  set outerDbs(List<Database> value) {
    _$outerDbsAtom.reportWrite(value, super.outerDbs, () {
      super.outerDbs = value;
    });
  }

  late final _$selectDbArrayAtom =
      Atom(name: 'SearchDBScreenViewModelBase.selectDbArray', context: context);

  @override
  List<Database> get selectDbArray {
    _$selectDbArrayAtom.reportRead();
    return super.selectDbArray;
  }

  @override
  set selectDbArray(List<Database> value) {
    _$selectDbArrayAtom.reportWrite(value, super.selectDbArray, () {
      super.selectDbArray = value;
    });
  }

  late final _$favoriteDtoAtom =
      Atom(name: 'SearchDBScreenViewModelBase.favoriteDto', context: context);

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

  late final _$statusAtom =
      Atom(name: 'SearchDBScreenViewModelBase.status', context: context);

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
      Atom(name: 'SearchDBScreenViewModelBase.errorTitle', context: context);

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
      Atom(name: 'SearchDBScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'SearchDBScreenViewModelBase.showError', context: context);

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

  late final _$refreshCanAddFavoriteAsyncAction = AsyncAction(
      'SearchDBScreenViewModelBase.refreshCanAddFavorite',
      context: context);

  @override
  Future<void> refreshCanAddFavorite() {
    return _$refreshCanAddFavoriteAsyncAction
        .run(() => super.refreshCanAddFavorite());
  }

  late final _$addFavoriteAsyncAction =
      AsyncAction('SearchDBScreenViewModelBase.addFavorite', context: context);

  @override
  Future<void> addFavorite(String title) {
    return _$addFavoriteAsyncAction.run(() => super.addFavorite(title));
  }

  late final _$searchAsyncAction =
      AsyncAction('SearchDBScreenViewModelBase.search', context: context);

  @override
  Future<void> search() {
    return _$searchAsyncAction.run(() => super.search());
  }

  late final _$SearchDBScreenViewModelBaseActionController =
      ActionController(name: 'SearchDBScreenViewModelBase', context: context);

  @override
  void clearAll() {
    final _$actionInfo = _$SearchDBScreenViewModelBaseActionController
        .startAction(name: 'SearchDBScreenViewModelBase.clearAll');
    try {
      return super.clearAll();
    } finally {
      _$SearchDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(String type) {
    final _$actionInfo = _$SearchDBScreenViewModelBaseActionController
        .startAction(name: 'SearchDBScreenViewModelBase.setType');
    try {
      return super.setType(type);
    } finally {
      _$SearchDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getListDB() {
    final _$actionInfo = _$SearchDBScreenViewModelBaseActionController
        .startAction(name: 'SearchDBScreenViewModelBase.getListDB');
    try {
      return super.getListDB();
    } finally {
      _$SearchDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(int index, bool isInnerDb) {
    final _$actionInfo = _$SearchDBScreenViewModelBaseActionController
        .startAction(name: 'SearchDBScreenViewModelBase.selectItem');
    try {
      return super.selectItem(index, isInnerDb);
    } finally {
      _$SearchDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$SearchDBScreenViewModelBaseActionController
        .startAction(name: 'SearchDBScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$SearchDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchType: ${searchType},
title: ${title},
isEnableFavButton: ${isEnableFavButton},
isEnableButton: ${isEnableButton},
innerDbs: ${innerDbs},
outerDbs: ${outerDbs},
selectDbArray: ${selectDbArray},
favoriteDto: ${favoriteDto},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
