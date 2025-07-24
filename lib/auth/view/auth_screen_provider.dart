import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/view/auth_guard.dart';
import 'package:jkb_firebase_app/auth/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class AuthScreenProvider extends StatelessWidget {
  const AuthScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: AuthGuard(),
    );
  }
}
