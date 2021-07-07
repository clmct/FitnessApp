import 'package:mobx/mobx.dart';
part 'login_page_state.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // Properties
  @observable
  String username = "";

  @observable
  String password = "";

  @computed
  bool get isValidForm {
    if (password.length >= 3 &&
        password.length <= 9 &&
        _isValidUsername(username) == true) {
      return true;
    } else {
      return false;
    }
  }

  // Public Methods
  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  // Private Methods
  bool _isValidUsername(String string) {
    const allowedCharacters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
    Set<String> restricted = Set();
    final split = string.split('');
    split.forEach((c) {
      if (!allowedCharacters.contains(c)) {
        restricted.add(c);
      }
    });
    if (restricted.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
