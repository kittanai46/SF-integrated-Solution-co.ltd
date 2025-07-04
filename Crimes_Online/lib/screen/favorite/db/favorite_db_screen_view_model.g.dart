// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_db_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteDBScreenViewModel on FavoriteDBScreenViewModelBase, Store {
  late final _$isEnableButtonAtom = Atom(
      name: 'FavoriteDBScreenViewModelBase.isEnableButton', context: context);

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
      Atom(name: 'FavoriteDBScreenViewModelBase.innerDbs', context: context);

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
      Atom(name: 'FavoriteDBScreenViewModelBase.outerDbs', context: context);

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

  late final _$selectDbArrayAtom = Atom(
      name: 'FavoriteDBScreenViewModelBase.selectDbArray', context: context);

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
      Atom(name: 'FavoriteDBScreenViewModelBase.favoriteDto', context: context);

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
      Atom(name: 'FavoriteDBScreenViewModelBase.status', context: context);

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
      Atom(name: 'FavoriteDBScreenViewModelBase.errorTitle', context: context);

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
      name: 'FavoriteDBScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'FavoriteDBScreenViewModelBase.showError', context: context);

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

  late final _$FavoriteDBScreenViewModelBaseActionController =
      ActionController(name: 'FavoriteDBScreenViewModelBase', context: context);

  @override
  void clearAll() {
    final _$actionInfo = _$FavoriteDBScreenViewModelBaseActionController
        .startAction(name: 'FavoriteDBScreenViewModelBase.clearAll');
    try {
      return super.clearAll();
    } finally {
      _$FavoriteDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void confirmDB() {
    final _$actionInfo = _$FavoriteDBScreenViewModelBaseActionController
        .startAction(name: 'FavoriteDBScreenViewModelBase.confirmDB');
    try {
      return super.confirmDB();
    } finally {
      _$FavoriteDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getListDB() {
    final _$actionInfo = _$FavoriteDBScreenViewModelBaseActionController
        .startAction(name: 'FavoriteDBScreenViewModelBase.getListDB');
    try {
      return super.getListDB();
    } finally {
      _$FavoriteDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItem(int index, bool isInnerDb) {
    final _$actionInfo = _$FavoriteDBScreenViewModelBaseActionController
        .startAction(name: 'FavoriteDBScreenViewModelBase.selectItem');
    try {
      return super.selectItem(index, isInnerDb);
    } finally {
      _$FavoriteDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetStatus() {
    final _$actionInfo = _$FavoriteDBScreenViewModelBaseActionController
        .startAction(name: 'FavoriteDBScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$FavoriteDBScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
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
