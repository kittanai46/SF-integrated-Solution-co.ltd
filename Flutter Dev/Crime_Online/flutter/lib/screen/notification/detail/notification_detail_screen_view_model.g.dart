// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_detail_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationDetailScreenViewModel
    on NotificationDetailScreenViewModelBase, Store {
  late final _$notifyDtoAtom = Atom(
      name: 'NotificationDetailScreenViewModelBase.notifyDto',
      context: context);

  @override
  NotifyDto get notifyDto {
    _$notifyDtoAtom.reportRead();
    return super.notifyDto;
  }

  @override
  set notifyDto(NotifyDto value) {
    _$notifyDtoAtom.reportWrite(value, super.notifyDto, () {
      super.notifyDto = value;
    });
  }

  late final _$userDtoAtom = Atom(
      name: 'NotificationDetailScreenViewModelBase.userDto', context: context);

  @override
  UserDto get userDto {
    _$userDtoAtom.reportRead();
    return super.userDto;
  }

  @override
  set userDto(UserDto value) {
    _$userDtoAtom.reportWrite(value, super.userDto, () {
      super.userDto = value;
    });
  }

  late final _$statusAtom = Atom(
      name: 'NotificationDetailScreenViewModelBase.status', context: context);

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
      name: 'NotificationDetailScreenViewModelBase.errorTitle',
      context: context);

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
      name: 'NotificationDetailScreenViewModelBase.errorMessage',
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
      name: 'NotificationDetailScreenViewModelBase.showError',
      context: context);

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

  late final _$updateReadAsyncAction = AsyncAction(
      'NotificationDetailScreenViewModelBase.updateRead',
      context: context);

  @override
  Future<void> updateRead() {
    return _$updateReadAsyncAction.run(() => super.updateRead());
  }

  late final _$NotificationDetailScreenViewModelBaseActionController =
      ActionController(
          name: 'NotificationDetailScreenViewModelBase', context: context);

  @override
  void resetStatus() {
    final _$actionInfo = _$NotificationDetailScreenViewModelBaseActionController
        .startAction(name: 'NotificationDetailScreenViewModelBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$NotificationDetailScreenViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notifyDto: ${notifyDto},
userDto: ${userDto},
status: ${status},
errorTitle: ${errorTitle},
errorMessage: ${errorMessage},
showError: ${showError}
    ''';
  }
}
