import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:store/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:store/app/shared/enums/auth_enum.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IAuthRepository _authRepository = Modular.get<IAuthRepository>();

  @observable
  // ignore: avoid_init_to_null
  late User? user = null;

  @observable
  AuthStatus status = AuthStatus.loading;

  @action
  setUser(User? value) {
    user = value;
    status = user == null ? AuthStatus.loggedOff : AuthStatus.loggedIn;
  }

  _AuthStoreBase() {
    _authRepository.getUser().then((value) => setUser(value));
  }

  Future logOut() {
    return _authRepository.logOut();
  }

  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
    return user;
  }
}
