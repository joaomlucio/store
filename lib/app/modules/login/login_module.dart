import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/login/login_page.dart';
import 'package:store/app/modules/login/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage(), transition: TransitionType.fadeIn),
  ];
}
