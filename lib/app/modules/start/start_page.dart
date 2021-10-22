import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:store/app/modules/start/start_store.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final StartStore store = Modular.get<StartStore>();

  @override
  void initState() {
    super.initState();
    store.page = 1;
    Modular.to.navigate('/start/store/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
            selectedFontSize: 20,
            currentIndex: store.page,
            onTap: (index) {
              store.page = index;
              if (index == 0) {
                Modular.to.navigate('/start/settings');
              } else if (index == 1) {
                Modular.to.navigate('/start/store/');
              } else if (index == 2) {
                Modular.to.navigate('/start/profile');
              }
            },
            items: const [
              BottomNavigationBarItem(
                  label: "Settings",
                  icon: Icon(Icons.settings_applications_outlined)),
              BottomNavigationBarItem(
                  label: "Store", icon: Icon(Icons.store_outlined)),
              BottomNavigationBarItem(
                  label: "Profile", icon: Icon(Icons.person_outline)),
            ]);
      }),
    );
  }
}
