import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part "toDoItemStore.g.dart";

class ToDoItemStore = _ToDoItemStore with _$ToDoItemStore;

abstract class _ToDoItemStore with Store {
  final String title;

  @observable
  bool finalized = false;

  _ToDoItemStore(this.title);

  @action
  void toggleState() => finalized = !finalized;

  @computed
  TextDecoration get decoration =>
      finalized ? TextDecoration.lineThrough : TextDecoration.none;

  @computed
  Color get color => finalized ? Colors.grey : Colors.black87;

  @computed
  Widget get icon => finalized
      ? Icon(Icons.check_box, color: Colors.grey)
      : Icon(Icons.check_box_outline_blank, color: Colors.black87);
}
