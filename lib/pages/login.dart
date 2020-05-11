import 'package:flutter/material.dart';
import 'package:mobxgerencialistadetarefas/commonFunctions/openPage.dart';
import 'package:mobxgerencialistadetarefas/widgets/customIconButton.dart';
import 'package:mobxgerencialistadetarefas/widgets/customTextField.dart';
import 'toDoList.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CustomTextField(
                    hint: 'E-mail',
                    prefix: Icon(Icons.alternate_email),
                    textInputType: TextInputType.emailAddress,
                    onChanged: (email) {},
                    enabled: true,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hint: 'Senha',
                    prefix: Icon(Icons.lock),
                    obscure: true,
                    onChanged: (pass) {},
                    enabled: true,
                    suffix: CustomIconButton(
                      radius: 32,
                      iconData: Icons.visibility,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 18)),
                      color: theme.primaryColor,
                      disabledColor: theme.primaryColor.withAlpha(100),
                      textColor: Colors.white,
                      onPressed: () {
                        CommonFunctions.openPage(context, ListScreen());
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
