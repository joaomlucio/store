import 'package:store/app/modules/start/submodules/store/store_page.dart';
import 'package:store/app/modules/start/submodules/store/store_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StoreStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const StorePage()),
  ];
}
