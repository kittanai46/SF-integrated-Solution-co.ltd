// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PermissionScreenViewModel on PermissionScreenViewModelBase, Store {
  late final _$roleSearchInternalDtoAtom = Atom(
      name: 'PermissionScreenViewModelBase.roleSearchInternalDto',
      context: context);

  @override
  RoleSearchInternalDto get roleSearchInternalDto {
    _$roleSearchInternalDtoAtom.reportRead();
    return super.roleSearchInternalDto;
  }

  @override
  set roleSearchInternalDto(RoleSearchInternalDto value) {
    _$roleSearchInternalDtoAtom.reportWrite(value, super.roleSearchInternalDto,
        () {
      super.roleSearchInternalDto = value;
    });
  }

  late final _$roleSearchExternalDtoAtom = Atom(
      name: 'PermissionScreenViewModelBase.roleSearchExternalDto',
      context: context);

  @override
  RoleSearchExternalDto get roleSearchExternalDto {
    _$roleSearchExternalDtoAtom.reportRead();
    return super.roleSearchExternalDto;
  }

  @override
  set roleSearchExternalDto(RoleSearchExternalDto value) {
    _$roleSearchExternalDtoAtom.reportWrite(value, super.roleSearchExternalDto,
        () {
      super.roleSearchExternalDto = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'PermissionScreenViewModelBase.status', context: context);

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
      Atom(name: 'PermissionScreenViewModelBase.errorTitle', context: context);

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
      name: 'PermissionScreenViewModelBase.errorMessage', context: context);

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
      Atom(name: 'PermissionScreenViewModelBase.showError', context: context);

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

  late final _$PermissionScreenViewModelBaseActionController =
      ActionController(name: 'PermissionScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$PermissionScreenViewModelBaseActionController
        .startAction(name: 'PermissionScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$PermissionScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
roleSearchInternalDto: ${roleSearchInternalDto},
roleSearchExternalDto: ${roleSearchExternalDto},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
