import 'package:flutter/material.dart';
import 'package:jkb_firebase_app/auth/view/auth_screen.dart';
import 'package:jkb_firebase_app/auth/view/auth_screen_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthScreenProvider());
  }
}
