// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toDoItemStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ToDoItemStore on _ToDoItemStore, Store {
  Computed<TextDecoration> _$decorationComputed;

  @override
  TextDecoration get decoration => (_$decorationComputed ??=
          Computed<TextDecoration>(() => super.decoration))
      .value;
  Computed<Color> _$colorComputed;

  @override
  Color get color =>
      (_$colorComputed ??= Computed<Color>(() => super.color)).value;
  Computed<Widget> _$iconComputed;

  @override
  Widget get icon =>
      (_$iconComputed ??= Computed<Widget>(() => super.icon)).value;

  final _$finalizedAtom = Atom(name: '_ToDoItemStore.finalized');

  @override
  bool get finalized {
    _$finalizedAtom.context.enforceReadPolicy(_$finalizedAtom);
    _$finalizedAtom.reportObserved();
    return super.finalized;
  }

  @override
  set finalized(bool value) {
    _$finalizedAtom.context.conditionallyRunInAction(() {
      super.finalized = value;
      _$finalizedAtom.reportChanged();
    }, _$finalizedAtom, name: '${_$finalizedAtom.name}_set');
  }

  final _$_ToDoItemStoreActionController =
      ActionController(name: '_ToDoItemStore');

  @override
  void toggleState() {
    final _$actionInfo = _$_ToDoItemStoreActionController.startAction();
    try {
      return super.toggleState();
    } finally {
      _$_ToDoItemStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'finalized: ${finalized.toString()},decoration: ${decoration.toString()},color: ${color.toString()},icon: ${icon.toString()}';
    return '{$string}';
  }
}
