import 'package:mobx/mobx.dart';
part 'loginStore.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool obscurePassword = true;

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisible() => obscurePassword = !obscurePassword;

  @action
  void toggleLoadingState(bool state) => isLoading = state;

  @action
  Future<void> doLogin() async {
    toggleLoadingState(true);
    await Future.delayed(Duration(seconds: 2));
    isLoggedIn = true;
    toggleLoadingState(false);
  }

  @action
  void logout() {
    isLoggedIn = false;
  }

  @computed
  bool get isEmailValid => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?" +
          "^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?" +
          "[0-9])(?=.*?[_+:;?^=%<>!@#\$&*~]).{8,}")
      .hasMatch(password);

  @computed
  Function get loginPress =>
      (isEmailValid && isPasswordValid && !isLoading) ? doLogin : null;
}
