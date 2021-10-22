import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/login/login_module.dart';
import 'package:store/app/modules/login/login_store.dart';
import 'package:store/app/modules/products/products_module.dart';
import 'package:store/app/modules/purchase/purchase_module.dart';
import 'package:store/app/modules/start/start_module.dart';
import 'package:store/app/shared/auth/auth_store.dart';
import 'package:store/app/shared/auth/repositories/auth_repository.dart';
import 'package:store/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:store/app/shared/pages/splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IAuthRepository>((i) => AuthRepository()),
    Bind.singleton((i) => AuthStore()),
    Bind.singleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplashPage()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/start', module: StartModule()),
    ModuleRoute('/products', module: ProductsModule()),
    ModuleRoute('/purchase', module: PurchaseModule()),
  ];
}
