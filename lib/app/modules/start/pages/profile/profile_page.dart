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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    auth.user!.photoURL!,
                    fit:BoxFit.cover,
                    scale: 1.2,
                  )
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Fullname: ${auth.user!.displayName}"),
                      Text("Email: ${auth.user!.email}"),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: login.logOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("LOGOUT"),
                  Icon(Icons.logout_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
