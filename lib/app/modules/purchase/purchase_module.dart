import 'package:store/app/modules/purchase/purchase_Page.dart';
import 'package:store/app/modules/purchase/purchase_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/purchase/submodules/cart/cart_module.dart';
import 'package:store/app/modules/purchase/submodules/cart/cart_store.dart';

class PurchaseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PurchaseStore(cartStore: i.get<CartStore>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PurchasePage(product: args.data)),
    ModuleRoute('/cart', module: CartModule()),
  ];
}
