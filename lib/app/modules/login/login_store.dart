import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:store/app/shared/auth/auth_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AuthStore auth = Modular.get<AuthStore>();

  @observable
  bool loading = false;

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      var user = await auth.loginWithGoogle();
      if (user != null) {
        Modular.to.navigate('/start/');
      }
    } catch (e) {
      rethrow;
    }
    loading = false;
  }

  //@action
  logOut() {
    Modular.get<AuthStore>().logOut();
    loading = false;
    Modular.to.navigate('/login/');
  }
}
