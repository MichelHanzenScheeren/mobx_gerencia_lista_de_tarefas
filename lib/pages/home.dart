import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxgerencialistadetarefas/commonFunctions/openPage.dart';
import 'package:mobxgerencialistadetarefas/stores/listStore.dart';
import 'package:mobxgerencialistadetarefas/stores/loginStore.dart';
import 'package:mobxgerencialistadetarefas/widgets/customIconButton.dart';
import 'package:mobxgerencialistadetarefas/widgets/customTextField.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ListStore listStore = ListStore();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 12, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.centerRight,
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Provider.of<LoginStore>(context, listen: false).logout();
                        CommonFunctions.openPage(context, Login());
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 24,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return CustomTextField(
                              hint: 'Tarefa',
                              controller: controller,
                              onChanged: listStore.setNewToDoTitle,
                              onEditingComplete: () {
                                listStore.addToDoList();
                                controller.clear();
                              },
                              suffix: listStore.formValid
                                  ? CustomIconButton(
                                      radius: 32,
                                      iconData: Icons.add,
                                      onTap: () {
                                        listStore.addToDoList();
                                        controller.clear();
                                      },
                                    )
                                  : null,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Observer(
                            builder: (_) {
                              return ListView.separated(
                                itemCount: listStore.toDoList.length,
                                itemBuilder: (context, index) {
                                  return Observer(
                                    builder: (_) {
                                      final item = listStore.toDoList[index];
                                      return ListTile(
                                        contentPadding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                        leading: item.icon,
                                        title: Transform(
                                          transform: Matrix4.translationValues(-20, 0, 0),
                                          child: Text(
                                            item.title,
                                            style: TextStyle(
                                              decoration: item.decoration,
                                              color: item.color,
                                            ),
                                          ),
                                        ),
                                        onTap: item.toggleState,
                                      );
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
