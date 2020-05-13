import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobxgerencialistadetarefas/commonFunctions/openPage.dart';
import 'package:mobxgerencialistadetarefas/stores/loginStore.dart';
import 'package:mobxgerencialistadetarefas/widgets/customIconButton.dart';
import 'package:mobxgerencialistadetarefas/widgets/customTextField.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginStore loginStore;
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    loginStore = Provider.of<LoginStore>(context);
    super.didChangeDependencies();
    disposer = reaction((_) => loginStore.isLoggedIn, (isLoggedIn) {
      if(isLoggedIn) CommonFunctions.openPage(context, Home());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(24),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 24,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: Icon(Icons.alternate_email),
                        textInputType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                        enabled: !loginStore.isLoading,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                        hint: 'Senha',
                        prefix: Icon(Icons.lock),
                        obscure: loginStore.obscurePassword,
                        onChanged: loginStore.setPassword,
                        enabled: !loginStore.isLoading,
                        suffix: CustomIconButton(
                          radius: 24,
                          iconData: loginStore.obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          onTap: loginStore.togglePasswordVisible,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Observer(
                    builder: (_) {
                      return SizedBox(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: loginStore.isLoading
                              ? CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      theme.primaryColor),
                                )
                              : Text('Login', style: TextStyle(fontSize: 18)),
                          color: theme.primaryColor,
                          disabledColor: theme.primaryColor.withOpacity(0.3),
                          textColor: Colors.white,
                          onPressed: loginStore.loginPress,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }


}
