import 'package:mobx/mobx.dart';
part 'login_page_state.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // Properties
  @observable
  String username = "";

  @observable
  String password = "";

  @observable
  bool isValidUsername = true;

  @observable
  bool isValidPassword = true;

  @computed
  bool get isValidForm {
    if (isValidUsername == true && isValidPassword == true) {
      return true;
    } else {
      return false;
    }
  }

  // Public Methods
  @action
  void setUsername(String value) {
    username = value;
    _validUsername();
  }

  @action
  void setPassword(String value) {
    password = value;
    _validPassword();
  }

  @action
  void login() {
    _validPassword();
    _validUsername();
  }

  void _validPassword() {
    if (password.length >= 3 && password.length <= 9) {
      isValidPassword = true;
    } else {
      isValidPassword = false;
    }
  }

  void _validUsername() {
    const allowedCharacters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
    Set<String> restricted = Set();
    if (username.isEmpty) {
      isValidUsername = false;
      return;
    }
    final split = username.split('');
    split.forEach((c) {
      if (!allowedCharacters.contains(c)) {
        restricted.add(c);
      }
    });
    if (restricted.isEmpty) {
      isValidUsername = true;
    } else {
      isValidUsername = false;
    }
  }
}
