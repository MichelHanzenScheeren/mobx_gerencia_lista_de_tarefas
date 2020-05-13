import 'package:mobx/mobx.dart';
import 'package:mobxgerencialistadetarefas/stores/toDoItemStore.dart';
part 'listStore.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newToDoTitle = "";

  ObservableList<ToDoItemStore> toDoList = ObservableList<ToDoItemStore>();

  @action
  void setNewToDoTitle(String value) => newToDoTitle = value;

  @action
  void addToDoList() {
    toDoList.insert(0, ToDoItemStore(newToDoTitle));
    setNewToDoTitle("");
  }

  @computed
  bool get formValid => newToDoTitle.isNotEmpty;
}
