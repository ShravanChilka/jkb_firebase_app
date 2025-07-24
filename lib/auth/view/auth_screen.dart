import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/view/login_screen.dart';
import 'package:jkb_firebase_app/auth/view/register_screen.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JKB Firebase")),
      body: Selector<AuthViewModel, AuthScreenType>(
        selector: (_, vm) => vm.screen,
        builder: (context, screenType, child) {
          if (screenType == AuthScreenType.login) {
            return LoginScreen();
          }
          return RegisterScreen();
        },
      ),
    );
  }
}
