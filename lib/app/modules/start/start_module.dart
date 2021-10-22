import 'package:store/app/modules/start/pages/profile/profile_page.dart';
import 'package:store/app/modules/start/pages/settings/settings_page.dart';
import 'package:store/app/modules/start/start_Page.dart';
import 'package:store/app/modules/start/start_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/start/submodules/store/store_module.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => StartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const StartPage(),
      children: [
        ModuleRoute('/store', module: StoreModule()),
        ChildRoute('/settings', child: (_, args) => const SettingsPage()),
        ChildRoute('/profile', child: (_, args) => const ProfilePage()),
      ]
    ),
  ];
}
