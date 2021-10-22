import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:store/app/modules/login/login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'Login Page'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}
class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
            child: ElevatedButton(
              onPressed: store.loginWithGoogle,
              child: const Text('Login With Google')    
        )
      )
    );
  }
}