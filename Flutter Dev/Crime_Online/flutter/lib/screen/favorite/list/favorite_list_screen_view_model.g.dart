// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_list_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteListScreenViewModel on FavoriteListScreenViewModelBase, Store {
  late final _$defaultFavoriteAtom = Atom(
      name: 'FavoriteListScreenViewModelBase.defaultFavorite',
      context: context);

  @override
  FavoriteDto get defaultFavorite {
    _$defaultFavoriteAtom.reportRead();
    return super.defaultFavorite;
  }

  @override
  set defaultFavorite(FavoriteDto value) {
    _$defaultFavoriteAtom.reportWrite(value, super.defaultFavorite, () {
      super.defaultFavorite = value;
    });
  }

  late final _$favoritesAtom =
      Atom(name: 'FavoriteListScreenViewModelBase.favorites', context: context);

  @override
  List<FavoriteDto> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<FavoriteDto> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$userDtoAtom =
      Atom(name: 'FavoriteListScreenViewModelBase.userDto', context: context);

  @override
  UserDto? get userDto {
    _$userDtoAtom.reportRead();
    return super.userDto;
  }

  @override
  set userDto(UserDto? value) {
    _$userDtoAtom.reportWrite(value, super.userDto, () {
      super.userDto = value;
    });
  }

  late final _$isEditAtom =
      Atom(name: 'FavoriteListScreenViewModelBase.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'FavoriteListScreenViewModelBase.status', context: context);

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
      name: 'FavoriteListScreenViewModelBase.errorTitle', context: context);

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
      name: 'FavoriteListScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'FavoriteListScreenViewModelBase.showError', context: context);

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

  late final _$refreshDataAsyncAction = AsyncAction(
      'FavoriteListScreenViewModelBase.refreshData',
      context: context);

  @override
  Future<void> refreshData() {
    return _$refreshDataAsyncAction.run(() => super.refreshData());
  }

  late final _$toggleEditAsyncAction = AsyncAction(
      'FavoriteListScreenViewModelBase.toggleEdit',
      context: context);

  @override
  Future<void> toggleEdit() {
    return _$toggleEditAsyncAction.run(() => super.toggleEdit());
  }

  late final _$deleteFavoriteAsyncAction = AsyncAction(
      'FavoriteListScreenViewModelBase.deleteFavorite',
      context: context);

  @override
  Future<void> deleteFavorite(int index) {
    return _$deleteFavoriteAsyncAction.run(() => super.deleteFavorite(index));
  }

  late final _$FavoriteListScreenViewModelBaseActionController =
      ActionController(
          name: 'FavoriteListScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$FavoriteListScreenViewModelBaseActionController
        .startAction(name: 'FavoriteListScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$FavoriteListScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
defaultFavorite: ${defaultFavorite},
favorites: ${favorites},
userDto: ${userDto},
isEdit: ${isEdit},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
