import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/shared/auth/auth_store.dart';
import 'package:store/app/shared/enums/auth_enum.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  AuthStore auth = Modular.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Observer(builder: (context) {
          if (auth.status == AuthStatus.loggedOff) {
            Modular.to.pushReplacementNamed('/login/');
            return Container();
          } else if (auth.status == AuthStatus.loggedIn) {
            Modular.to.pushReplacementNamed('/start/');
            return Container();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
