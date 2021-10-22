import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app/modules/login/login_store.dart';
import 'package:store/app/shared/auth/auth_store.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'Profile'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final AuthStore auth = Modular.get<AuthStore>();
  final LoginStore login = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Image.network(auth.user!.photoURL!),
          Text(auth.user!.displayName.toString()),
          Text(auth.user!.email.toString()),
          IconButton(
              onPressed: login.logOut, icon: const Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }
}
