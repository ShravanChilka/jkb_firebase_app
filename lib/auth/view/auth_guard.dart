import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/model/user_model.dart';
import 'package:jkb_firebase_app/auth/view/auth_screen.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:jkb_firebase_app/home/view/home_screen_provider.dart';
import 'package:provider/provider.dart';

class AuthGuard extends StatefulWidget {
  const AuthGuard({super.key});

  @override
  State<AuthGuard> createState() => _AuthGuardState();
}

class _AuthGuardState extends State<AuthGuard> {
  @override
  void initState() {
    super.initState();
    context.read<AuthViewModel>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AuthViewModel, UserModel?>(
      selector: (_, vm) => vm.user,
      builder: (context, user, child) {
        if (user == null) {
          return AuthScreen();
        }
        return HomeScreenProvider();
      },
    );
  }
}
