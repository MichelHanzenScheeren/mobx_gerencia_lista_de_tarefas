// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListStore on _ListStore, Store {
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid)).value;

  final _$newToDoTitleAtom = Atom(name: '_ListStore.newToDoTitle');

  @override
  String get newToDoTitle {
    _$newToDoTitleAtom.context.enforceReadPolicy(_$newToDoTitleAtom);
    _$newToDoTitleAtom.reportObserved();
    return super.newToDoTitle;
  }

  @override
  set newToDoTitle(String value) {
    _$newToDoTitleAtom.context.conditionallyRunInAction(() {
      super.newToDoTitle = value;
      _$newToDoTitleAtom.reportChanged();
    }, _$newToDoTitleAtom, name: '${_$newToDoTitleAtom.name}_set');
  }

  final _$_ListStoreActionController = ActionController(name: '_ListStore');

  @override
  void setNewToDoTitle(String value) {
    final _$actionInfo = _$_ListStoreActionController.startAction();
    try {
      return super.setNewToDoTitle(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToDoList() {
    final _$actionInfo = _$_ListStoreActionController.startAction();
    try {
      return super.addToDoList();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'newToDoTitle: ${newToDoTitle.toString()},formValid: ${formValid.toString()}';
    return '{$string}';
  }
}
